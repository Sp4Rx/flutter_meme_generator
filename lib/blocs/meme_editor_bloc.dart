import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meme_generator/repository/meme_repo/meme_repo.dart';
import 'package:meme_generator/repository/meme_repo/models/meme_obj.dart';

part 'meme_editor_event.dart';
part 'meme_editor_state.dart';

class MemeEditorBloc extends Bloc<MemeEditorEvent, MemeEditorState> {
  final MemeRepo memeRepo = MemeRepo();

  MemeEditorBloc() : super(MemeEditorInitial()) {
    on<LoadMeme>(_handleLoadMeme);
    on<GenerateMeme>(_handleGenerateMeme);
    on<AddText>(_handleAddText);
    on<EditText>(_handleEditText);
  }

  FutureOr<void> _handleLoadMeme(
      LoadMeme event, Emitter<MemeEditorState> emit) async {
    emit(LoadingMeme());
    final memes = await memeRepo.getMemes();
    //return only one meme for testing only
    emit(MemeLoaded(memes[0]));
  }

  FutureOr<void> _handleGenerateMeme(
      GenerateMeme event, Emitter<MemeEditorState> emit) {}

  FutureOr<void> _handleAddText(AddText event, Emitter<MemeEditorState> emit) {}

  FutureOr<void> _handleEditText(
      EditText event, Emitter<MemeEditorState> emit) {}
}
