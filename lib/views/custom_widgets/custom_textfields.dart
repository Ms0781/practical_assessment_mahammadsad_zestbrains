import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:practical_assessment_mahammadsad_zestbrains/controller/login_controller.dart';
import 'package:provider/provider.dart';

import '../../utils/app_colors.dart';

class CustomTextFields extends StatefulWidget {
  final TextEditingController? controller;
  final String? suffixIcon;
  final String? hint;
  final double? margin;
  final FormFieldValidator<String>? validationFunction;
  final bool? isObscureText;
  final bool passwordVisibility;
  const CustomTextFields({super.key,required this.controller,required this.suffixIcon,required this.validationFunction,required this.hint, this.margin, this.isObscureText, required this.passwordVisibility});

  @override
  State<CustomTextFields> createState() => _CustomTextFieldsState();
}

class _CustomTextFieldsState extends State<CustomTextFields> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(horizontal: widget.margin ?? 0),
      constraints: BoxConstraints(
        minHeight: 60
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: Offset(0, 4),
          )
        ]
      ),
      child: Center(
        child: Consumer<LoginController>(
          builder: (context,loginController,child){
            return TextFormField(
              cursorColor: AppColors.primaryColor,
              controller: widget.controller,
              obscureText: widget.passwordVisibility ? loginController.isPasswordVisible : false,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  suffixIcon: widget.suffixIcon != null
                      ? Padding(
                    padding: const EdgeInsets.all(10), // Optional space to the right
                    child: GestureDetector(
                      onTap: widget.passwordVisibility ? (){
                        loginController.setIsPasswordVisible(isPasswordVisible: !(loginController.isPasswordVisible));
                      } : null,
                      child: SvgPicture.asset(
                        widget.suffixIcon!,
                        width: 16,
                        height: 16,
                      ),
                    ),
                  )
                      : null,
                  border: InputBorder.none,
                  hint: Text(widget.hint ?? "",style: TextStyle(
                      fontFamily: 'raleway',
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.black
                  ),),

              ),
              validator: widget.validationFunction,
            );
          },
        ),
      ),
    );
  }
}