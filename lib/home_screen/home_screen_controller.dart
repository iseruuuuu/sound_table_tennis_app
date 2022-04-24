import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  HomeScreenController() {
    tts.setLanguage('en-US');
    tts.setSpeechRate(0.5);
  }

  //TODO 点数
  var rightScore = 0.obs;
  var leftScore = 0.obs;

  //TODO マッチポイント
  var rightPoint = 0.obs;
  var leftPoint = 0.obs;
  final FlutterTts tts = FlutterTts();

  Future<void> speak() async {
    await tts.speak('${rightScore.value} - ${leftScore.value}');
  }

  Future<void> addScore(bool isScore) async {
    //true -> 右　　　　false -> 左
    if (isScore) {
      if (rightScore.value >= 11) {
        addPoint(true);
        rightScore.value = 0;
      } else {
        rightScore.value++;
      }
    } else {
      if (leftScore.value >= 11) {
        addPoint(false);
        leftScore.value = 0;
      } else {
        leftScore.value++;
      }
    }
    speak();
  }

  Future<void> reduceScore(bool isScore) async {
    //true -> 右　　　　false -> 左
    if (isScore) {
      if (rightScore.value <= 0) {
      } else {
        rightScore.value--;
      }
    } else {
      if (leftScore.value <= 0) {
      } else {
        leftScore.value--;
      }
    }
    speak();
  }

  void addPoint(bool isScore) {
    if (isScore) {
      if (rightPoint.value >= 3) {
        print('右の勝ちだよ〜〜〜');
      } else {
        rightPoint.value++;
      }
    } else {
      if (leftPoint.value >= 3) {
        print('左の勝ちだよ〜〜');
      } else {
        leftPoint.value++;
      }
    }
  }
}
