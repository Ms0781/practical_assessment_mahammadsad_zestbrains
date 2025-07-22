// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:practical_assessment_mahammadsad_zestbrains/controller/login_controller.dart';
// import 'package:practical_assessment_mahammadsad_zestbrains/utils/app_constants.dart';
// import 'package:practical_assessment_mahammadsad_zestbrains/utils/app_strings.dart';
// import 'package:practical_assessment_mahammadsad_zestbrains/views/custom_widgets/custom_button.dart';
// import 'package:practical_assessment_mahammadsad_zestbrains/views/custom_widgets/custom_textfields.dart';
// import 'package:practical_assessment_mahammadsad_zestbrains/views/dashboard_screen.dart';
// import 'package:provider/provider.dart';
//
// import '../utils/app_colors.dart';
// import '../utils/app_images.dart';
//
// class SignInScreen extends StatefulWidget {
//   const SignInScreen({super.key});
//
//   @override
//   State<SignInScreen> createState() => _SignInScreen();
// }
//
// class _SignInScreen extends State<SignInScreen> {
//   final GlobalKey<FormState> _formState = GlobalKey<FormState>();
//   TextEditingController? emailController;
//   TextEditingController? passwordController;
//
//   @override
//   void initState() {
//     super.initState();
//     emailController = TextEditingController();
//     passwordController = TextEditingController();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SizedBox(
//           height: size.height,
//           width: size.width,
//           child: Column(
//             children: [
//               Expanded(child: Stack(
//                 children: [
//                   Stack(
//                     children: [
//                       ClipPath(
//                         clipper: DeepCurveClipper(),
//                         child: Container(
//                           height: size.height * 0.3,
//                           width: size.width,
//                           color: Colors.black.withValues(alpha: 0.01),
//                           child: Stack(
//                             children: [
//                               // Background image
//                               Container(
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: AssetImage(
//                                       AppImages.splashBackgroundImage,
//                                     ),
//                                     fit: BoxFit.cover, // fills and crops
//                                     alignment: Alignment.center, // center crop
//                                   ),
//                                 ),
//                               ),
//
//                               // Gradient overlay
//                               Container(
//                                 decoration: BoxDecoration(
//                                   gradient: LinearGradient(
//                                     begin: Alignment.topCenter,
//                                     end: Alignment.bottomCenter,
//                                     colors: [
//                                       AppColors.primaryColor.withValues(
//                                         alpha: 0.56,
//                                       ),
//                                       AppColors.primaryColor.withValues(
//                                         alpha: 0.56,
//                                       ),
//                                       AppColors.primaryColor.withValues(
//                                         alpha: 0.84,
//                                       ),
//                                     ],
//                                     stops: [0.0, 0.5, 1.0],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ), Positioned(
//                       left: 0,
//                       right: 0,
//                       top: 80,
//                       child: SvgPicture.asset(
//                         "assets/images/lines_3.svg",
//                         fit: BoxFit.fitWidth,
//                       )),
//                   Positioned(
//                     left: 0,
//                     right: 0,
//                     top: 60,
//                     child:  Image.asset("assets/images/app_logo_1.png"),),
//
//                 ],
//               )),
//
//               const SizedBox(height: 20),
//
//               Expanded(
//                 flex: 2,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Expanded(
//                         child: Column(
//                           children: [
//                             Text(
//                               AppStrings.welcomeBack,
//                               style: TextStyle(
//                                 fontFamily: 'raleway',
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.w700,
//                                 color: AppColors.logOutTextColor,
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             Text(
//                               AppStrings.welComeText,
//                               style: TextStyle(
//                                 fontFamily: 'raleway',
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500,
//                                 color: AppColors.color2,
//                               ),
//                             ),
//
//                             const SizedBox(height: 20),
//                             Form(
//                               key: _formState,
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   CustomTextFields(
//                                     controller: emailController,
//                                     suffixIcon: AppImages.emailIcon,
//                                     validationFunction: AppConstants.valueIsEmptyOrNot,
//                                     hint: AppStrings.email, passwordVisibility: false,
//                                   ),
//                                   const SizedBox(height: 15),
//                                   CustomTextFields(
//                                     controller: passwordController,
//                                     suffixIcon: AppImages.passwordVisibility,
//                                     validationFunction: AppConstants.valueIsEmptyOrNot,
//                                     hint: AppStrings.password, passwordVisibility: true,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Consumer<LoginController>(
//                                       builder:(context,loginController,child){
//                                         return Checkbox(
//                                           value: loginController.checkBoxState,
//                                           activeColor: AppColors.checkBoxColor,
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius: BorderRadius.circular(5),
//                                           ),
//                                           onChanged: (bool? value) {
//                                             loginController.setCheckBoxState(checkBoxState: value ?? false);
//                                           },
//                                         );
//                                       }
//                                     ),
//                                     Text(
//                                       AppStrings.rememberMe,
//                                       style: TextStyle(
//                                         fontFamily: 'raleway',
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: 13,
//                                         color: AppColors.logOutTextColor,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 TextButton(
//                                   onPressed: () {
//
//                                   },
//                                   child: Text(
//                                     AppStrings.forgotPassword,
//                                     style: TextStyle(
//                                       fontFamily: 'raleway',
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w500,
//                                       color: AppColors.color1,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//
//                             const SizedBox(height: 20),
//
//                            Consumer<LoginController>(
//                              builder: (context,loginController,child){
//                                return  CustomButton(
//                                  buttonText: AppStrings.signInLabel,
//                                  onTap: () async{
//                                    // Navigator.push(
//                                    //   context,
//                                    //   MaterialPageRoute(
//                                    //     builder: (context) => DashboardScreen(),
//                                    //   ),
//                                    // );
//                                    if(_formState.currentState?.validate() ?? false){
//                                      await loginController.loginUser(email: emailController?.text ?? "", password: passwordController?.text ?? "");
//                                    }
//                                  },
//                                  backgroundColor: AppColors.buttonColor,
//                                  textColor: AppColors.whiteColor,
//                                );
//                              },
//                            ),
//
//                             const SizedBox(height: 20),
//                           ],
//                         ),
//                       ),
//                       Text.rich(
//                         TextSpan(
//                           text: AppStrings.alreadyAccountLabel,
//                           style: TextStyle(
//                             fontFamily: 'raleway',
//                             fontWeight: FontWeight.w500,
//                             fontSize: 14,
//                             color: AppColors.color1,
//                           ),
//                           children: [
//                             TextSpan(
//                               text: AppStrings.signUpLabel,
//                               style: TextStyle(
//                                 fontFamily: 'raleway',
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 14,
//                                 color: AppColors.logOutTextColor,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).padding.bottom + 10,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class DeepCurveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.lineTo(0, size.height - 120); // Go down more for deep curve
//
//     path.quadraticBezierTo(
//       size.width / 2,
//       size.height + 80, // +80 gives a semi-circular feel
//       size.width,
//       size.height - 120,
//     );
//
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:practical_assessment_mahammadsad_zestbrains/controller/login_controller.dart';
import 'package:practical_assessment_mahammadsad_zestbrains/utils/app_constants.dart';
import 'package:practical_assessment_mahammadsad_zestbrains/utils/app_strings.dart';
import 'package:practical_assessment_mahammadsad_zestbrains/views/custom_widgets/custom_button.dart';
import 'package:practical_assessment_mahammadsad_zestbrains/views/custom_widgets/custom_textfields.dart';
import 'package:practical_assessment_mahammadsad_zestbrains/views/dashboard_screen.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Stack(
                      children: [
                        ClipPath(
                          clipper: DeepCurveClipper(),
                          child: Container(
                            height: size.height * 0.3,
                            width: size.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(AppImages.splashBackgroundImage),
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                              ),
                            ),
                            foregroundDecoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  AppColors.primaryColor.withValues(alpha: 0.56),
                                  AppColors.primaryColor.withValues(alpha: 0.56),
                                  AppColors.primaryColor.withValues(alpha: 0.84),
                                ],
                                stops: [0.0, 0.5, 1.0],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          top: size.height * 0.05,
                          child: SvgPicture.asset(
                            "assets/images/lines_3.svg",
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          top: size.height * 0.05,
                          child: Image.asset("assets/images/app_logo_1.png"),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.welcomeBack,
                            style: TextStyle(
                              fontFamily: 'raleway',
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: AppColors.logOutTextColor,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            AppStrings.welComeText,
                            style: TextStyle(
                              fontFamily: 'raleway',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.color2,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Form(
                            key: _formState,
                            child: Column(
                              children: [
                                CustomTextFields(
                                  controller: emailController,
                                  suffixIcon: AppImages.emailIcon,
                                  validationFunction: (value) => AppConstants.valueIsEmptyOrNot(value),
                                  hint: AppStrings.email,
                                  passwordVisibility: false,
                                ),
                                const SizedBox(height: 15),
                                CustomTextFields(
                                  controller: passwordController,
                                  suffixIcon: AppImages.passwordVisibility,
                                  validationFunction: (value) => AppConstants.valueIsEmptyOrNot(value),
                                  hint: AppStrings.password,
                                  passwordVisibility: true,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Consumer<LoginController>(
                                    builder: (context, loginController, child) {
                                      return Checkbox(
                                        value: loginController.checkBoxState,
                                        activeColor: AppColors.checkBoxColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        onChanged: (bool? value) {
                                          loginController.setCheckBoxState(
                                            checkBoxState: value ?? false,
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  Text(
                                    AppStrings.rememberMe,
                                    style: TextStyle(
                                      fontFamily: 'raleway',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: AppColors.logOutTextColor,
                                    ),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  AppStrings.forgotPassword,
                                  style: TextStyle(
                                    fontFamily: 'raleway',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.color1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Consumer<LoginController>(
                            builder: (context, loginController, child) {
                              return CustomButton(
                                buttonText: AppStrings.signInLabel,
                                onTap: () async {
                                  if (_formState.currentState?.validate() ?? false) {
                                    loginController.loginUser(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                                backgroundColor: AppColors.buttonColor,
                                textColor: AppColors.whiteColor,
                              );
                            },
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: AppStrings.alreadyAccountLabel,
                      style: TextStyle(
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: AppColors.color1,
                      ),
                      children: [
                        TextSpan(
                          text: AppStrings.signUpLabel,
                          style: TextStyle(
                            fontFamily: 'raleway',
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: AppColors.logOutTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).padding.bottom + 10),
                ],
              ),
            ),
          ),
          Positioned.fill(

              child: Consumer<LoginController>(
                builder: (context,loginController,child){
                  return Visibility(
                      visible: loginController.isLoading ,
                      child: Container(
                        color: AppColors.primaryColor.withValues(alpha: 0.1),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ));
                },
              ))
        ],
      ),
    );
  }
}

class DeepCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 120);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 80,
      size.width,
      size.height - 120,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
