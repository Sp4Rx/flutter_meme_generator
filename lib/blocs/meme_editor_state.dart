part of 'meme_editor_bloc.dart';

@immutable
abstract class MemeEditorState {}

class MemeEditorInitial extends MemeEditorState {}

class MemeLoading extends MemeEditorState {}

class MemeLoaded extends MemeEditorState {
  final MemeObj meme;

  MemeLoaded(this.meme);
}

class MemeTextEditing extends MemeEditorState {
  final int idPos;
  final MemeObj meme;

  MemeTextEditing(this.idPos, this.meme);
}

class MemeGenerated extends MemeEditorState {}
