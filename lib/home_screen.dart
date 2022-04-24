import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String lastWords = "";
  String lastError = '';
  String lastStatus = '';

  //TODO 点数
  int rightScore = 0;
  int leftScore = 0;

  //TODO マッチポイント
  int rightPoint = 0;
  int leftPoint = 0;

  void addScore(bool isScore) {
    //右 true 左 false
    if (isScore) {
      if (rightScore >= 11) {
        addPoint(true);
        setState(() {
          rightScore = 0;
        });
      } else {
        setState(() {
          rightScore++;
        });
      }
    } else {
      if (leftScore >= 11) {
        addPoint(false);
        setState(() {
          leftScore = 0;
        });
      } else {
        setState(() {
          leftScore++;
        });
      }
    }
  }

  void addPoint(bool isScore) {
    if (isScore) {
      if (rightPoint >= 3) {
        print('右の勝ちだよ〜〜〜');
      } else {
        setState(() {
          rightPoint++;
        });
      }
    } else {
      if (leftPoint >= 3) {
        print('左の勝ちだよ〜〜');
      } else {
        setState(() {
          leftPoint++;
        });
      }
    }
  }

  void status(String status) {
    setState(() {
      lastStatus = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final mediaHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$leftPoint - $rightPoint',
        ),
      ),
      body: Column(
        children: [
          Text(
            '変換文字:$lastWords',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            'ステータス : $lastStatus',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => addScore(false),
                  child: Container(
                    width: mediaHeight / 2,
                    height: mediaWidth / 4,
                    color: Colors.grey,
                    child: Center(
                      child: Text(
                        "$leftScore",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 5,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  '-',
                  style: TextStyle(
                    fontSize: mediaWidth / 5,
                  ),
                ),
                GestureDetector(
                  onTap: () => addScore(true),
                  child: Container(
                    width: mediaHeight / 2,
                    height: mediaWidth / 4,
                    color: Colors.lightBlueAccent,
                    child: Center(
                      child: Text(
                        "$rightScore",
                        style: TextStyle(
                          fontSize: mediaWidth / 5,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
