import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final mediaHeight = MediaQuery.of(context).size.height;
    final controller = Get.put(HomeScreenController());
    return Scaffold(
      backgroundColor: CupertinoColors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => controller.addScore(false),
                  child: Container(
                    width: mediaHeight / 2,
                    height: mediaWidth / 3,
                    color: Colors.lightBlueAccent,
                    child: Center(
                      child: Obx(
                        () => Text(
                          "${controller.leftScore}",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 7,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  width: mediaWidth / 8,
                  height: mediaHeight / 3,
                  color: Colors.lightBlueAccent,
                  child: Center(
                    child: Obx(
                      () => Text(
                        "${controller.leftPoint}",
                        style: TextStyle(
                          fontSize: mediaWidth / 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 40),
                Container(
                  width: mediaWidth / 8,
                  height: mediaHeight / 3,
                  color: Colors.redAccent,
                  child: Center(
                    child: Obx(
                      () => Text(
                        "${controller.rightPoint}",
                        style: TextStyle(
                          fontSize: mediaWidth / 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () => controller.addScore(true),
                  child: Container(
                    width: mediaHeight / 2,
                    height: mediaWidth / 3,
                    color: Colors.redAccent,
                    child: Center(
                      child: Obx(
                        () => Text(
                          "${controller.rightScore}",
                          style: TextStyle(
                            fontSize: mediaWidth / 7,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
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
      floatingActionButton: SizedBox(
        width: 80,
        height: 80,
        child: FloatingActionButton(
          onPressed: () {
            openDialog(context: context);
          },
          backgroundColor: Colors.black,
          child: const Icon(
            Icons.refresh,
            size: 40,
          ),
        ),
      ),
    );
  }

  void openDialog({required BuildContext context}) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text(
            '得点のリセット',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
          content: Text(
            '\n'
            '今までの記録が消えてしまいます\n'
            '大切な記録が消えてしまいます\n'
            '本当によろしいでしょうか？'
            '\n',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          actions: [
            CupertinoDialogAction(
              child: const Text("OK"),
              onPressed: () {
                //TODO 得点をリセットする。
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: const Text(
                "キャンセル",
                style: TextStyle(
                  color: Colors.redAccent,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
