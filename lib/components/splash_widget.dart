import 'package:flutter/material.dart';
import 'package:rps/game_view.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: GameView(),
      duration: 3000,
      imageSize: 230,
      imageSrc: "assets/images/logo.png",
      text: "Rock - Paper - Scissors",
      textType: TextType.TyperAnimatedText,
      textStyle: TextStyle(
        fontSize: 30.0,
      ),
      backgroundColor: Colors.white,
    );
  }
}
