import 'package:flutter/material.dart';


class FallData with ChangeNotifier{
  FallData();

  String fallId;
  String name;
  int fallTime;
  bool unconciousNotBreathingBleeding;
  bool hitHead;
  bool pain;
  String painDesc;
  bool changePainWithMov;
  String changePainWithMovDesc;
  bool bonyTenderness;
  String bonyTendernessDesc;
  bool limbShort;
  String limbShortDecs;
  bool nausea ;
  bool vomit ;
  bool sevHeadache ;
  bool cut ;
  bool neckPain ;
  bool changConcious ;
  bool antiCoag ;
  bool weightBear ;
  int bpDia;
  int bpSis;
  int hR;
  double temperature;
  double bgl;
  bool possibleInjury;
  bool suspectedFracture;
  int pupilLeft;
  int pupilRight;
  String pupilDesc;
  int respRate;
  bool fallWitnessed;
  String fallDesc;
  int timeOnGround;


  void setFallID(String text) {
    fallId = text;
    notifyListeners();
  }

  String get getFallID => fallId;


  void setName(String text) {
    name = text;
    notifyListeners();
  }

  String get getName => name;

  void setFallTime(int time) {
    fallTime = time;
    notifyListeners();
  }

  int get getFallTime => fallTime;

  void setUnconciousNotBreathingBleeding(bool value) {
    unconciousNotBreathingBleeding = value;
    notifyListeners();
  }

  bool get getUnconciousNotBreathingBleeding => unconciousNotBreathingBleeding;

  void setHitHead(bool value) {
    hitHead = value;
    notifyListeners();
  }

  bool get getHitHead => hitHead;

  void setPain(bool value) {
    pain = value;
    notifyListeners();
  }

  bool get getPain => pain;

  void setPainDesc(String text) {
    painDesc = text;
    notifyListeners();
  }

  String get getPainDesc => painDesc;

  void setchangePainWithMovement(bool value) {
    changePainWithMov = value;
    notifyListeners();
  }

  bool get getChangePainWithMovement => changePainWithMov;

  void setChangeLimbMovementDesc(String string) {
    changePainWithMovDesc = string;
    notifyListeners();
  }

  String get getChangePainWithMovDesc => changePainWithMovDesc;

  void setBonyTenderness(bool value) {
    bonyTenderness = value;
    notifyListeners();
  }

  bool get getBonyTenderness => bonyTenderness;

  void setBonyTendernessDesc(String string) {
    bonyTendernessDesc = string;
    notifyListeners();
  }

  String get getBonyTendernessDesc => bonyTendernessDesc;

  void setLimbShort(bool value) {
    limbShort = value;
    notifyListeners();
  }

  bool get getLimbShort => limbShort;

  void setLimbShortDesc(String string) {
    limbShortDecs = string;
    notifyListeners();
  }

  String get getLimbShortDesc => limbShortDecs;

  void setNausea(bool value) {
    nausea = value;
    notifyListeners();
  }

  bool get getNausea => nausea;

  void setVomit(bool value) {
    vomit = value;
    notifyListeners();
  }

  bool get getVomit => vomit;

  void setSevHeadache(bool value) {
    sevHeadache = value;
    notifyListeners();
  }

  bool get getSevHeadache => sevHeadache;

  void setCut(bool value) {
    cut = value;
    notifyListeners();
  }

  bool get getCut => cut;

  void setNeckPain(bool value) {
    neckPain = value;
    notifyListeners();
  }

  bool get getNeckPain => neckPain;

  void setChangeConcious(bool value) {
    changConcious = value;
    notifyListeners();
  }

  bool get getChangeConious => changConcious;

  void setAntiCoag(bool value) {
    antiCoag = value;
    notifyListeners();
  }

  bool get getAntiCoag => antiCoag;

  void setWeightBear(bool value) {
    weightBear = value;
    notifyListeners();
  }

  bool get getWeightBear => weightBear;


  void setBPDia(int value) {
    bpDia = value;
    notifyListeners();
  }

  int get getBPDia => bpDia;

  void setBPSis(int value) {
    bpSis = value;
    notifyListeners();
  }

  int get getBPSis => bpSis;


  void setHr(int value) {
    hR = value;
    notifyListeners();
  }

  int get getHr => hR;

  void setTemperature(double value) {
    temperature = value;
    notifyListeners();
  }

  double get getTemperature => temperature;

  void setBGL(double value) {
    bgl = value;
    notifyListeners();
  }

  double get getBGL => bgl;

  void setPossibleInjury(bool value) {
    possibleInjury = value;
    notifyListeners();
  }

  bool get getPossibleInjury => possibleInjury;

  void setSuspectedFracture(bool value) {
    suspectedFracture = value;
    notifyListeners();
  }

  bool get getSuspectedFracture => suspectedFracture;

  void setPupilL(int pupilL) {
    pupilLeft = pupilL;
    notifyListeners();
  }

  int get getPupilL => pupilLeft;

  void setPupilR(int pupilR) {
    pupilRight = pupilR;
    notifyListeners();
  }

  int get getPupilR => pupilRight;

  void setLPupilDesc(String string) {
    pupilDesc = string;
    notifyListeners();
  }

  String get getPupilDesc => pupilDesc;

  void setRespRate(int value) {
    respRate = value;
    notifyListeners();
  }

  int get getRespRate => respRate;

  void setFallWitnessed(bool value) {
    fallWitnessed = value;
    notifyListeners();
  }

  bool get getFallWitnessed => fallWitnessed;


  void setFallDesc(String string) {
    fallDesc = string;
    notifyListeners();
  }

  String get getFallDesc => fallDesc;

  void setTimeOnGround(int value) {
    timeOnGround = value;
    notifyListeners();
  }

  int get getTimeOnGround => timeOnGround;





  void clearFallModel(){

    fallId = null;
    name = null;
    fallTime = null;
    unconciousNotBreathingBleeding = null;
    hitHead = null;
    pain = null;
    painDesc = null;
    changePainWithMov = null;
    changePainWithMovDesc = null;
    bonyTenderness = null;
    bonyTendernessDesc = null;
    limbShort = null;
    limbShortDecs = null;
    nausea = null;
    vomit = null;
    sevHeadache = null;
    cut = null;
    neckPain = null;
    changConcious = null;
    antiCoag = null;
    weightBear = null;
    bpDia = null;
    bpSis = null;
    hR = null;
    temperature = null;
    bgl = null;
    possibleInjury = null;
    suspectedFracture = null;
    pupilLeft = null;
    pupilRight = null;
    pupilDesc = null;
    respRate = null;
    fallWitnessed = null;
    fallDesc = null;
    timeOnGround = null;

    notifyListeners();
  }


}