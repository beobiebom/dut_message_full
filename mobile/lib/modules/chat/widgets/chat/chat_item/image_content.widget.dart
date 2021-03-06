import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile/data/models/message.model.dart';
import 'package:get/get.dart';

class ImageContent extends StatelessWidget {
  final MessageModel message;

  const ImageContent({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: message.realContent,
      placeholder: (context, url) {
        return SizedBox(
          width: Get.width / 2 + 40,
          height: 60,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
      errorWidget: (context, url, error) => const Icon(Icons.error),
      width: Get.width / 2 + 40,
    );
  }
}
