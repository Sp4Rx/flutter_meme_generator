import 'package:flutter/material.dart';
import 'package:meme_generator/core/api_client.dart';
import 'package:meme_generator/repository/apis.dart';
import 'package:meme_generator/repository/meme_repo/models/meme_obj.dart';

class MemeRepo {
  final ApiClient _apiClient = ApiClient();

  Future<List<MemeObj>> getMemes() async {
    List<MemeObj> memes = [];
    try {
      final response = await _apiClient.get(Apis.memeApi) as List;
      for (var element in response) {
        memes.add(MemeObj.fromJson(element));
      }
    } catch (_) {
      debugPrint(_.toString());
    }
    return memes;
  }
}
