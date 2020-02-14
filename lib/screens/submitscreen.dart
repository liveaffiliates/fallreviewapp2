import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fallreview/screens/allscreens.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:fallreview/popups/generalinfopopup.dart';

class SubmitScreen extends StatefulWidget {
  final String fallID;

  SubmitScreen(this.fallID);

  static const String id = 'Submit_Screen';

  @override
  _SubmitScreenState createState() => _SubmitScreenState();
}

class _SubmitScreenState extends State<SubmitScreen> {

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fall Report'),
      ),
      body: StreamBuilder<Object>(
          stream: Firestore.instance
              .collection('falls')
              .document(widget.fallID)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.active &&
                snapshot.hasData) {
//            // Time
//            String fallTime = snapshot.data['fallTime'] ?? -1;

              // Name
              String name = snapshot.data['name'] ?? 'No name provided';

              // Unconcious / Not Breathing / Bleeding
              String unconciousNotBreathingBleeding =
              (snapshot.data['unconciousNotBreathingBleeding'] == null)?
                      'not assessed' : (snapshot.data['unconciousNotBreathingBleeding'] ? 'Person is in serious danger. Referred to ACD and sent for urgent medical attention.' : 'Person is not in serious danger.');

              // Suspect fracture
              String pain = (snapshot.data['pain'] == null) ? 'not assessed' : (snapshot.data['pain']) ? 'Person has pain: ' + snapshot.data['painDesc'] ?? '' : 'Person does not demonstrate or report pain.';
//              String painDesc = (snapshot.data['painDesc'] == null) ? '' : snapshot.data['painDesc'];
              String bonyTenderness = (snapshot.data['bonyTenderness'] == null) ? 'not assessed' : snapshot.data['bonyTenderness'] ? 'Person has bony tenderness: ' + snapshot.data['bonyTendernessDesc'] ?? '' : 'Person does not have bony tenderness.';
//              String bonyTendernessDesc = (snapshot.data['bonyTendernessDesc'] == null) ? '' : snapshot.data['bonyTendernessDesc'];
              String changePainWithMov =   (snapshot.data['changePainWithMov'] == null) ? 'not assessed' : (snapshot.data['changePainWithMov']) ? 'Person has pain with movement: ' + snapshot.data['changePainWithMovDesc'] ?? '' : 'Person does not have changes in pain with movement of upper or lower limbs.';
//              String changePainWithMovDesc = (snapshot.data['changePainWithMovDesc'] == null) ? '' : snapshot.data['changePainWithMovDesc'];
              String limbShort = (snapshot.data['limbShort'] == null) ? 'not assessed' : (snapshot.data['limbShort']) ? 'Person has a visible deformity: ' + snapshot.data['limbShortDecs'] ?? '' : 'Person has no deformity or limb shortening.';
//              String limbShortDecs = (snapshot.data['limbShortDecs'] == null) ? '' : (snapshot.data['limbShortDecs']);

              // Vital Signs
              int bpDia = snapshot.data['bpDia'];
              int bpSis = snapshot.data['bpSis'];
              String bp = (bpDia == null|| bpSis == null) ? 'not assessed' : (bpSis.toString() + '/' + bpDia.toString() + ' mmHg');

              String hR = (snapshot.data['hR'] == null) ? 'not assessed' : (snapshot.data['hR'].toString() + ' BPM' );
              String bgl = (snapshot.data['bgl'] == null) ? 'not assessed' : (snapshot.data['bgl'].toString() + ' mmol/L');
              String temperature = (snapshot.data['temperature'] == null) ? 'not assessed' : (snapshot.data['temperature'].toString() + '°C');

              // Injury check
              String hitHead = (snapshot.data['hitHead'] == null) ?  'not assessed' : snapshot.data['hitHead'] ? 'Person hit head' : 'False';
              String nausea = (snapshot.data['nausea'] == null) ?  'not assessed' : snapshot.data['nausea'] ? 'Person complains of nausea.' : 'No Nausea.';
              String vomit = (snapshot.data['vomit'] == null) ?  'not assessed' : snapshot.data['vomit'] ? 'Person vomiting.' : 'No vomiting.';
              String sevHeadache = (snapshot.data['sevHeadache'] == null) ?  'not assessed' : snapshot.data['sevHeadache'] ? 'Person complains of severe headaches.' : 'No complaints of severe headaches.';
              String cut = (snapshot.data['cut'] == null) ?  'not assessed' : snapshot.data['cut'] ? 'Person has a lacerations from fall. Wound chart required.' : 'No cuts or lacerations seen during assessment.';
              String neckPain = (snapshot.data['neckPain'] == null) ?  'not assessed' : snapshot.data['neckPain'] ? 'Person complains of neck pain.' : 'No complaints of neck pain';
              String changConcious = (snapshot.data['changConcious'] == null) ?  'not assessed' : snapshot.data['changConcious'] ? 'Signs of changes to consciousness. Nurse to monitor consciousness.' : 'No signs of changes to consciousness.';
              String antiCoag = (snapshot.data['antiCoag'] == null) ?  'not assessed' : snapshot.data['antiCoag'] ? 'Person is taking anti-coagulants.' : 'Person not currently taking anti-coagulants.';
              String weightBear = (snapshot.data['weightBear'] == null) ?  'not assessed' : snapshot.data['weightBear'] ? 'Person unable to weight bear due to pain.' : 'Person has no pain with weight bearing.';

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
                            Text(
                              'Confirm fall information',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              name,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16),
                            ),


                            if (unconciousNotBreathingBleeding != 'not assessed')
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 2,
                                ),

                                Text(
                                  unconciousNotBreathingBleeding,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal, fontSize: 16),
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
                                      fontWeight: FontWeight.normal, fontSize: 16),
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
                                      fontWeight: FontWeight.normal, fontSize: 16),
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
                                      fontWeight: FontWeight.normal, fontSize: 16),
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
                                      fontWeight: FontWeight.normal, fontSize: 16),
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
                                      fontWeight: FontWeight.normal, fontSize: 16),
                                ),

                                Text(
                                  bp,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal, fontSize: 16),
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
                                      fontWeight: FontWeight.normal, fontSize: 16),
                                ),

                                Text(
                                  hR,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal, fontSize: 16),
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
                                      fontWeight: FontWeight.normal, fontSize: 16),
                                ),

                                Text(
                                  bgl,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal, fontSize: 16),
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
                                      fontWeight: FontWeight.normal, fontSize: 16),
                                ),

                                Text(
                                  temperature,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal, fontSize: 16),
                                ),
                              ],
                            ),

                            if(hitHead != 'not assessed' && hitHead != 'False' )SizedBox(
                              height: 2,
                            ),

                            if(hitHead != 'not assessed' && hitHead != 'False' )Text(
                              hitHead,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16),
                            ),
                            SizedBox(
                              height: 2,
                            ),

                            Text(
                              nausea,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16),
                            ),
                            SizedBox(
                              height: 2,
                            ),

                            Text(
                              vomit,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16),
                            ),
                            SizedBox(
                              height: 2,
                            ),

                            Text(
                              sevHeadache,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16),
                            ),
                            SizedBox(
                              height: 2,
                            ),

                            Text(
                              cut,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16),
                            ),
                            SizedBox(
                              height: 2,
                            ),

                            Text(
                              neckPain,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16),
                            ),
                            SizedBox(
                              height: 2,
                            ),

                            Text(
                              changConcious,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16),
                            ),
                            SizedBox(
                              height: 2,
                            ),

                            Text(
                              antiCoag,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16),
                            ),
                            SizedBox(
                              height: 2,
                            ),

                            Text(
                              weightBear,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16),
                            ),

                            Container(height: 50,),

                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: (Column(
                                  children: <Widget>[
                                    RaisedButton(child: Text('Submit'), onPressed: () async {

                                      String username = 'fallsreview@gmail.com';
                                      String password = 'jkknmrbwgjjswpme';


                                      final smtpServer = gmail(username, password);

                                      String emailString = 'Fall Summary\n\n\n';

                                      emailString = emailString + name + '\n';

                                      if (unconciousNotBreathingBleeding != 'not assessed') {
                                        emailString = emailString + unconciousNotBreathingBleeding + '\n';
                                      }

                                      if (pain != 'not assessed') {
                                        emailString = emailString + pain + '\n';
                                      }

                                      if (bonyTenderness != 'not assessed') {
                                        emailString = emailString + bonyTenderness +  '\n';
                                      }

                                      if (changePainWithMov != 'not assessed') {
                                        emailString = emailString + changePainWithMov + '\n';
                                      }

                                      if (limbShort != 'not assessed') {
                                        emailString = emailString + limbShort + '\n';
                                      }


                                      emailString = emailString + 'Blood pressure: '+ bp +'\n';
                                      emailString = emailString + 'Heart rate: '+ hR +'\n';
                                      emailString = emailString + 'Blood glucose level: '+ bgl +'\n';
                                      emailString = emailString + 'Temperature: '+ temperature +'\n';
                                      emailString = emailString +  nausea +'\n';
                                      emailString = emailString +  vomit +'\n';
                                      emailString = emailString +  sevHeadache +'\n';
                                      emailString = emailString +  cut +'\n';
                                      emailString = emailString +  neckPain +'\n';
                                      emailString = emailString +  changConcious +'\n';
                                      emailString = emailString +  antiCoag +'\n';emailString = emailString +  changConcious +'\n\n';
                                      emailString = emailString +  weightBear +'\n';


                                      // Create our message.
                                      final message = Message()
                                        ..from = Address(username, 'SummaRise App')
                                        //..recipients.add('daniel@hughealth.com.au')
                                        ..recipients.add('nickmuir@y7mail.com')
                                        ..subject = 'New Fall Summary'
                                        ..text = emailString;
                                        //..html = "<h1>Fall Summary</h1>\n<p>Hey! Here's some HTML content</p>";

                                      setState(() {
                                        loading = true;
                                      });

                                      try {
                                        final sendReport = await send(message, smtpServer).then((onValue){

                                          Navigator.pushNamed(context, HomeScreen.id,);

                                          showDialog(
                                            context: context,
                                            builder: (_) => GeneralnfoPopup('Summary successfully sent'),
                                          );
                                        });

                                        print('Message sent: ' + sendReport.toString());
                                      } on MailerException catch (e) {
                                        showDialog(
                                          context: context,
                                          builder: (_) => GeneralnfoPopup('Summary not sent.' + e.toString()),
                                        );

                                      }

                                    },),
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
                          Center(child: CircularProgressIndicator(),),
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
