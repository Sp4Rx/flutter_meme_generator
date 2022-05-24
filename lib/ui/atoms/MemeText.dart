import 'package:flutter/material.dart';
import 'package:meme_generator/core/utils/extenstions.dart';
import 'package:meme_generator/repository/meme_repo/models/meme_obj.dart';

class MemeText extends StatelessWidget {
  final MemeTextObj data;
  final VoidCallback? onEditPressed;

  const MemeText({
    Key? key,
    required this.data,
    this.onEditPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        margin: const EdgeInsets.only(
          top: 16,
          right: 16,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
            width: 2,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        width: data.maxWidth!.toDouble(),
        height: data.maxWidth!.toDouble(),
        child: Center(
          child: Text(
            data.textData!,
            style: TextStyle(
              color: data.foregroundColor!.toColor(),
            ),
          ),
        ),
      ),
      Positioned(
        right: 0,
        top: 0,
        child: Container(
          width: 35,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.lightBlueAccent,
          ),
          child: IconButton(
            iconSize: 18,
            color: Colors.white,
            icon: const Icon(Icons.edit),
            onPressed: onEditPressed,
          ),
        ),
      ),
    ]);
  }
}
