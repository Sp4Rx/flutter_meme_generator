import 'package:flutter/material.dart';
import 'package:meme_generator/repository/meme_repo/models/meme_obj.dart';
import 'package:meme_generator/ui/atoms/MemeImage.dart';
import 'package:meme_generator/ui/atoms/MemeText.dart';

class Meme extends StatelessWidget {
  final String imgUrl;
  final List<MemeTextObj> memeTextObj;
  final Function(int position) onEditTextPressed;
  final Function(int position) onDeleteTextPressed;

  const Meme({
    Key? key,
    required this.imgUrl,
    required this.memeTextObj,
    required this.onDeleteTextPressed,
    required this.onEditTextPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MemeImage(
          imgUrl: imgUrl,
        ),
        ...memeTextObj.asMap().entries.map(
              (e) => Positioned(
                left: e.value.xPos!
                    .toDouble(), //TODO: Add proper null checks later
                top: e.value.yPos!.toDouble(),
                child: MemeText(
                  data: e.value,
                  onDeletePressed: () {
                    onDeleteTextPressed(e.key);
                  },
                  onEditPressed: () {
                    onEditTextPressed(e.key);
                  },
                ),
              ),
            ),
      ],
    );
  }
}
