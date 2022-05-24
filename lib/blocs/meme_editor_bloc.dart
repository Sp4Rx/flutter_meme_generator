import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meme_generator/repository/meme_repo/meme_repo.dart';
import 'package:meme_generator/repository/meme_repo/models/meme_obj.dart';

part 'meme_editor_event.dart';
part 'meme_editor_state.dart';

class MemeEditorBloc extends Bloc<MemeEditorEvent, MemeEditorState> {
  final MemeRepo _memeRepo = MemeRepo();

  MemeEditorBloc() : super(MemeEditorInitial()) {
    on<LoadMeme>(_handleLoadMeme);
    on<GenerateMeme>(_handleGenerateMeme);
    on<AddText>(_handleAddText);
    on<EditText>(_handleEditText);
    on<DeleteText>(_handleDeleteText);
  }

  FutureOr<void> _handleLoadMeme(
      LoadMeme event, Emitter<MemeEditorState> emit) async {
    emit(MemeLoading());
    final memes = await _memeRepo.getMemes();
    //return only one meme for testing only
    emit(MemeLoaded(memes[0]));
  }

  FutureOr<void> _handleGenerateMeme(
      GenerateMeme event, Emitter<MemeEditorState> emit) {}

  FutureOr<void> _handleAddText(AddText event, Emitter<MemeEditorState> emit) {
    final state = this.state;
    if (state is MemeLoaded) {
      emit(
        MemeLoaded(state.meme.copyWith(
          texts: List.from(state.meme.texts!)
            ..add(MemeTextObj.fromJson({
              "textData": "Demo",
              "xPos": Random().nextInt(10) + 1,
              "yPos": Random().nextInt(10) + 1,
              "maxWidth": 120,
              "maxHeight": 100,
              "style": "Roboto",
              "fontSize": 12,
              "hAlignment": "center",
              "vAlignment": "center",
              "opacity": 1,
              "foregroundColor": "#000000",
              "bgColor": "#FFFFFF"
            })),
        )),
      );
    }
  }

  FutureOr<void> _handleEditText(
      EditText event, Emitter<MemeEditorState> emit) {}

  FutureOr<void> _handleDeleteText(
      DeleteText event, Emitter<MemeEditorState> emit) {
    final state = this.state;
    if (state is MemeLoaded) {
      emit(MemeLoaded(state.meme.copyWith(
        texts: List.from(state.meme.texts!)..removeAt(event.position),
      )));
    }
  }
}
