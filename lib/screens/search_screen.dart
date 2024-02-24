import 'package:club_92/components/reusableWidgets/custom_speaker_tile.dart';
import 'package:club_92/constants/color.dart';
import 'package:club_92/constants/room_list.dart';
import 'package:club_92/constants/speaker.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabcontroller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    tabcontroller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: _focusNode.hasFocus
                        ? Theme.of(context).colorScheme.background
                        : Theme.of(context).colorScheme.onSurface,
                    width: 2,
                  ),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Focus(
                        onFocusChange: (value) {
                          setState(() {});
                        },
                        child: TextField(
                          focusNode: _focusNode,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search People and Rooms',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: textFieldColor,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: TabBar(
                      indicator: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelPadding: const EdgeInsets.all(10),
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: Theme.of(context).colorScheme.onPrimary,
                      dividerHeight: 0,
                      controller: tabcontroller,
                      tabs: const [
                        Text('People'),
                        Text('Room'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: tabcontroller,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'People you may follow',
                                style: TextStyle(fontSize: 15),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) =>
                                      CustomSpeakerTile(
                                    profileImage:
                                        listOfSpeakers[index].profileImage,
                                    name: listOfSpeakers[index].name,
                                    isSearchSceen: true,
                                    index: index,
                                  ),
                                  itemCount: listOfSpeakers.length,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ListView.builder(
                            itemCount: listOfRooms.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: InkWell(
                                onTap: () {},
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            listOfRooms[index].coverImage,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              listOfRooms[index].name,
                                              style: const TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              Icons.flag,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              size: 20,
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '${listOfRooms[index].members} Members',
                                              style: Theme.of(context)
                                                  .primaryTextTheme
                                                  .bodySmall,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              height: 5,
                                              width: 5,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              '${listOfRooms[index].followers} followers',
                                              style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
