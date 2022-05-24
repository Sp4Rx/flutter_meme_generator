part of 'meme_editor_bloc.dart';

@immutable
abstract class MemeEditorEvent {}

class LoadMeme extends MemeEditorEvent {}

class GenerateMeme extends MemeEditorEvent {}

class AddText extends MemeEditorEvent {}

class EditText extends MemeEditorEvent {
  final int idPos;
  final MemeTextObj memeText;

  EditText(this.idPos, this.memeText);
}
