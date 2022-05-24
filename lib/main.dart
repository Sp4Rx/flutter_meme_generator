import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meme_generator/blocs/meme_editor_bloc.dart';
import 'package:meme_generator/ui/screens/meme_home.dart';
import 'package:meme_generator/ui/screens/meme_text_editor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MemeEditorBloc()..add(LoadMeme()))
      ],
      child: MaterialApp(
        title: 'Meme Generator',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocBuilder<MemeEditorBloc, MemeEditorState>(
          builder: (context, state) {
            if (state is MemeLoaded) {
              return const MemeHome();
            } else if (state is MemeTextEditing) {
              return const MemeTextEditor();
            } else if (state is MemeLoading) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            } else if (state is MemeGenerated) {
              return const Scaffold(
                body: Center(child: Text('Meme Generated check gallery')),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
