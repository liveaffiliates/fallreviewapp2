import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fallreview/models/fallmodel.dart';

class QuestionScreen extends StatefulWidget {

  static const String id = 'Question_Screen';

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    final fallData = Provider.of<FallData>(context, listen: true);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(child: Text('Hi how are you')),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Align(
            alignment: Alignment.bottomCenter,
            ),
          ),
        ],
      ),
    );
  }
}
