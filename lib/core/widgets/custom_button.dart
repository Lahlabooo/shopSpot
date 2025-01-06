import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
     this.onTap,
    required this.text,
    required this.width,
    this.color = Colors.black,
    this.height = 50,
    this.textStyle,
    this.borderRadius = 20,
    this.border = false, this.borderColor,
  });
final Color? borderColor;
  final void Function()? onTap;
  final String text;
  final double width;
  final Color color;
  final double height;
  final TextStyle? textStyle;
  final double? borderRadius;
  final bool border;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      hoverColor: Colors.transparent,
      borderRadius: BorderRadius.circular(borderRadius!),
      child: Container(
        alignment: Alignment.center,
        width: width ,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius!),
          color: color,
          border: border
              ? Border.all(
                  color:borderColor?? Colors.black,
                  style: BorderStyle.solid,
                  width: .9,
                )
              : null,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: textStyle ??
              Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}



