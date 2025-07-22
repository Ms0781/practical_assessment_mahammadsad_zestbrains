import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:practical_assessment_mahammadsad_zestbrains/utils/app_constants.dart';
import 'package:practical_assessment_mahammadsad_zestbrains/views/dashboard_screen.dart';

import '../utils/app_colors.dart';

class LoginController extends ChangeNotifier {
  //handle checkbox state
  bool checkBoxState = false;

  void setCheckBoxState({required bool checkBoxState}) {
    this.checkBoxState = checkBoxState;
    notifyListeners();
  }

  //password visibility
  bool isPasswordVisible = false;

  void setIsPasswordVisible({required bool isPasswordVisible}) {
    this.isPasswordVisible = isPasswordVisible;
    notifyListeners();
  }

  //handle loading indicator
  bool isLoading = false;

  void setIsLoading({required isLoading}) {
    this.isLoading = isLoading;
    notifyListeners();
  }

  //login functionality
  void loginUser({
    required String email,
    required String password,
  }) async {
    try {
      setIsLoading(isLoading: true);
      dynamic response = await post(
        Uri.parse("${AppConstants.apiBaseURL}/${AppConstants.loginEndPoint}"),
        headers: <String, String>{"Accept-Language": "en"},
        body: <String, dynamic>{
          "email": email,
          "password": password,
          "device_id": "12345",
          "device_type": Platform.isAndroid ? "android" : "ios",
          "device_token": "dhsbchsbhsadsaded",
        },
      );


      dynamic res = jsonDecode(response.body);

      Fluttertoast.showToast(
          msg: res['message'],
          backgroundColor: AppColors.primaryColor,
          textColor: AppColors.whiteColor
      );

      if(res['status'] == 200){
        AppConstants.navigatorKey.currentState?.pushReplacement(MaterialPageRoute(builder: (_) => DashboardScreen()));
      }
      setIsLoading(isLoading: false);
    } catch (e) {
      Fluttertoast.showToast(
        msg: "$e",
        backgroundColor: AppColors.primaryColor,
        textColor: AppColors.whiteColor
      );
      setIsLoading(isLoading: false);
    }
  }
}
