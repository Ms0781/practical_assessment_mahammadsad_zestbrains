import 'package:flutter/material.dart';
import 'package:practical_assessment_mahammadsad_zestbrains/controller/login_controller.dart';
import 'package:practical_assessment_mahammadsad_zestbrains/utils/app_constants.dart';
import 'package:practical_assessment_mahammadsad_zestbrains/views/sign_in_screen.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginController>(create: (context) => LoginController())
      ],
    child: MaterialApp(
      title: 'Clip Cuts',
      navigatorKey: AppConstants.navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SignInScreen(),
      debugShowCheckedModeBanner: false,
    ),
    );
  }
}