import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyCachedNetworkImage extends StatelessWidget {
  const MyCachedNetworkImage({
    super.key,
    this.height = 50,
    this.width = 50,
    this.borderRadius = 15,
    this.index,
    required this.profileImage,
  });
  final int? index;
  final double height;
  final double width;
  final double borderRadius;
  final String profileImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          color: (index != null && (index! % 2) == 0)
              ? Theme.of(context).colorScheme.primary
              : Colors.grey.shade100,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(borderRadius + 1.5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius - 1.5),
        child: CachedNetworkImage(
          imageUrl: profileImage,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
