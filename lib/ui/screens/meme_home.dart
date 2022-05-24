import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meme_generator/blocs/meme_editor_bloc.dart';
import 'package:meme_generator/ui/molecules/meme.dart';
import 'package:meme_generator/ui/screens/meme_text_editor.dart';

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
      body: BlocConsumer<MemeEditorBloc, MemeEditorState>(
        listener: (BuildContext context, state) {
          if (state is MemeTextEditing) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MemeTextEditor()),
            );
          }
        },
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
          return const SizedBox.shrink();
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
