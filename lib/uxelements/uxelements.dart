import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fallreview/models/fallmodel.dart';
import 'package:fallreview/utilities/string.dart';
import 'package:fallreview/utilities/colors.dart';
import 'package:fallreview/database/FireStoreFunctions.dart';
import 'package:fallreview/database/sembastfunctions.dart';

class BulletPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 10.0,
      width: 10.0,
      decoration: new BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}

class FractureCheckInput extends StatefulWidget {
  final String title;
  final String type;

  FractureCheckInput({@required this.title, @required this.type});

  @override
  _FractureCheckInputState createState() => _FractureCheckInputState();
}

class _FractureCheckInputState extends State<FractureCheckInput> {
  @override
  Widget build(BuildContext context) {
    final fallData = Provider.of<FallData>(context, listen: true);

    double textBoxHeight;
    bool switchValue = false;
    String textFieldInitialValue;

    switch (widget.type) {
      case Strings.pain:
        {
          textBoxHeight =
              (fallData.getPain == null) ? 0 : (fallData.getPain ? 50 : 0);
          switchValue = fallData.getPain ?? false;
          textFieldInitialValue = fallData.getPainDesc ?? null;
        }
        break;

      case Strings.bonyTenderness:
        {
          textBoxHeight = (fallData.getBonyTenderness == null)
              ? 0
              : (fallData.getBonyTenderness ? 50 : 0);
          switchValue = fallData.getBonyTenderness ?? false;
          textFieldInitialValue = fallData.getBonyTendernessDesc ?? null;
        }
        break;

      case Strings.painWithMovement:
        {
          textBoxHeight = (fallData.getChangePainWithMovement == null)
              ? 0
              : (fallData.getChangePainWithMovement ? 50 : 0);
          switchValue = fallData.getChangePainWithMovement ?? false;
          textFieldInitialValue = fallData.getChangePainWithMovDesc ?? null;
        }

        break;

      case Strings.limbShortening:
        {
          textBoxHeight = (fallData.getLimbShort == null)
              ? 0
              : (fallData.getLimbShort ? 50 : 0);
          switchValue = fallData.getLimbShort ?? false;
          textFieldInitialValue = fallData.getLimbShortDesc ?? null;
        }
        break;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: 24,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                BulletPoint(),
                SizedBox(
                  width: 10,
                ),
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            Switch(
              value: switchValue,
              activeColor: Colors.red,
              inactiveThumbColor: Colors.green,
              onChanged: (value) {
                setState(() {
                  switch (widget.type) {
                    case Strings.pain:
                      {
                        fallData.setPain((fallData.getPain == null)
                            ? true
                            : !fallData.getPain);
                      }
                      break;

                    case Strings.bonyTenderness:
                      {
                        fallData.setBonyTenderness(
                            (fallData.getBonyTenderness == null)
                                ? true
                                : !fallData.getBonyTenderness);
                      }
                      break;

                    case Strings.painWithMovement:
                      {
                        fallData.setchangePainWithMovement(
                            (fallData.getChangePainWithMovement == null)
                                ? true
                                : !fallData.getChangePainWithMovement);
                      }
                      break;

                    case Strings.limbShortening:
                      {
                        fallData.setLimbShort((fallData.getLimbShort == null)
                            ? true
                            : !fallData.getLimbShort);
                      }
                      break;
                  }
                });
              },
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: AnimatedContainer(
            width: double.infinity,
            height: textBoxHeight,
            duration: Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            child: AnimatedOpacity(
              opacity: (textBoxHeight == 50) ? 1.0 : 0.0,
              duration: Duration(milliseconds: 250),
              child: TextFormField(
                textAlign: TextAlign.center,
                initialValue: textFieldInitialValue,
                autofocus: false,
                decoration: InputDecoration.collapsed(
                  filled: true,
                  fillColor: textBoxBackgroundColor,
                  hintText: 'Details...',
                ),
                onChanged: (text) {
                  switch (widget.type) {
                    case Strings.pain:
                      {
                        fallData.setPainDesc(text);
                      }
                      break;

                    case Strings.bonyTenderness:
                      {
                        fallData.setBonyTendernessDesc(text);
                      }
                      break;

                    case Strings.painWithMovement:
                      {
                        fallData.setChangeInPaiWitMovDesc(text);
                      }
                      break;

                    case Strings.limbShortening:
                      {
                        fallData.setLimbShortDesc(text);
                      }
                      break;
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class VitalSignInput extends StatefulWidget {

  final String type;
  final String hintText;
  final String icon;

  VitalSignInput({
    @required this.type,
    @required this.hintText,
    @required this.icon,
  });

  @override
  _VitalSignInputState createState() => _VitalSignInputState();
}

class _VitalSignInputState extends State<VitalSignInput> {
  @override
  Widget build(BuildContext context) {
    final fallData = Provider.of<FallData>(context, listen: true);

    String initialValue;

    switch (widget.type) {
      case Strings.bloodPressure:
        {
          initialValue = (fallData.getBPSis == null || fallData.getBPDia == null) ? null : fallData.getBPSis.toString() + '/' + fallData.getBPDia.toString();
        }
        break;
      case Strings.heartRate:
        {
          initialValue = (fallData.getHr == null) ? null : fallData.getHr.toString();
        }
        break;
      case Strings.temperature:
        {
          initialValue = (fallData.getTemperature == null) ? null : fallData.getTemperature.toString();
        }
        break;
      case Strings.pupilLeft:
        {
          initialValue = (fallData.getPupilL == null) ? null : fallData.getPupilL.toString();
        }
        break;
      case Strings.pupilRight:
        {
          initialValue = (fallData.getPupilR == null) ? null : fallData.getPupilR.toString();
        }
        break;
      case Strings.pupilDescription:
        {
          initialValue = (fallData.getPupilDesc == null) ? null : fallData.getPupilDesc.toString();
        }
        break;
      case Strings.respiratoryRate:
        {
          initialValue = (fallData.getRespRate == null) ? null : fallData.getRespRate.toString();
        }
        break;
      case Strings.oxygenSaturation:
        {
          initialValue = (fallData.getOxygenSat == null) ? null : fallData.getOxygenSat.toString();
        }
        break;
      case Strings.bloodGlucose:
        {
          initialValue = (fallData.getBGL == null) ? null : fallData.getBGL.toString();
        }
        break;
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 50.0),
        child: Stack(
          children: <Widget>[
            Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/' + widget.icon,
                  width: 65,
                  height: 65,
                )),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 30.0),
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(30),
                child: TextFormField(
                  initialValue: initialValue,
                  autofocus: false,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration.collapsed(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(30.0),
                      ),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: widget.hintText,
                  ),
                  onChanged: (text) {
                    switch (widget.type) {
                      case Strings.bloodPressure:
                        {

                          fallData.setBPSis(int.tryParse(text
                              .replaceAll(new RegExp(r"\s\b|\b\s"), "")
                              .split('/')[0]));
                          fallData.setBPDia(int.tryParse(text
                              .replaceAll(new RegExp(r"\s\b|\b\s"), "")
                              .split('/')[1]));

                        }
                        break;
                      case Strings.heartRate:
                        {
                          fallData.setHr(int.tryParse(text));
                        }
                        break;
                      case Strings.temperature:
                        {
                          fallData.setTemperature(double.tryParse(text));
                        }
                        break;
                      case Strings.pupilLeft:
                        {
                          fallData.setPupilL(int.tryParse(text));
                        }
                        break;
                      case Strings.pupilRight:
                        {
                          fallData.setPupilR(int.tryParse(text));
                        }
                        break;
                      case Strings.pupilDescription:
                        {
                          fallData.setLPupilDesc(text);
                        }
                        break;
                      case Strings.respiratoryRate:
                        {
                          fallData.setRespRate(int.tryParse(text));
                        }
                        break;
                      case Strings.oxygenSaturation:
                        {
                          fallData.setOxygenSat(int.tryParse(text));
                        }
                      break;
                      case Strings.bloodGlucose:
                        {
                          fallData.setBGL(double.tryParse(text));
                        }
                      break;
                    }

                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InjuryCheckBox extends StatefulWidget {

  final String type;
  final String titleText;

  InjuryCheckBox({@required this.type, @required this.titleText});


  @override
  _InjuryCheckBoxState createState() => _InjuryCheckBoxState();
}

class _InjuryCheckBoxState extends State<InjuryCheckBox> {
  @override
  Widget build(BuildContext context) {

    final fallData = Provider.of<FallData>(context, listen: true);

    bool checkBoxState;

    switch (widget.type) {
      case Strings.unwitnessedFall:
        {
          checkBoxState = (fallData.getFallWitnessed == null || fallData.getFallWitnessed == false) ? false : true;
        }
        break;
      case Strings.hitHead:
        {
          checkBoxState = (fallData.getHitHead == null || fallData.getHitHead == false) ? false : true;
        }
        break;
      case Strings.nausea:
        {
          checkBoxState = (fallData.getNausea == null || fallData.getNausea == false) ? false : true;
        }
        break;
      case Strings.vomiting:
        {
          checkBoxState = (fallData.getVomit == null || fallData.getVomit == false) ? false : true;
        }
        break;
      case Strings.severeHeadache:
        {
          checkBoxState = (fallData.getSevHeadache == null || fallData.getSevHeadache == false) ? false : true;
        }
        break;
      case Strings.neckPain:
        {
          checkBoxState = (fallData.getNeckPain == null || fallData.getNeckPain == false) ? false : true;
        }
        break;
      case Strings.changeOfConsciousness:
        {
          checkBoxState = (fallData.getChangeConious == null || fallData.getChangeConious == false) ? false : true;
        }
        break;
      case Strings.takingAntiCoagulants:
        {
          checkBoxState = (fallData.getAntiCoag == null || fallData.getAntiCoag == false) ? false : true;
        }
        break;
      case Strings.cutsOrLacerations:
        {
          checkBoxState = (fallData.getCut == null || fallData.getCut == false) ? false : true;
        }
        break;

      case Strings.unableToWeightBear:
        {
          checkBoxState = (fallData.getWeightBear == null || fallData.getWeightBear == false) ? false : true;
        }
        break;
    }



    return Padding(
      padding: const EdgeInsets.only(left:8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          InkWell(
            child: Image.asset(checkBoxState ? 'assets/tickchecked.png':'assets/tickunchecked.png',
              width: 30,
              height: 30,
            ),
            onTap: () {
              setState(() {

                switch (widget.type) {
                  case Strings.unwitnessedFall:
                    {
                      fallData.setFallWitnessed(
                          (fallData.getFallWitnessed == null ||
                              fallData.getFallWitnessed == false)
                              ? true
                              : false);                    }
                    break;
                  case Strings.hitHead:
                    {
                      fallData.setHitHead(
                          (fallData.getHitHead == null ||
                              fallData.getHitHead == false)
                              ? true
                              : false);                    }
                    break;
                  case Strings.nausea:
                    {
                      fallData.setNausea(
                          (fallData.getNausea == null ||
                              fallData.getNausea == false)
                              ? true
                              : false);                    }
                    break;
                  case Strings.vomiting:
                    {
                      fallData.setVomit(
                          (fallData.getVomit == null ||
                              fallData.getVomit == false)
                              ? true
                              : false);                    }
                    break;
                  case Strings.severeHeadache:
                    {
                      fallData.setSevHeadache(
                          (fallData.getSevHeadache == null ||
                              fallData.getSevHeadache == false)
                              ? true
                              : false);                    }
                    break;
                  case Strings.neckPain:
                    {
                      fallData.setNeckPain(
                          (fallData.getNeckPain == null ||
                              fallData.getNeckPain == false)
                              ? true
                              : false);                    }
                    break;
                  case Strings.changeOfConsciousness:
                    {
                      fallData.setChangeConcious(
                          (fallData.getChangeConious == null ||
                              fallData.getChangeConious == false)
                              ? true
                              : false);                    }
                    break;
                  case Strings.takingAntiCoagulants:
                    {
                      fallData.setAntiCoag(
                          (fallData.getAntiCoag == null ||
                              fallData.getAntiCoag == false)
                              ? true
                              : false);                    }
                    break;
                  case Strings.cutsOrLacerations:
                    {
                      fallData.setCut(
                          (fallData.getCut == null ||
                              fallData.getCut == false)
                              ? true
                              : false);                    }
                    break;

                  case Strings.unableToWeightBear:
                    {
                      fallData.setWeightBear(
                          (fallData.getWeightBear == null ||
                              fallData.getWeightBear == false)
                              ? true
                              : false);                    }
                    break;
                }

              });
            },
          ),
          SizedBox(width: 12,),
          Text(widget.titleText),
        ],
      ),
    );
  }
}


class TextEntryField extends StatefulWidget {

  final String type;
  final String hintText;


  TextEntryField({
    @required this.type,
    @required this.hintText,
  });

  @override
  _TextEntryFieldState createState() => _TextEntryFieldState();
}

class _TextEntryFieldState extends State<TextEntryField> {
  @override
  Widget build(BuildContext context) {

    final fallData = Provider.of<FallData>(context, listen: true);

    String initialValue;

    switch (widget.type) {
      case Strings.personsName:
        {
          initialValue = (fallData.getName == null || fallData.getName == null) ? null : fallData.getName.toString();
        }
        break;
      case Strings.fallDescription:
        {
          initialValue = (fallData.getFallDesc == null) ? null : fallData.getFallDesc.toString();
        }
        break;
      case Strings.timeOnGround:
        {
          initialValue = (fallData.getTimeOnGround == null) ? null : fallData.getTimeOnGround.toString();
        }
        break;
      case Strings.otherInfo:
        {
          initialValue = (fallData.getOtherInfo == null) ? null : fallData.getOtherInfo.toString();
        }
        break;
    }

    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(30),
      child: TextFormField(
        initialValue: initialValue,
        keyboardType: (widget.type == Strings.timeOnGround) ? TextInputType.number : TextInputType.text,
        autofocus: false,
        textAlign: TextAlign.center,
        decoration: InputDecoration.collapsed(
          border: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(30.0),
            ),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: widget.hintText,
        ),
        onChanged: (text) {
          switch (widget.type) {
            case Strings.personsName:
              {
                fallData.setName(text);
              }
              break;
            case Strings.fallDescription:
              {
                fallData.setFallDesc(text);
              }
              break;
            case Strings.timeOnGround:
              {
                fallData.setTimeOnGround(int.tryParse(text));
              }
              break;
            case Strings.otherInfo:
              {
                fallData.setOtherInfo(text);
              }
              break;
          }

        },
      ),
    );
  }
}


class BottomButton extends StatelessWidget {

  final String text;
  final String route;
  final bool updateDatabase;
  final bool finalScreen;

  BottomButton({@required this.text, @required this.route, this.updateDatabase, this.finalScreen});

  @override
  Widget build(BuildContext context) {
    final fallData = Provider.of<FallData>(context, listen: true);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: (Column(
          children: <Widget>[

            RaisedButton(color: mainColor,child: Text(text, style: TextStyle(color: Colors.white),),
              onPressed: () async{

              if (finalScreen != null && finalScreen){

                // If they have not selected the tick boxes set them to false
                fallData.getFallWitnessed ?? fallData.setFallWitnessed(false);
                fallData.getHitHead ?? fallData.setHitHead(false);
                fallData.getNausea ?? fallData.setNausea(false);
                fallData.getVomit ?? fallData.setVomit(false);
                fallData.getSevHeadache ?? fallData.setSevHeadache(false);
                fallData.getNeckPain ?? fallData.setNeckPain(false);
                fallData.getChangeConious ?? fallData.setChangeConcious(false);
                fallData.getAntiCoag ?? fallData.setAntiCoag(false);
                fallData.getCut ?? fallData.setCut(false);
                fallData.getWeightBear ?? fallData.setWeightBear(false);


                //  IF  TRUE TO unable to weight bear without pain” → suspect fracture screen
                // IF TRUE TO any two of the following four (if that works - if not I would go to the suspect fracture screen if any of those below are true) → suspect fracture screen
                // Yes to having pain
                // Yes to having tenderness on palpation
                // Yes to having increase in pain with movement
                // Yes to having Limb shortening with deformity
                int numberOfSuspectFractures = 0;
                if (fallData.getPain != null && fallData.getPain) {
                  numberOfSuspectFractures++;
                }
                if (fallData.getBonyTenderness != null &&
                    fallData.getBonyTenderness) {
                  numberOfSuspectFractures++;
                }
                if (fallData.getChangePainWithMovement != null &&
                    fallData.getChangePainWithMovement) {
                  numberOfSuspectFractures++;
                }
                if (fallData.getLimbShort != null &&
                    fallData.getLimbShort) {
                  numberOfSuspectFractures++;
                }

                if (numberOfSuspectFractures >= 2 ||
                    fallData.getWeightBear) {
                  fallData.setSuspectedFracture(true);
                } else {
                  fallData.setSuspectedFracture(false);
                }

                //Upper and Lower limits
                //int bpH; High >170 mmHg (millimeters of mercury). Low <90mmHg
                //int bpL; High > 110mmHg. Low <50mmHg
                //int hR; High >100bpm (beats per minute). Low 50bpm
                //int pupils; unsure atm I’ll find this out
                //double bgl; blood glucose high: 7.8mmol/L (millimoles per litre) - (non-diabetic). 8.5mmol/L to (Diabetics). ← might need a dropdown question if they are diabetic or not. If thats too hard atm then we can just go with 7.8mmol/L as too high. Low 4.0
                //Temperature: High: >37.9 Low: <36.1 celcius degrees (C)

                //Possible Injury screen
                //IF TRUE TO ANY OF THE FOLLOWING
                //Change of consciousness
                //Cut or laceration
                //High or low BP
                //High or low HR
                //Pupils - abnormal
                //IF TRUE TO THESE TWO
                //Taking anti-coagulants and suspected hit head.
                //Nausea and suspected hit head.
                //Vomiting and suspected hit head.
                //A severe headache and suspected hit head.
                //Neck pain and suspected hit head.

                if (fallData.getChangeConious ||
                    fallData.getCut ||
                    fallData.getBPSis != null &&
                        fallData.getBPDia > 170 ||
                    fallData.getBPSis != null &&
                        fallData.getBPDia < 90 ||
                    fallData.getBPDia != null &&
                        fallData.getBPSis > 110 ||
                    fallData.getBPDia != null &&
                        fallData.getBPSis < 50 ||
                    fallData.getHr != null &&
                        fallData.getHr > 100 ||
                    fallData.getHr != null && fallData.getHr < 50 ||
                    fallData.getAntiCoag != null &&
                        fallData.getAntiCoag &&
                        fallData.getHitHead != null &&
                        fallData.getHitHead ||
                    fallData.getNausea != null &&
                        fallData.getNausea &&
                        fallData.getHitHead != null &&
                        fallData.getHitHead ||
                    fallData.getVomit != null &&
                        fallData.getVomit ||
                    fallData.getSevHeadache != null &&
                        fallData.getSevHeadache &&
                        fallData.getHitHead != null &&
                        fallData.getHitHead ||
                    fallData.getNeckPain != null &&
                        fallData.getNeckPain &&
                        fallData.getHitHead != null &&
                        fallData.getHitHead ||
                    fallData.getPupilL != null &&
                        fallData.getPupilL < 0 ||
                    fallData.getPupilR != null &&
                        fallData.getPupilR < 0 ||
                    fallData.getPupilL != null &&
                        fallData.getPupilR != null &&
                        fallData.getPupilL != fallData.getPupilR ||
                    fallData.getFallWitnessed != null &&
                        !fallData.getFallWitnessed ||
                    fallData.getRespRate != null &&
                        fallData.getRespRate < 12 ||
                    fallData.getRespRate != null &&
                        fallData.getRespRate > 22 ||
                    fallData.oxygenSaturation != null &&
                        fallData.oxygenSaturation < 95 ||
                    fallData.getBGL != null &&
                        fallData.getBGL > 7.8 ||
                    fallData.getBGL != null &&
                        fallData.getBGL < 4.0) {
                  fallData.setPossibleInjury(true);
                } else {
                  fallData.setPossibleInjury(false);
                }

              }

              if (updateDatabase) {
                 updateFirestoreDocument(
                    collection: 'falls',
                    id: fallData.getFallID,
                    fallData: fallData);

                editFallInDatabase(fallKey: fallData.getLocalDBID,fallData: fallData.toJson());
              }


              Navigator.pushNamed(context, route, arguments: fallData.getLocalDBID);

            },),
          ],
        )),
      ),
    );
  }
}




