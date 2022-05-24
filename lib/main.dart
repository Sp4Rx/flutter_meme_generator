import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meme_generator/blocs/meme_editor_bloc.dart';
import 'package:meme_generator/ui/screens/MemeEditor.dart';

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
        home: const MemeEditor(),
      ),
    );
  }
}
