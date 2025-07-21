import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFields extends StatefulWidget {
  final TextEditingController? controller;
  final String? suffixIcon;
  final String? hint;
  final Function(String?)? validationFunction;
  const CustomTextFields({super.key,required this.controller,required this.suffixIcon,required this.validationFunction,required this.hint});

  @override
  State<CustomTextFields> createState() => _CustomTextFieldsState();
}

class _CustomTextFieldsState extends State<CustomTextFields> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 4),
          )
        ]
      ),
      child: Center(
        child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          fillColor: Colors.white,
            suffixIcon: widget.suffixIcon != null
                ? Padding(
              padding: const EdgeInsets.only(right: 10), // Optional space to the right
              child: SvgPicture.asset(
                widget.suffixIcon!,
                width: 16,
                height: 16,
              ),
            )
                : null,
          border: InputBorder.none,
          hint: Text(widget.hint ?? "",style: TextStyle(
            fontFamily: 'raleway',
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: Colors.black 
          ),)
        ),
            ),
      ),
    );
  }
}