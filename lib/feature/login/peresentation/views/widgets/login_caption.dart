import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class LoginCaption extends StatelessWidget {
  const LoginCaption({
    super.key, required this.title, required this.caption,
  });
final String title;
final String caption;
  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.black,
            ),
          ),
          Opacity(
            opacity: .5,
            child: Text(
              caption,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}