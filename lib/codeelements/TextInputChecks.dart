import 'package:flutter/material.dart';
import 'package:fallreview/popups/generalinfopopup.dart';
import 'package:fallreview/screens/allscreens.dart';

Future <bool> fractureDescriptionOK(
    {BuildContext context,
    String screen,
    bool conditionBool,
    String conditionDescription,
    String errorMessage}) async  {
  if ((screen != null && screen == FractureCheckScreen.id) &&
      (conditionBool != null && conditionBool) &&
      (conditionDescription == null || conditionDescription == '')) {
    showDialog(
      context: context,
      builder: (_) => GeneralnfoPopup(
        errorMessage,
      ),
    );

    return false;
  } else {
    return true;
  }
}

Future <bool> vitalScreensValueOK(
    {BuildContext context,
      String screen,
      int value,
      int highLimit,
      int lowLimit,
      String errorMessage}) async  {
  if ((screen != null && screen == VitalSignsCheckScreen.id) &&
      (value > highLimit || value < lowLimit)) {
    showDialog(
      context: context,
      builder: (_) => GeneralnfoPopup(
        errorMessage,
      ),
    );

    return false;
  } else {
    return true;
  }
}

