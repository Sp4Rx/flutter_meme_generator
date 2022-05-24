import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meme_generator/blocs/meme_editor_bloc.dart';
import 'package:meme_generator/ui/molecules/meme.dart';

class MemeEditor extends StatefulWidget {
  const MemeEditor({
    Key? key,
  }) : super(key: key);

  @override
  State<MemeEditor> createState() => _MemeEditorState();
}

class _MemeEditorState extends State<MemeEditor> {
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
      body: BlocConsumer<MemeEditorBloc, MemeEditorState>(
        listener: (BuildContext context, state) {},
        buildWhen: (prevState, currentState) {
          return currentState is! MemeTextEditing;
        },
        builder: (context, state) {
          if (state is MemeLoaded) {
            return Center(
              child: Meme(
                imgUrl: state.meme.imageUrl!,
                memeTextObj: state.meme.texts!,
                onDeleteTextPressed: (int position) {
                  context.read<MemeEditorBloc>().add(DeleteText(position));
                },
                onEditTextPressed: (int position) {
                  context.read<MemeEditorBloc>().add(EditText(position));
                },
              ),
            );
          } else if (state is MemeLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Container();
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
