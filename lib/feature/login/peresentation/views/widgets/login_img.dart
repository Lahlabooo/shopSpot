import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
class LoginImg extends StatelessWidget {
  const LoginImg({
    super.key,
    required this.size,
    required this.isDarkMode, required this.darkImg, required this.lightImg,
  });
final String darkImg;
final String lightImg;
  final Size size;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: SizedBox(
        height: size.height * .42,
        child: Image.asset(
          isDarkMode ? darkImg: lightImg,

        ),
      ),
    );
  }
}