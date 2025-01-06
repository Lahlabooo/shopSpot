


import 'package:flutter/material.dart';
class SignInButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  final Color? iconColor;
  final Color textColor;
  final Color? borderColor;
  final VoidCallback onPressed;
final double height;
final double width ;
  const SignInButton({super.key,
    required this.text,
    required this.icon,
    required this.color,
    required this.textColor,
    required this.onPressed,
    this.borderColor, required this.height, required this.width,  this.iconColor,
  });
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: height,width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor, backgroundColor: color,
          side: borderColor != null ? BorderSide(color: borderColor!) : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: size.width*.05, color:iconColor?? textColor),
            SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                fontSize:size.width*.03,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}