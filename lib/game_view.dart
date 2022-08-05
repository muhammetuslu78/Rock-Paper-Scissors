import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rps/constants.dart';
import 'package:rps/views/theme_settings_view.dart';

class GameView extends StatefulWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  int userScore = 0;
  int rivalScore = 0;
  int userNum = 1;
  int _rivalNum = 1;
  Random random = Random();

  getSign(int signNum) {
    if (signNum == 1) {
      userNum = 1;
      if (_rivalNum == 1) {
      } else if (_rivalNum == 2) {
        rivalScore++;
      } else {
        userScore++;
      }
    } else if (signNum == 2) {
      userNum = 2;
      if (_rivalNum == 1) {
        userScore++;
      } else if (_rivalNum == 2) {
      } else {
        rivalScore++;
      }
    } else {
      userNum = 3;
      if (_rivalNum == 1) {
        rivalScore++;
      } else if (_rivalNum == 2) {
        userScore++;
      } else {}
    }

    if (rivalScore == 10) {
      _showMyDialog(false);
      userScore = 0;
      rivalScore = 0;
    } else if (userScore == 10) {
      _showMyDialog(true);
      userScore = 0;
      rivalScore = 0;
    }
  }

  Future<void> _showMyDialog(bool winner) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: winner ? Text('Congratulations, You Won') : Text('You Lose'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Do you want to play again?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Play Again'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '${userScore}',
                    style: scoreBoardStyle,
                  ),
                  Text(
                    '${rivalScore}',
                    style: scoreBoardStyle,
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(image: AssetImage('assets/images/l${userNum}.png')),
                  Image(image: AssetImage('assets/images/r${_rivalNum}.png'))
                ],
              ),
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _rivalNum = 1 + random.nextInt(4 - 1);
                        getSign(1);
                        print(_rivalNum);
                      });
                    },
                    child: Text('Rock')),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _rivalNum = 1 + random.nextInt(4 - 1);
                        getSign(2);
                        print(_rivalNum);
                      });
                    },
                    child: Text('Paper')),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _rivalNum = 1 + random.nextInt(4 - 1);
                        getSign(3);
                        print(_rivalNum);
                      });
                    },
                    child: Text('Scissors'))
              ],
            ))
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ThemeSettingsView()));
            },
            icon: Icon(Icons.settings))
      ],
      centerTitle: true,
      title: Text('Rock - Paper - Scissors'),
    );
  }
}
