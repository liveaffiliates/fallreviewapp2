import 'package:flutter/material.dart';
import 'package:fallreview/screens/allscreens.dart';

class ReferAcdScreen extends StatefulWidget {

  static const String id = 'refer_acd_screen';

  @override
  _ReferAcdScreenState createState() => _ReferAcdScreenState();
}

class _ReferAcdScreenState extends State<ReferAcdScreen> {
  @override
  Widget build(BuildContext context) {

    var padding = MediaQuery.of(context).padding.top;
    var totalHeight = MediaQuery.of(context).size.height;
    var adjustedHeight = totalHeight - padding - kToolbarHeight;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red, elevation: 0,),
      body: SafeArea(
        child: Container(
          color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              (Column(children: <Widget>[
                SizedBox(height: 20,),
                Text('Caution!', style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.white),),

                SizedBox(height: 150,),
                Text('Refer to ACD', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),),
                Text('Seek urgent medical attention if indicated', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),


              ],)),

              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: (Column(
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.white,
                        child: Text('Next', style: TextStyle(color: Colors.red),), onPressed: (){
                        Navigator.pushNamed(
                          context,
                          PersonsNameScreen.id,
                        );
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
  }
}
