part of 'meme_editor_bloc.dart';

@immutable
abstract class MemeEditorState {}

class MemeEditorInitial extends MemeEditorState {}

class MemeLoading extends MemeEditorState {}

class MemeLoaded extends MemeEditorState {
  final MemeObj meme;

  MemeLoaded(this.meme);
}

class GeneratingMeme extends MemeEditorState {}

class MemeGenerated extends MemeEditorState {}
