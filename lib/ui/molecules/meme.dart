import 'package:flutter/material.dart';
import 'package:meme_generator/repository/meme_repo/models/meme_obj.dart';
import 'package:meme_generator/ui/atoms/MemeImage.dart';
import 'package:meme_generator/ui/atoms/MemeText.dart';

class Meme extends StatelessWidget {
  final String imgUrl;
  final List<MemeTextObj> memeTextObj;

  const Meme({
    Key? key,
    required this.imgUrl,
    required this.memeTextObj,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          MemeImage(
            imgUrl: imgUrl,
          ),
          ...memeTextObj.map(
            (e) => Positioned(
              left: e.xPos!.toDouble(),
              top: e.yPos!.toDouble(),
              child: MemeText(
                data: e,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
