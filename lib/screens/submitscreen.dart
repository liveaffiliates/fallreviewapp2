import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fallreview/screens/allscreens.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:fallreview/popups/generalinfopopup.dart';
import 'package:fallreview/database/sembastfunctions.dart';
import 'package:fallreview/models/fallmodel.dart';
import 'package:fallreview/utilities/utilities.dart';
import 'package:provider/provider.dart';

class SubmitScreen extends StatefulWidget {
  final int localDBID;

  SubmitScreen(this.localDBID);

  static const String id = 'Submit_Screen';

  @override
  _SubmitScreenState createState() => _SubmitScreenState();
}

class _SubmitScreenState extends State<SubmitScreen> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {

    final fallData = Provider.of<FallData>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text('Fall Report'),
      ),
      body: FutureBuilder<Object>(
          future: getSingleRecordFromDatabase(key: widget.localDBID),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              FallData fall = snapshot.data;

              // Name
              String name = fall.getName ?? 'No name provided';

              // Date time of fall
              String fallDateTime =
                  epochIntToDateString(epochInt: fall.getFallTime);

              // Fall Description
              String description =
                  fall.getFallDesc ?? 'No description provided';

              // Time on ground
              String timeOnGround = (fall.getTimeOnGround == null) ? 'Not recorded' : fall.getTimeOnGround.toString();

              // Unconcious / Not Breathing / Bleeding
              String unconciousNotBreathingBleeding = (fall
                          .getUnconciousNotBreathingBleeding ==
                      null)
                  ? 'not assessed'
                  : (fall.getUnconciousNotBreathingBleeding
                      ? 'Person is in serious danger. Referred to ACD and sent for urgent medical attention.'
                      : 'Person is not in serious danger.');

              // Suspect fracture
              String pain = (fall.getPain == null)
                  ? 'not assessed'
                  : (fall.getPain)
                      ? 'Person has pain: ' + fall.getPainDesc.toString()
                      : 'Person does not demonstrate or report pain.';
              String bonyTenderness = (fall.getBonyTenderness == null)
                  ? 'not assessed'
                  : fall.getBonyTenderness
                      ? 'Person has bony tenderness: ' +
                              fall.getBonyTendernessDesc.toString()
                      : 'Person does not have bony tenderness.';
              String changePainWithMov = (fall.getChangePainWithMovement ==
                      null)
                  ? 'not assessed'
                  : (fall.getChangePainWithMovement)
                      ? 'Person has pain with movement: ' +
                              fall.changePainWithMovDesc.toString()
                      : 'Person does not have changes in pain with movement of upper or lower limbs.';
              String limbShort = (fall.getLimbShort == null)
                  ? 'not assessed'
                  : (fall.getLimbShort)
                      ? 'Person has a visible deformity: ' +
                              fall.getLimbShortDesc.toString()
                      : 'Person has no deformity or limb shortening.';

              // Vital Signs
              int bpDia = fall.getBPDia;
              int bpSis = fall.getBPSis;
              String bp = (bpDia == null || bpSis == null)
                  ? 'not assessed'
                  : (bpSis.toString() + '/' + bpDia.toString() + ' mmHg');

              String hR = (fall.getHr == null)
                  ? 'not assessed'
                  : (fall.getHr.toString() + ' BPM');
              String bgl = (fall.getBGL == null)
                  ? 'not assessed'
                  : (fall.getBGL.toString() + ' mmol/L');
              String temperature = (fall.getTemperature == null)
                  ? 'not assessed'
                  : (fall.getTemperature.toString() + '°C');
              String respRate = (fall.getRespRate == null)
                  ? 'not assessed'
                  : (fall.getRespRate.toString() + ' bpm');
              String pupilL = (fall.getPupilL == null)
                  ? 'not assessed'
                  : fall.getPupilL.toString();
              String pupilR = (fall.getPupilR == null)
                  ? 'not assessed'
                  : fall.getPupilR.toString();
              String pupilDesc =
                  (fall.getPupilDesc == null) ? '' : fall.getPupilDesc;
              String oxygenSaturation = (fall.getOxygenSat == null)
                  ? 'not assessed'
                  : (fall.getOxygenSat.toString() + ' %');

              // Injury check
              String fallWitnessed = (fall.getFallWitnessed == null)
                  ? 'Fall Not Witnessed'
                  : fall.getFallWitnessed
                      ? 'Fall was witnessed'
                      : 'Fall was not witnessed';
              String hitHead = (fall.getHitHead == null)
                  ? 'not assessed'
                  : fall.getHitHead
                      ? 'Person hit head'
                      : 'Person did not hit head';
              String nausea = (fall.getNausea == null)
                  ? 'not assessed'
                  : fall.getNausea
                      ? 'Person complains of nausea.'
                      : 'No Nausea.';
              String vomit = (fall.getVomit == null)
                  ? 'not assessed'
                  : fall.getVomit ? 'Person vomiting.' : 'No vomiting.';
              String sevHeadache = (fall.getSevHeadache == null)
                  ? 'not assessed'
                  : fall.getSevHeadache
                      ? 'Person complains of severe headaches.'
                      : 'No complaints of severe headaches.';
              String cut = (fall.getCut == null)
                  ? 'not assessed'
                  : fall.getCut
                      ? 'Person has a lacerations from fall. Wound chart required.'
                      : 'No cuts or lacerations seen during assessment.';
              String neckPain = (fall.getNeckPain == null)
                  ? 'not assessed'
                  : fall.getNeckPain
                      ? 'Person complains of neck pain.'
                      : 'No complaints of neck pain';
              String changConcious = (fall.getChangeConious == null)
                  ? 'not assessed'
                  : fall.getChangeConious
                      ? 'Signs of changes to consciousness. Nurse to monitor consciousness.'
                      : 'No signs of changes to consciousness.';
              String antiCoag = (fall.getAntiCoag == null)
                  ? 'not assessed'
                  : fall.getAntiCoag
                      ? 'Person is taking anti-coagulants.'
                      : 'Person not currently taking anti-coagulants.';
              String weightBear = (fall.getWeightBear == null)
                  ? 'not assessed'
                  : fall.getWeightBear
                      ? 'Person unable to weight bear due to pain.'
                      : 'Person has no pain with weight bearing.';

              // Other information
              String otherInfo =
                  (fall.getOtherInfo == null) ? '' : fall.getOtherInfo;

              return SafeArea(
                child: Stack(
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Confirm fall information',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                InkWell(
                                  child: Icon(
                                    Icons.edit,
                                    size: 30,
                                  ),
                                  onTap: () {
                                    fallData.setCompleteFallInformation(fall);


                                    Navigator.pushNamed(context, PersonsNameScreen.id,);

                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Name: ' + name,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16),
                            ),
                            Text(
                              'Fall date and time: ' + fallDateTime,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16),
                            ),
                            Text(
                              'Fall description: ' + description,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16),
                            ),
                            Text(
                              'Time lying on ground: ' + timeOnGround,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16),
                            ),
                            if (unconciousNotBreathingBleeding !=
                                'not assessed')
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    unconciousNotBreathingBleeding,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            if (pain != 'not assessed')
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    pain,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            if (bonyTenderness != 'not assessed')
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    bonyTenderness,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            if (changePainWithMov != 'not assessed')
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    changePainWithMov,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            if (limbShort != 'not assessed')
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    limbShort,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            SizedBox(
                              height: 2,
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Blood pressure: ',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                ),
                                Text(
                                  bp,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Heart rate: ',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                ),
                                Text(
                                  hR,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Blood glucose level: ',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                ),
                                Text(
                                  bgl,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Temperature: ',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                ),
                                Text(
                                  temperature,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Pupils: ',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                ),
                                Text(
                                  pupilL + ' (left) ' + pupilR + ' (right)',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            if (pupilDesc != '')
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Pupil description: ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    pupilDesc,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Respiratory rate: ',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                ),
                                Text(
                                  respRate,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Oxygen saturation: ',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                ),
                                Text(
                                  oxygenSaturation,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  fallWitnessed,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            if (hitHead != 'not assessed' && hitHead != 'False')
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    'Hit head: ' + hitHead,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Nausea: ' + nausea,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Vomiting: ' + vomit,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Severe headache: ' + sevHeadache,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Cuts or lacerations: ' + cut,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Neck pain: ' + neckPain,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Change in conciousness: ' + changConcious,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Taking anti-coagulents: ' + antiCoag,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Unable to weight bear: ' + weightBear,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16),
                            ),
                            if (otherInfo != '')
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    otherInfo,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            Container(
                              height: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: (Column(
                                  children: <Widget>[
                                    RaisedButton(
                                      child: Text('Submit'),
                                      onPressed: () async {
                                        String username =
                                            'fallsreview@gmail.com';
                                        String password = 'jkknmrbwgjjswpme';

                                        final smtpServer =
                                            gmail(username, password);

                                        String emailString =
                                            'Fall Summary\n\n\n';

                                        emailString = emailString + name + '\n';

                                        emailString =
                                            emailString + fallDateTime + '\n';

                                        emailString =
                                            emailString + description + '\n';

                                        emailString =
                                            emailString + timeOnGround + '\n';

                                        if (unconciousNotBreathingBleeding !=
                                            'not assessed') {
                                          emailString = emailString +
                                              unconciousNotBreathingBleeding +
                                              '\n';
                                        }

                                        if (pain != 'not assessed') {
                                          emailString =
                                              emailString + pain + '\n';
                                        }

                                        if (bonyTenderness != 'not assessed') {
                                          emailString = emailString +
                                              bonyTenderness +
                                              '\n';
                                        }

                                        if (changePainWithMov !=
                                            'not assessed') {
                                          emailString = emailString +
                                              changePainWithMov +
                                              '\n';
                                        }

                                        if (limbShort != 'not assessed') {
                                          emailString =
                                              emailString + limbShort + '\n';
                                        }

                                        emailString = emailString +
                                            'Blood pressure: ' +
                                            bp +
                                            '\n';
                                        emailString = emailString +
                                            'Heart rate: ' +
                                            hR +
                                            '\n';
                                        emailString = emailString +
                                            'Blood glucose level: ' +
                                            bgl +
                                            '\n';
                                        emailString = emailString +
                                            'Temperature: ' +
                                            temperature +
                                            '\n';
                                        emailString = emailString +
                                            'Pupils: ' +
                                            pupilL +
                                            ' (left) ' +
                                            pupilR +
                                            ' (right)' +
                                            '\n';
                                        emailString = emailString +
                                            'Pupil description: ' +
                                            pupilDesc +
                                            '\n';
                                        emailString = emailString +
                                            'Respiratory Rate: ' +
                                            respRate +
                                            '\n';
                                        emailString = emailString +
                                            'Oxygen saturation: ' +
                                            oxygenSaturation +
                                            '\n';

                                        emailString =
                                            emailString + fallWitnessed + '\n';
                                        emailString =
                                            emailString + hitHead + '\n';
                                        emailString =
                                            emailString + nausea + '\n';
                                        emailString =
                                            emailString + vomit + '\n';
                                        emailString =
                                            emailString + sevHeadache + '\n';
                                        emailString = emailString + cut + '\n';
                                        emailString =
                                            emailString + neckPain + '\n';
                                        emailString =
                                            emailString + changConcious + '\n';
                                        emailString =
                                            emailString + antiCoag + '\n';
                                        emailString =
                                            emailString + changConcious + '\n';
                                        emailString =
                                            emailString + weightBear + '\n\n';

                                        emailString =
                                            emailString + otherInfo + '\n';

                                        // Create our message.
                                        final message = Message()
                                          ..from =
                                              Address(username, 'SummaRise App')
                                          //..recipients.add('daniel@hughealth.com.au')
                                          ..recipients
                                              .add('nickmuir@y7mail.com')
                                          ..subject = 'New Fall Summary'
                                          ..text = emailString;
                                        //..html = "<h1>Fall Summary</h1>\n<p>Hey! Here's some HTML content</p>";

                                        setState(() {
                                          loading = true;
                                        });

                                        try {
                                          final sendReport =
                                              await send(message, smtpServer)
                                                  .then((onValue) {
                                            Navigator.pushNamed(
                                              context,
                                              HomeScreen.id,
                                            );

                                            showDialog(
                                              context: context,
                                              builder: (_) => GeneralnfoPopup(
                                                  'Summary successfully sent'),
                                            );
                                          });

                                          print('Message sent: ' +
                                              sendReport.toString());
                                        } on MailerException catch (e) {
                                          showDialog(
                                            context: context,
                                            builder: (_) => GeneralnfoPopup(
                                                'Summary not sent.' +
                                                    e.toString()),
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (loading)
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: CircularProgressIndicator(),
                          ),
                        ],
                      ),
                  ],
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
