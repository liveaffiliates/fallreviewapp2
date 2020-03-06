import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fallreview/models/fallmodel.dart';
import 'package:fallreview/utilities/string.dart';

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
  String title;
  String type;

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
            child: TextFormField(
              initialValue: textFieldInitialValue,
              autofocus: false,
              decoration: InputDecoration.collapsed(
                filled: true,
                fillColor: Colors.grey,
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
      ],
    );
  }
}

class VitalSignInput extends StatefulWidget {
  String type;
  String hintText;
  String icon;

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

