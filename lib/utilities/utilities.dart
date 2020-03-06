import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

String epochIntToDateString({@required epochInt}){

  var date = new DateTime.fromMillisecondsSinceEpoch(epochInt);
  final f = new DateFormat('dd/MM/yyyy HH:mm');

  return f.format(date);

}