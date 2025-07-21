import 'package:practical_assessment_mahammadsad_zestbrains/views/custom_widgets/custom_button.dart';
import 'package:practical_assessment_mahammadsad_zestbrains/views/sign_in_screen.dart';

import '.././utils/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:practical_assessment_mahammadsad_zestbrains/utils/app_strings.dart';

class LogOutBottomSheet extends StatelessWidget {
  const LogOutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.3,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 60,
              height: 5,
              decoration: BoxDecoration(
                color: Color(0x4D090A2D),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 30),
          Text(
            AppStrings.logoutText,
            style: TextStyle(
              fontFamily: 'raleway',
              fontWeight: FontWeight.w700,
              color: AppColors.logOutTextColor,
              fontSize: 22,
              letterSpacing: 2,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: CustomButton(buttonText: 'Yes', onTap: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SignInScreen()), (route)=> false);
              })),
              const SizedBox(width: 10),
              Expanded(
                child: CustomButton(
                  buttonText: 'No',
                  textColor: Colors.white,
                  backgroundColor: AppColors.buttonColor,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          SizedBox(),
        ],
      ),
    );
  }
}
