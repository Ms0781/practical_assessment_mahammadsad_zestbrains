import 'package:flutter/material.dart';
import 'package:practical_assessment_mahammadsad_zestbrains/models/pet_model.dart';
import 'package:practical_assessment_mahammadsad_zestbrains/utils/app_images.dart';

import 'app_colors.dart';

class AppConstants {

  //API CONSTANT
  static const String _apiBaseUrl = "https://app.happystories.io/api/V1";
  static String get apiBaseURL => _apiBaseUrl;

   static const String _loginEndPoint = "login";
   static String get loginEndPoint => _loginEndPoint;

  //navigator key
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  //PET LIST
  static List<Pet> petList = [
    Pet(petId: 'A0001', petName: 'Charlie', petImage: AppImages.charlieImage, petBreedingPartner: 'Emmy', petGender: 'Male', petMatingDate: '12/12/23', petPregnancy: 'Y',petImageBackgroundColor: AppColors.pet1backgroundColor,petImageBorderColor: AppColors.pet1BorderColor),
    Pet(petId: 'A0001', petName: 'Oliver', petImage: AppImages.oliverImage, petBreedingPartner: 'Emmy', petGender: 'Male', petMatingDate: '12/12/23', petPregnancy: 'Y',petImageBackgroundColor: AppColors.pet2backgroundColor,petImageBorderColor: AppColors.pet2BorderColor),
    Pet(petId: 'A0001', petName: 'Cooper', petImage: AppImages.cooperImage, petBreedingPartner: 'Emmy', petGender: 'Male', petMatingDate: '12/12/23', petPregnancy: 'Y',petImageBackgroundColor: AppColors.pet3backgroundColor,petImageBorderColor: AppColors.pet3BorderColor),
    Pet(petId: 'A0001', petName: 'Milo', petImage: AppImages.miloImage, petBreedingPartner: 'Emmy', petGender: 'Male', petMatingDate: '12/12/23', petPregnancy: 'Y',petImageBackgroundColor: AppColors.pet4backgroundColor,petImageBorderColor: AppColors.pet4BorderColor),
    Pet(petId: 'A0001', petName: 'Rocky', petImage: AppImages.rockyImage, petBreedingPartner: 'Emmy', petGender: 'Male', petMatingDate: '12/12/23', petPregnancy: 'Y',petImageBackgroundColor: AppColors.pet5backgroundColor,petImageBorderColor: AppColors.pet5BorderColor)
  ];

  //email,password validator
  static String? valueIsEmptyOrNot(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Data.';
    }
    return null;
  }
}