import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fallreview/screens/allscreens.dart';

class SubmitScreen extends StatefulWidget {
  final String fallID;

  SubmitScreen(this.fallID);

  static const String id = 'Submit_Screen';

  @override
  _SubmitScreenState createState() => _SubmitScreenState();
}

class _SubmitScreenState extends State<SubmitScreen> {
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
                      'Not Completed' : (snapshot.data['unconciousNotBreathingBleeding'] ? 'True' : 'False');

              // Suspect fracture
              String pain = (snapshot.data['pain'] == null) ? 'Not Completed' : (snapshot.data['pain']) ? 'True' : 'False';
              String painDesc = (snapshot.data['painDesc'] == null) ? 'Not Completed' : snapshot.data['painDesc'];
              String bonyTenderness = (snapshot.data['bonyTenderness'] == null) ? 'Not Completed' : snapshot.data['bonyTenderness'] ? 'True' : 'False';
              String bonyTendernessDesc = (snapshot.data['bonyTendernessDesc'] == null) ? 'Not Completed' : snapshot.data['bonyTendernessDesc'];
              String changePainWithMov =   (snapshot.data['changePainWithMov'] == null) ? 'Not Completed' : (snapshot.data['changePainWithMov']) ? 'True' : 'False';
              String changePainWithMovDesc = (snapshot.data['changePainWithMovDesc'] == null) ? 'Not Completed' : snapshot.data['changePainWithMovDesc'];
              String limbShort = (snapshot.data['limbShort'] == null) ? 'Not Completed' : (snapshot.data['limbShort']) ? 'True' : 'False';
              String limbShortDecs = (snapshot.data['limbShortDecs'] == null) ? 'Not Completed' : (snapshot.data['limbShortDecs']);

              // Vital Signs
              int bpH = snapshot.data['bpH'];
              int bpL = snapshot.data['bpL'];
              String bp = (bpH == null|| bpL == null) ? 'Not Completed' : (bpH.toString() + '/' + bpL.toString() + ' mmHg');

              String hR = (snapshot.data['hR'] == null) ? 'Not Completed' : (snapshot.data['hR'].toString() + ' BPM' );
              String bgl = (snapshot.data['bgl'] == null) ? 'Not Completed' : (snapshot.data['bgl'].toString() + ' mg/dL');
              String temperature = (snapshot.data['temperature'] == null) ? 'Not Completed' : (snapshot.data['temperature'].toString() + '°C');

              // Injury check
              String hitHead = (snapshot.data['hitHead'] == null) ?  'Not Completed' : snapshot.data['hitHead'] ? 'True' : 'False';
              String nausea = (snapshot.data['nausea'] == null) ?  'Not Completed' : snapshot.data['nausea'] ? 'True' : 'False';
              String vomit = (snapshot.data['vomit'] == null) ?  'Not Completed' : snapshot.data['vomit'] ? 'True' : 'False';
              String sevHeadache = (snapshot.data['sevHeadache'] == null) ?  'Not Completed' : snapshot.data['sevHeadache'] ? 'True' : 'False';
              String cut = (snapshot.data['cut'] == null) ?  'Not Completed' : snapshot.data['cut'] ? 'True' : 'False';
              String neckPain = (snapshot.data['neckPain'] == null) ?  'Not Completed' : snapshot.data['neckPain'] ? 'True' : 'False';
              String changConcious = (snapshot.data['changConcious'] == null) ?  'Not Completed' : snapshot.data['changConcious'] ? 'True' : 'False';
              String antiCoag = (snapshot.data['antiCoag'] == null) ?  'Not Completed' : snapshot.data['antiCoag'] ? 'True' : 'False';
              String weightBear = (snapshot.data['weightBear'] == null) ?  'Not Completed' : snapshot.data['weightBear'] ? 'True' : 'False';

              return SafeArea(
                child: SingleChildScrollView(
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
                          'Name',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 16),
                        ),
                        Text(
                          name,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Unconcious / Not Breathing / Bleeding',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 16),
                        ),
                        Text(
                          unconciousNotBreathingBleeding,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Pain',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 16),
                        ),
                        Text(
                          pain,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        if(pain == 'True')Text(
                          painDesc,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Bony Tenderness',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 16),
                        ),
                        Text(
                          bonyTenderness,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        if(bonyTenderness == 'True')Text(
                          bonyTendernessDesc,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Change in pain with movement',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 16),
                        ),
                        Text(
                          changePainWithMov,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        if(changePainWithMov == 'True')Text(
                          changePainWithMovDesc,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Limb shortening or deformity',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 16),
                        ),
                        Text(
                          limbShort,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        if(limbShort == 'True')Text(
                          limbShortDecs,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Blood pressure',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 16),
                        ),
                        Text(
                          bp,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Heart rate',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 16),
                        ),
                        Text(
                          hR,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Blood glucose level',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 16),
                        ),
                        Text(
                          bgl,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Temperature',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 16),
                        ),
                        Text(
                          temperature,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Hit head',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 16),
                        ),
                        Text(
                          hitHead,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Nausea',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 16),
                        ),
                        Text(
                          nausea,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Vomiting',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 16),
                        ),
                        Text(
                          vomit,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Severe headache',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 16),
                        ),
                        Text(
                          sevHeadache,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Cuts or abrasions',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 16),
                        ),
                        Text(
                          cut,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Neck pain',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 16),
                        ),
                        Text(
                          neckPain,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Change of conciousness',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 16),
                        ),
                        Text(
                          changConcious,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Taking anti-coagulents',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 16),
                        ),
                        Text(
                          antiCoag,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Unable to weight bear',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 16),
                        ),
                        Text(
                          weightBear,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),

                        SizedBox(height: 20,),

                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: (Column(
                              children: <Widget>[
                                RaisedButton(child: Text('Submit'), onPressed: (){
                                 Navigator.pushNamed(context, ResultsScreen.id,);


                                },),
                              ],
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
