import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meme_generator/blocs/meme_editor_bloc.dart';
import 'package:meme_generator/repository/meme_repo/models/meme_obj.dart';

class MemeTextEditor extends StatelessWidget {
  const MemeTextEditor({Key? key}) : super(key: key);
  static const List<String> _fonts = [
    'Roboto',
    'Monoton',
    'Lato',
    'Oswald',
    'Raleway',
    'Macondo',
    'Smooch',
    'Odibee Sans',
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<MemeEditorBloc>().add(EditTextBackPressed());
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Text Editor'),
        ),
        body: BlocConsumer<MemeEditorBloc, MemeEditorState>(
          listener: (BuildContext context, state) {},
          buildWhen: (prevState, currentState) {
            return currentState is MemeTextEditing;
          },
          builder: (context, state) {
            if (state is MemeTextEditing) {
              MemeTextObj memeTextObj = state.meme.texts![state.idPos];
              TextEditingController controller =
                  TextEditingController(text: memeTextObj.textData);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        maxLines: null,
                        controller: controller,
                        style: GoogleFonts.getFont(
                          _fonts[1],
                        ),
                      ),
                      SizedBox.fromSize(
                        size: const Size(0, 20),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ..._fonts.map(
                              (e) => Container(
                                height: 30,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    e,
                                    style: GoogleFonts.getFont(e),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox.fromSize(
                        size: const Size(0, 20),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<MemeEditorBloc>().add(
                                EditTextSavePressed(
                                  controller.text,
                                ),
                              );
                          Navigator.pop(context);
                        },
                        child: const Text('Save'),
                      ),
                    ],
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
