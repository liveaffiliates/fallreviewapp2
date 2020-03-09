import 'package:flutter/material.dart';
import 'package:fallreview/screens/allscreens.dart';
import 'package:fallreview/uxelements/uxelements.dart';
import 'package:fallreview/utilities/string.dart';
import 'package:fallreview/utilities/colors.dart';

class InjuryCheckScreen extends StatefulWidget {
  static const String id = 'injury_check_screen';

  @override
  _InjuryCheckScreenState createState() => _InjuryCheckScreenState();
}

class _InjuryCheckScreenState extends State<InjuryCheckScreen> {
  @override
  Widget build(BuildContext context) {

    var padding = MediaQuery.of(context).padding.top;
    var totalHeight = MediaQuery.of(context).size.height;
    var adjustedHeight = totalHeight - padding - kToolbarHeight;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text('Fall Report'),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 300,
                      child: Text(
                        'Does the person have any of the following?',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    InjuryCheckBox(
                      type: Strings.unwitnessedFall,
                      titleText: Strings.unwitnessedFallTitle,
                    ),
                    InjuryCheckBox(
                      type: Strings.hitHead,
                      titleText: Strings.hitHeadTitle,
                    ),
                    InjuryCheckBox(
                      type: Strings.nausea,
                      titleText: Strings.nauseaTitle,
                    ),
                    InjuryCheckBox(
                      type: Strings.vomiting,
                      titleText: Strings.vomitingTitle,
                    ),
                    InjuryCheckBox(
                      type: Strings.severeHeadache,
                      titleText: Strings.severeHeadacheTitle,
                    ),
                    InjuryCheckBox(
                      type: Strings.neckPain,
                      titleText: Strings.neckPainTitle,
                    ),
                    InjuryCheckBox(
                      type: Strings.changeOfConsciousness,
                      titleText: Strings.changeOfConsciousnessTitle,
                    ),
                    InjuryCheckBox(
                      type: Strings.takingAntiCoagulants,
                      titleText: Strings.takingAntiCoagulantsTitle,
                    ),
                    InjuryCheckBox(
                      type: Strings.cutsOrLacerations,
                      titleText: Strings.cutsOrLacerationsTitle,
                    ),
                    InjuryCheckBox(
                      type: Strings.unableToWeightBear,
                      titleText: Strings.unableToWeightBearTitle,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Spacer(),
                BottomButton(
                  text: 'Next',
                  route: OtherInformationScreen.id,
                  updateDatabase: true,
                  finalScreen: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
