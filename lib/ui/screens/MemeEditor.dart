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
      body: BlocBuilder<MemeEditorBloc, MemeEditorState>(
        builder: (context, state) {
          if (state is MemeLoaded) {
            return Center(
                child: Meme(
              imgUrl: state.meme.imageUrl!,
              memeTextObj: state.meme.texts!,
            ));
          }
          return Container();
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
