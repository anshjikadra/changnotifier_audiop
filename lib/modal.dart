import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

class modal extends ChangeNotifier
{
  OnAudioQuery  _audioQuery =OnAudioQuery();
  //======================================================

  List<SongModel> songs=[];

  Future<List<SongModel>> get_song()async {
    List<SongModel> songList=await _audioQuery.querySongs();
    // print(songList);
    return songList;
  }

  //========================================================

  PageController pageController = PageController();
  double current_time = 0;
  final player = AudioPlayer();
  bool play = false;

  //Printduration

  String printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    if (duration.inHours > 0)
      return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    else
      return "$twoDigitMinutes:$twoDigitSeconds";
  }

}