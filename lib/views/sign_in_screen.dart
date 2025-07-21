import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:practical_assessment_mahammadsad_zestbrains/utils/app_strings.dart';
import 'package:practical_assessment_mahammadsad_zestbrains/views/custom_widgets/custom_button.dart';
import 'package:practical_assessment_mahammadsad_zestbrains/views/custom_widgets/custom_textfields.dart';
import 'package:practical_assessment_mahammadsad_zestbrains/views/dashboard_screen.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});


    
  @override
  State<SignInScreen> createState() => _SignInScreen();
}

class _SignInScreen extends State<SignInScreen> {

  TextEditingController? emailController;
  TextEditingController? passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: size.height,
          width: size.width,
          child: Column(
            children: [
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

              Expanded(child:  Column(
                children: [
                  
                  Text(AppStrings.welcomeBack,
                   style: TextStyle(
                     fontFamily: 'raleway',
                     fontSize: 24,
                     fontWeight: FontWeight.w700,
                     color: AppColors.logOutTextColor
                   ),
                  ),
                  const SizedBox(height: 10,),
                  Text(AppStrings.welComeText,
                    style: TextStyle(
                        fontFamily: 'raleway',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.color2
                    ),

                  ),

                  const SizedBox(height: 20,),
                  CustomTextFields(
                      controller: null,
                      suffixIcon: AppImages.emailIcon,
                      validationFunction: (value){}, hint: AppStrings.email),
                  const SizedBox(height: 15),
                  CustomTextFields(
                      controller: null,
                      suffixIcon: AppImages.passwordVisibility,
                      validationFunction: (value){}, hint: AppStrings.password),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              value: true,
                              activeColor: AppColors.checkBoxColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)
                              ),
                              onChanged: (_) {}
                          ),
                          Text(AppStrings.rememberMe,
                            style: TextStyle(
                                fontFamily: 'raleway',
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: AppColors.logOutTextColor
                            ),

                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('Forgot password?',
                          style: TextStyle(
                              fontFamily: 'raleway',
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: AppColors.color1
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  CustomButton(
                    buttonText: AppStrings.signInLabel,
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
                    },
                    backgroundColor: AppColors.buttonColor,
                    textColor: AppColors.whiteColor,
                  ),

                  const SizedBox(height: 20),

                ],
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
