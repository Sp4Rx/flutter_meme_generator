import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meme_generator/core/utils/extenstions.dart';
import 'package:meme_generator/repository/meme_repo/models/meme_obj.dart';

class MemeText extends StatelessWidget {
  final MemeTextObj data;
  final VoidCallback? onEditPressed;
  final VoidCallback? onDeletePressed;

  const MemeText({
    Key? key,
    required this.data,
    this.onEditPressed,
    this.onDeletePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        margin: const EdgeInsets.all(16),
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
            style: GoogleFonts.getFont(
              data.style!,
              color: data.foregroundColor!.toColor(),
            ),
          ),
        ),
      ),
      if (onEditPressed != null) ...[
        Positioned(
          left: 0,
          top: 0,
          child: Container(
            width: 35,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.lightBlueAccent,
            ),
            child: IconButton(
              tooltip: 'Edit',
              iconSize: 18,
              color: Colors.white,
              icon: const Icon(Icons.edit),
              onPressed: onEditPressed,
            ),
          ),
        ),
      ],
      if (onDeletePressed != null) ...[
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
              tooltip: 'Delete',
              iconSize: 18,
              color: Colors.white,
              icon: const Icon(Icons.delete_forever),
              onPressed: onDeletePressed,
            ),
          ),
        ),
      ],
    ]);
  }
}
