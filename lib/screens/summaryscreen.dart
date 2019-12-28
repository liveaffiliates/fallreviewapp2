import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SummaryScreen extends StatefulWidget {

  final String fallID;
  SummaryScreen(this.fallID);

  static const String id = 'Summary_Screen';

  @override
  _SummaryScreenState createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<Object>(
          stream: Firestore.instance.collection('falls').document(widget.fallID).snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {

            if (snapshot.connectionState == ConnectionState.active && snapshot.hasData) {

              String name = snapshot.data['name'].toString() ?? 'Not Completed';
              String fallTime = snapshot.data['fallTime'].toString() ?? 'Not Completed';
              String unconcious = snapshot.data['unconcious'].toString() ?? 'Not Completed';
              String breathing = snapshot.data['breathing'].toString() ?? 'Not Completed';
              String bleeding = snapshot.data['bleeding'].toString() ?? 'Not Completed';
              String painLevel = snapshot.data['painLevel'].toString() ?? 'Not Completed';
              String changeLimbMov = snapshot.data['changeLimbMov'].toString() ?? 'Not Completed';
              String changeLimbMovDesc = snapshot.data['changeLimbMovDesc'].toString() ?? 'Not Completed';
              String bonyTenderness = snapshot.data['bonyTenderness'].toString() ?? 'Not Completed';
              String bonyTendernessDesc = snapshot.data['bonyTendernessDesc'].toString() ?? 'Not Completed';
              String limbShort = snapshot.data['limbShort'].toString() ?? 'Not Completed';
              String limbShortDecs = snapshot.data['limbShortDecs'].toString() ?? 'Not Completed';
              String nausea = snapshot.data['nausea'].toString() ?? 'Not Completed';
              String vomit = snapshot.data['vomit'].toString() ?? 'Not Completed';
              String sevHeadache = snapshot.data['sevHeadache'].toString() ?? 'Not Completed';
              String deepCut = snapshot.data['deepCut'].toString() ?? 'Not Completed';
              String neckPain  = snapshot.data['neckPain'].toString() ?? 'Not Completed';
              String changConcious = snapshot.data['changConcious'].toString() ?? 'Not Completed';
              String antiCoag  = snapshot.data['name'].toString() ?? 'Not Completed';
              String weightBear = snapshot.data['antiCoag'].toString() ?? 'Not Completed';
              String bpH = snapshot.data['bpH'].toString() ?? 'Not Completed';
              String bpL = snapshot.data['bpL'].toString() ?? 'Not Completed';
              String hR = snapshot.data['hR'].toString() ?? 'Not Completed';
              String pupils = snapshot.data['pupils'].toString() ?? 'Not Completed';
              String bgl = snapshot.data['bgl'].toString() ?? 'Not Completed';

              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left:16.0),
                  child: Column(
                    children: <Widget>[
                      Text('Name', textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                      //SizedBox(height:10),
                      Text(name, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),),
                    ],
                  ),
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
        }
      ),
    );
  }
}
