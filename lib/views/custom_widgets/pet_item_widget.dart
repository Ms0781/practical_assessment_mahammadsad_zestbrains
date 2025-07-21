import 'package:flutter/material.dart';
import 'package:practical_assessment_mahammadsad_zestbrains/models/pet_model.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';

class PetItemWidget extends StatelessWidget {
  final Pet pet;
  const PetItemWidget({super.key,required this.pet});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  color: pet.petImageBackgroundColor,
                  border: Border(
                    top: BorderSide(width:1, color: pet.petImageBorderColor),
                    right: BorderSide(width: 1, color: pet.petImageBorderColor),
                    bottom: BorderSide(width: 2, color: pet.petImageBorderColor),
                    left: BorderSide(width: 1, color: pet.petImageBorderColor),
                  ),
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Image.asset(pet.petImage,
                  fit: BoxFit.cover,
                  width: 40,height: 40,),
              ),
              const SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       pet.petName,
                  //       style: TextStyle(
                  //           fontFamily: 'raleway',
                  //           fontWeight: FontWeight.w600,
                  //           color: AppColors.petDetailValueColor,
                  //           fontSize: 15
                  //       ),),
                  //     const SizedBox(width: 10,),
                  //     Container(
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(40),
                  //           color: AppColors.petGenderBackgroundColor
                  //         ),
                  //         padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 2),
                  //         child: Center(
                  //           child: Text(
                  //             pet.petGender,
                  //             style: TextStyle(
                  //               fontFamily: 'raleway',
                  //               fontWeight: FontWeight.w500,
                  //               color: AppColors.petGenderColor,
                  //               fontSize: 10,
                  //               letterSpacing: 2
                  //             ),
                  //           ),
                  //         ),
                  //
                  //     )
                  //   ],
                  // ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            pet.petName,
                            style: TextStyle(
                              fontFamily: 'raleway',
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF545454),
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.petGenderBackgroundColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              pet.petGender,
                              style: TextStyle(
                                fontFamily: 'raleway',
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: AppColors.petGenderColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        'ID: ${pet.petId}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),


                ],
              )
            ],
          ),
          Container(height: 1,
            margin: const EdgeInsets.symmetric(vertical: 10),
            color: AppColors.blackColor.withValues(alpha: 0.1),),
          Row(
            children: [
              PetDetailsWidget(petDetailLabel: AppStrings.petDetailMatingDate, petDetailValue: pet.petMatingDate),
              PetDetailsWidget(petDetailLabel: AppStrings.petBreedingPartner, petDetailValue: pet.petBreedingPartner),
              PetDetailsWidget(petDetailLabel: AppStrings.petPregnancy, petDetailValue: pet.petPregnancy)
            ],
          )
        ],
      ),
    );
  }
}



class PetDetailsWidget extends StatelessWidget {
  final String petDetailLabel;
  final String petDetailValue;
  const PetDetailsWidget({super.key,required this.petDetailLabel,required this.petDetailValue});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(petDetailLabel,style: TextStyle(
            fontFamily: 'raleway',
            fontWeight: FontWeight.w600,
            fontSize: 10,
            color: AppColors.petDetailLabelColor
        ),),
        const SizedBox(height: 5,),
        Text(petDetailValue,style: TextStyle(
            fontFamily: 'raleway',
            fontWeight: FontWeight.w600,
            fontSize: 10,
            color: AppColors.petDetailValueColor
        ),),
      ],
    ));
  }
}
