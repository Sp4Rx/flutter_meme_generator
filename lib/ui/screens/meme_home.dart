import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meme_generator/blocs/meme_editor_bloc.dart';
import 'package:meme_generator/ui/molecules/meme.dart';
import 'package:screenshot/screenshot.dart';

class MemeHome extends StatefulWidget {
  const MemeHome({
    Key? key,
  }) : super(key: key);

  @override
  State<MemeHome> createState() => _MemeHomeState();
}

class _MemeHomeState extends State<MemeHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meme 🤪'),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add new text',
        onPressed: () {
          context.read<MemeEditorBloc>().add(AddText());
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<MemeEditorBloc, MemeEditorState>(
        buildWhen: (prevState, currentState) {
          return currentState is MemeLoaded;
        },
        builder: (context, state) {
          if (state is MemeLoaded) {
            ScreenshotController controller = ScreenshotController();
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Screenshot(
                    controller: controller,
                    child: Meme(
                      imgUrl: state.meme.imageUrl!,
                      memeTextObj: state.meme.texts!,
                      onDeleteTextPressed: (int position) {
                        context
                            .read<MemeEditorBloc>()
                            .add(DeleteText(position));
                      },
                      onEditTextPressed: (int position) {
                        context.read<MemeEditorBloc>().add(EditText(position));
                      },
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  ElevatedButton(
                    onPressed: () {
                      context.read<MemeEditorBloc>().add(
                            GenerateMeme(controller),
                          );
                    },
                    child: const Text('Save to gallery'),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
