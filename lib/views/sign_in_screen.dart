import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:practical_assessment_mahammadsad_zestbrains/utils/app_strings.dart';
import 'package:practical_assessment_mahammadsad_zestbrains/views/custom_widgets/custom_button.dart';
import 'package:practical_assessment_mahammadsad_zestbrains/views/custom_widgets/custom_textfields.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});


    
  @override
  State<SignInScreen> createState() => _SignInScreen();
}

class _SignInScreen extends State<SignInScreen> {
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       body: Column(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              // 🔷 Curved top with logo
              Stack(
                children: [
                  ClipPath(
                    clipper: DeepCurveClipper(),
                    child: Container(
                      height: size.height * 0.3,
                      width: size.width,
                      color: Colors.black.withValues(alpha: 0.01),
                      child: Stack(
                        children: [
                          // Background image
                          Container(

                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(AppImages.splashBackgroundImage),
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),

                          // Gradient overlay
                          Container(

                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(0, 180, 191, 0.56),
                                  Color.fromRGBO(0, 180, 191, 0.56),
                                  Color.fromRGBO(0, 180, 191, 0.84),
                                ],
                                stops: [0.0, 0.5, 1.0],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Expanded(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    CustomTextFields(controller: null, suffixIcon: null, validationFunction: (value){}, hint: 'Email'),
                    const SizedBox(height: 15),
                    CustomTextFields(controller: null, suffixIcon: null, validationFunction: (value){}, hint: 'Email'),

                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(value: true, onChanged: (_) {}),
                            const Text('Remember me'),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Forgot password?'),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    CustomButton(

                        buttonText: 'Sign In',
                       onTap: (){},
                        backgroundColor: AppColors.buttonColor,
                        textColor: AppColors.whiteColor,
                    ),

                    const SizedBox(height: 20),

                  ],
                ),
              ),),

              Text.rich(
                TextSpan(
                  text: AppStrings.alreadyAccountLabel,
                  style: TextStyle(
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColors.color1
                  ),
                  children: [
                    TextSpan(
                      text: AppStrings.signUpLabel,
                      style: TextStyle(
                          fontFamily: 'raleway',
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: AppColors.logOutTextColor
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: MediaQuery.of(context).padding.bottom,)
            ],
          ),
        ),
      ),
    );
  }

}

// class TopClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, size.height - 50);
//     path.quadraticBezierTo(
//         size.width / 2,
//         size.height + 30,
//         size.width,
//         size.height - 50);
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }

class DeepCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 120); // Go down more for deep curve

    path.quadraticBezierTo(
      size.width / 2, size.height + 80, // +80 gives a semi-circular feel
      size.width, size.height - 120,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
