import 'package:club_92/models/chat_model.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final ChatModel sender;
  const ChatScreen({
    super.key,
    required this.sender,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<bool> _isSelectedList = [];
  bool _isSelectionModeActive = false;

  @override
  void initState() {
    super.initState();
    _isSelectedList = List.filled(20, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.sender.sender,
        ),
        actions: [
          if (_isSelectionModeActive)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  List<int> selectedMessagesIndexes = [];
                  for (int i = 0; i < _isSelectedList.length; i++) {
                    if (_isSelectedList[i]) {
                      selectedMessagesIndexes.add(i);
                    }
                  }

                  _clearSelection();
                });
              },
            ),
          if (_isSelectionModeActive)
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
              ),
            )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: 20,
              itemBuilder: (context, index) {
                bool isMe = index % 2 == 0;

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: _isSelectedList[index]
                          ? Colors.blue[200]
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 2),
                      child: Row(
                        mainAxisAlignment: isMe
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          if (!isMe)
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(
                                widget.sender.profileImage,
                              ),
                            ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onLongPress: () {
                              if (!_isSelectionModeActive) {
                                _toggleSelection(index);
                              }
                            },
                            onTap: () {
                              if (_isSelectionModeActive) {
                                _toggleSelection(index);
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 15,
                              ),
                              decoration: BoxDecoration(
                                color: _isSelectedList[index]
                                    ? Colors.blue[200]
                                    : (isMe
                                        ? Colors.deepPurple[100]
                                        : Colors.grey[300]),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                'This is testing message $index',
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          if (isMe)
                            const CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjOOQLYeoZtOLftSG_sqMn0EiqyX4t9-lwAuhOtit5DtPiefzbW6-3eEcSTvGPmh-VBb8&usqp=CAU',
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                )),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.attach_file),
                ),
                const Expanded(
                  child: TextField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.camera_alt),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.send,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _toggleSelection(int index) {
    setState(() {
      _isSelectedList[index] = !_isSelectedList[index];
      _isSelectionModeActive = _isSelectedList.any((isSelected) => isSelected);
    });
  }

  void _clearSelection() {
    setState(() {
      _isSelectedList = List.filled(20, false); // Reset all selections
      _isSelectionModeActive = false;
    });
  }
}
