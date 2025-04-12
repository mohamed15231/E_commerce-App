import 'package:flutter/material.dart';
import 'package:shop_app/models/onboarding_model.dart';

Widget pageViewOnBoarding({
  required OnBoarding_Model onboardingModel,
}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image.asset(
          onboardingModel.image,
        ),
      ),
      SizedBox(
        height: 40,
      ),
      Text(
        onboardingModel.title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 20,
      ),
      Text(onboardingModel.body, style: TextStyle(fontSize: 20)),
      SizedBox(
        height: 50,
      ),

    ],
  );

}