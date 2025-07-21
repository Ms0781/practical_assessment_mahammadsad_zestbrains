import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practical_assessment_mahammadsad_zestbrains/models/pet_model.dart';
import 'package:practical_assessment_mahammadsad_zestbrains/utils/app_constants.dart';
import 'package:practical_assessment_mahammadsad_zestbrains/utils/app_images.dart';
import 'package:practical_assessment_mahammadsad_zestbrains/utils/app_strings.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practical_assessment_mahammadsad_zestbrains/views/custom_widgets/custom_textfields.dart';
import 'package:practical_assessment_mahammadsad_zestbrains/views/custom_widgets/pet_item_widget.dart';
import 'package:practical_assessment_mahammadsad_zestbrains/views/log_out_bottom_sheet.dart';

import '../utils/app_colors.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor, // Android
        statusBarIconBrightness: Brightness.light, // Android
        statusBarBrightness: Brightness.dark, // iOS
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: height * 0.1 + MediaQuery.of(context).padding.top,
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
                left: 10,
                right: 10,
                bottom: 10
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(flex: 1,
                    child: Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.whiteColor,
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomCenter,
                            colors: [
                          AppColors.whiteColor,
                          AppColors.whiteColor,
                          AppColors.whiteColor.withValues(alpha: 0)
                        ])
                      ),
                      padding: EdgeInsets.all(2),
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(AppImages.profileImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      AppStrings.appName,
                      style: TextStyle(
                        fontFamily: 'pattaya',
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 1,

                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(28),
                                topRight: Radius.circular(28),
                              ),
                            ),
                            builder: (context) {
                              return LogOutBottomSheet();
                            },
                          );
                        },
                        child: SvgPicture.asset(AppImages.logOutImage),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomTextFields(
              controller: null,
              suffixIcon: AppImages.searchIcon,
              validationFunction: null,
              hint: AppStrings.dashboardSearchHint,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                color: Colors.white,
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior().copyWith(
                    overscroll: false,
                  ),

                  child: ListView.separated(
                    padding: const EdgeInsets.only(bottom: 20),
                    itemCount: AppConstants.petList.length,
                    itemBuilder: (context, index) {
                      Pet pet = AppConstants.petList[index];
                      return PetItemWidget(pet: pet);
                    },
                    separatorBuilder:
                        (context, index) => const SizedBox(height: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
