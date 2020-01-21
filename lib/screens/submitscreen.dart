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
                      'not assesed' : (snapshot.data['unconciousNotBreathingBleeding'] ? 'Person is in serious danger. Referred to ACD and sent for urgent medical attention.' : 'Person is not in serious danger.');

              // Suspect fracture
              String pain = (snapshot.data['pain'] == null) ? 'not assesed' : (snapshot.data['pain']) ? 'Person has pain.' : 'Person does not demonstrate or report pain.';
              String painDesc = (snapshot.data['painDesc'] == null) ? 'not assesed' : snapshot.data['painDesc'];
              String bonyTenderness = (snapshot.data['bonyTenderness'] == null) ? 'not assesed' : snapshot.data['bonyTenderness'] ? 'Person has bony tenderness.' : 'Person does not have bony tenderness.';
              String bonyTendernessDesc = (snapshot.data['bonyTendernessDesc'] == null) ? 'not assesed' : snapshot.data['bonyTendernessDesc'];
              String changePainWithMov =   (snapshot.data['changePainWithMov'] == null) ? 'not assesed' : (snapshot.data['changePainWithMov']) ? 'Person has pain with movement.' : 'Person does not have changes in pain with movement of upper or lower limbs.';
              String changePainWithMovDesc = (snapshot.data['changePainWithMovDesc'] == null) ? 'not assesed' : snapshot.data['changePainWithMovDesc'];
              String limbShort = (snapshot.data['limbShort'] == null) ? 'not assesed' : (snapshot.data['limbShort']) ? 'Person has a visible deformity.' : 'Person has no deformity or limb shortening.';
              String limbShortDecs = (snapshot.data['limbShortDecs'] == null) ? 'not assesed' : (snapshot.data['limbShortDecs']);

              // Vital Signs
              int bpDia = snapshot.data['bpDia'];
              int bpSis = snapshot.data['bpSis'];
              String bp = (bpDia == null|| bpSis == null) ? 'not assesed' : (bpSis.toString() + '/' + bpDia.toString() + ' mmHg');

              String hR = (snapshot.data['hR'] == null) ? 'not assesed' : (snapshot.data['hR'].toString() + ' BPM' );
              String bgl = (snapshot.data['bgl'] == null) ? 'not assesed' : (snapshot.data['bgl'].toString() + ' mg/dL');
              String temperature = (snapshot.data['temperature'] == null) ? 'not assesed' : (snapshot.data['temperature'].toString() + '°C');

              // Injury check
              String hitHead = (snapshot.data['hitHead'] == null) ?  'not assesed' : snapshot.data['hitHead'] ? 'Person hit head' : 'False';
              String nausea = (snapshot.data['nausea'] == null) ?  'not assesed' : snapshot.data['nausea'] ? 'Person complains of nausea.' : 'No Nausea.';
              String vomit = (snapshot.data['vomit'] == null) ?  'not assesed' : snapshot.data['vomit'] ? 'Person vomiting.' : 'No vomiting.';
              String sevHeadache = (snapshot.data['sevHeadache'] == null) ?  'not assesed' : snapshot.data['sevHeadache'] ? 'Person complains of severe headaches.' : 'No complaints of severe headaches.';
              String cut = (snapshot.data['cut'] == null) ?  'not assesed' : snapshot.data['cut'] ? 'Person has a lacerations from fall. Wound chart required.' : 'No cuts or lacerations seen during assessment.';
              String neckPain = (snapshot.data['neckPain'] == null) ?  'not assesed' : snapshot.data['neckPain'] ? 'Person complains of neck pain.' : 'No complaints of neck pain';
              String changConcious = (snapshot.data['changConcious'] == null) ?  'not assesed' : snapshot.data['changConcious'] ? 'Signs of changes to consciousness. Nurse to monitor consciousness.' : 'No signs of changes to consciousness.';
              String antiCoag = (snapshot.data['antiCoag'] == null) ?  'not assesed' : snapshot.data['antiCoag'] ? 'Person is taking anti-coagulants.' : 'Person not currently taking anti-coagulants.';
              String weightBear = (snapshot.data['weightBear'] == null) ?  'not assesed' : snapshot.data['weightBear'] ? 'Person unable to weight bear due to pain.' : 'Person has no pain with weight bearing.';

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


                            if (unconciousNotBreathingBleeding != 'not assesed')
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),

                                Text(
                                  unconciousNotBreathingBleeding,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal, fontSize: 16),
                                ),
                              ],
                            ),


                            if (pain != 'not assesed')
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  pain,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal, fontSize: 16),
                                ),

                                if(pain != 'not assesed' && painDesc != 'not assesed')Text(
                                  painDesc,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal, fontSize: 16),
                                ),
                              ],
                            ),




                            if (bonyTenderness != 'not assesed')
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  bonyTenderness,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal, fontSize: 16),
                                ),

                                if(bonyTenderness != 'not assesed' && bonyTendernessDesc != 'not assesed')Text(
                                  bonyTendernessDesc,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal, fontSize: 16),
                                ),
                              ],
                            ),


                            if (changePainWithMov != 'not assesed')
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  changePainWithMov,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal, fontSize: 16),
                                ),
                                if(changePainWithMov != 'not assesed' && changePainWithMovDesc != 'not assesed')Text(
                                  changePainWithMovDesc,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal, fontSize: 16),
                                ),
                              ],
                            ),


                            if (limbShort != 'not assesed')
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),

                                Text(
                                  limbShort,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal, fontSize: 16),
                                ),
                                if(limbShort != 'not assesed' && limbShortDecs != 'not assesed')Text(
                                  limbShortDecs,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal, fontSize: 16),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 10,
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
                              height: 10,
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
                              height: 10,
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
                              height: 10,
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

                            if(hitHead != 'not assesed' && hitHead != 'False' )SizedBox(
                              height: 10,
                            ),
                            if(hitHead != 'not assesed' && hitHead != 'False' )Text(
                              'Hit head',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16),
                            ),
                            if(hitHead != 'not assesed' && hitHead != 'False' )Text(
                              hitHead,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            Text(
                              nausea,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            Text(
                              vomit,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            Text(
                              sevHeadache,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            Text(
                              cut,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            Text(
                              neckPain,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            Text(
                              changConcious,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            Text(
                              antiCoag,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16),
                            ),
                            SizedBox(
                              height: 10,
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
                                      //String password = 'startup20';

                                      final smtpServer = gmail(username, password);

                                      String emailString = 'Fall Summary\n\n\n';

                                      emailString = emailString + name + '\n\n';

                                      if (unconciousNotBreathingBleeding != 'not assesed') {
                                        emailString = emailString + unconciousNotBreathingBleeding + '\n\n';
                                      }

                                      if (pain != 'not assesed') {
                                        emailString = emailString + pain+ '\n\n';
                                      }

                                      if (painDesc != 'not assesed') {
                                        emailString = emailString + painDesc+ '\n\n';
                                      }

                                      if (bonyTenderness != 'not assesed') {
                                        emailString = emailString + bonyTenderness+ '\n\n';
                                      }

                                      if (bonyTendernessDesc != 'not assesed') {
                                        emailString = emailString + bonyTendernessDesc+ '\n\n';
                                      }

                                      if (changePainWithMov != 'not assesed') {
                                        emailString = emailString + changePainWithMov+ '\n\n';
                                      }

                                      if (changePainWithMovDesc != 'not assesed') {
                                        emailString = emailString + changePainWithMovDesc+ '\n\n';
                                      }

                                      if (limbShort != 'not assesed') {
                                        emailString = emailString + limbShort+ '\n\n';
                                      }

                                      if (limbShortDecs != 'not assesed') {
                                        emailString = emailString + limbShortDecs+ '\n\n';
                                      }

                                      emailString = emailString + 'Blood pressure: '+ bp +'\n\n';
                                      emailString = emailString + 'Heart rate: '+ hR +'\n\n';
                                      emailString = emailString + 'Blood glucose level: '+ bgl +'\n\n';
                                      emailString = emailString + 'Temperature: '+ temperature +'\n\n';
                                      emailString = emailString +  nausea +'\n\n';
                                      emailString = emailString +  vomit +'\n\n';
                                      emailString = emailString +  sevHeadache +'\n\n';
                                      emailString = emailString +  cut +'\n\n';
                                      emailString = emailString +  neckPain +'\n\n';
                                      emailString = emailString +  changConcious +'\n\n';
                                      emailString = emailString +  antiCoag +'\n\n';emailString = emailString +  changConcious +'\n\n';
                                      emailString = emailString +  weightBear +'\n\n';


                                      // Create our message.
                                      final message = Message()
                                        ..from = Address(username, 'SummaRise App')
                                        ..recipients.add('daniel@hughealth.com.au')
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
