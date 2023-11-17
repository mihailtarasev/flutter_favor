import 'package:audioplayers/audioplayers.dart';

class SoundService {
  final player = AudioPlayer();
  static String alarmAudioPath = "thud_2.mp3";

  void play() async {
    player.play(AssetSource(alarmAudioPath));
  }
}
