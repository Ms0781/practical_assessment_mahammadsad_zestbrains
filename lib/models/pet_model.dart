import 'dart:ui';

class Pet{

  final String petName;
  final String petId;
  final String petMatingDate;
  final String petBreedingPartner;
  final String petPregnancy;
  final String petGender;
  final String petImage;
  final Color petImageBorderColor;
  final Color petImageBackgroundColor;

  const Pet({required this.petId,required this.petName,required this.petImage,required this.petBreedingPartner,required this.petGender,required this.petMatingDate,required this.petPregnancy,required this.petImageBorderColor,required this.petImageBackgroundColor});
}