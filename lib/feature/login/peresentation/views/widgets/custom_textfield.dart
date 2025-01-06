import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      this.hintText,
      this.prefixIcon,
      required this.fillColor,
      this.borderStyle = BorderStyle.solid,
      this.validator,
      required this.height,
      required this.width,
      this.maxLines = 1,
      this.keyboardType,
      this.onSaved,
      this.suffixIcon, this.obscureText,});
  final String? hintText;
  final IconData? prefixIcon;
  final Color fillColor;
  final BorderStyle? borderStyle;
  final String? Function(String?)? validator;
  final IconData? suffixIcon;
  final double height, width;
  final int? maxLines;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
 final bool? obscureText;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}
late bool isVisible ;
class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void initState() {
    super.initState();
    isVisible = true;
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: TextFormField(
        textAlign: TextAlign.start,
        style: const TextStyle(color: Colors.black),
        keyboardType: widget.keyboardType,
        maxLines: widget.maxLines,
        onSaved: widget.onSaved,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "fill this label";
          }
          return null;
        },
        obscureText:widget.obscureText!=null?isVisible:false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.fillColor,
          hintText: widget.hintText,
           prefixIconColor: Colors.black,
          suffixIconColor: Colors.black,
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 10),
            child: widget.suffixIcon != null
                ? IconButton(
                    onPressed: () {
                      setState(() {
                       isVisible=!isVisible;
                      });
                    },
                    icon: Icon(
                      isVisible?widget.suffixIcon:FontAwesomeIcons.eyeSlash,
                    ),
                  )
                : SizedBox(),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          prefixIcon: Opacity(
              opacity: .7,
              child: widget.prefixIcon != null
                  ? Icon(widget.prefixIcon)
                  : SizedBox()),
          // hintStyle: ,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.black.withOpacity(.6),
              style: widget.borderStyle!,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.withOpacity(.6)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
