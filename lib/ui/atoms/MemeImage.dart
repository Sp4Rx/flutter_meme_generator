import 'package:flutter/material.dart';

class MemeImage extends StatelessWidget {
  final String? imgUrl;

  const MemeImage({Key? key, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imgUrl == null || imgUrl!.isEmpty) {
      return Container(
        color: Colors.black,
        height: 100,
        width: 100,
      );
    }
    return Container(
      color: Colors.amber,
      child: Image.network(imgUrl!),
    );
  }
}
