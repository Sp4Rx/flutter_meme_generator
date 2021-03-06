part of 'meme_editor_bloc.dart';

@immutable
abstract class MemeEditorEvent {}

class LoadMeme extends MemeEditorEvent {}

class GenerateMeme extends MemeEditorEvent {
  final ScreenshotController screenshotController;

  GenerateMeme(this.screenshotController);
}

class AddText extends MemeEditorEvent {}

class DeleteText extends MemeEditorEvent {
  final int position;

  DeleteText(this.position);
}

class EditText extends MemeEditorEvent {
  final int idPos;

  EditText(this.idPos);
}

class EditTextBackPressed extends MemeEditorEvent {}

class EditTextSavePressed extends MemeEditorEvent {
  final String textData;

  EditTextSavePressed(this.textData);
}

class EditTextFontChangePressed extends MemeEditorEvent {
  final String fontFamily;

  EditTextFontChangePressed(this.fontFamily);
}
