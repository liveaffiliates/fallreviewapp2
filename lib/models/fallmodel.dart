import 'package:flutter/material.dart';


class FallData with ChangeNotifier{
  FallData();

  String fallId;
  String name;
  int fallTime;
  bool unconcious;
  bool breathing;
  bool bleeding;
  String painLevel;
  bool changeLimbMov;
  String changeLimbMovDesc;
  bool bonyTenderness;
  String bonyTendernessDesc;
  bool limbShort;
  String limbShortDecs;
  bool nausea ;
  bool vomit ;
  bool sevHeadache ;
  bool deepCut ;
  bool neckPain ;
  bool changConcious ;
  bool antiCoag ;
  bool weightBear ;
  int bpH;
  int bpL;
  int hR;
  int pupils;
  double bgl;



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

  void setUnconcious(bool value) {
    unconcious = value;
    notifyListeners();
  }

  bool get getUnconcious => unconcious;

  void setBreathing(bool value) {
    breathing = value;
    notifyListeners();
  }

  bool get getBreathing => breathing;

  void setBleeding(bool value) {
    bleeding = value;
    notifyListeners();
  }

  bool get getBleeding => bleeding;

  void setPainLevel(String text) {
    painLevel = text;
    notifyListeners();
  }

  String get getPainLevel => painLevel;

  void setChangeLimbMovement(bool value) {
    changeLimbMov = value;
    notifyListeners();
  }

  bool get getChangeLimbMov => changeLimbMov;

  void setChangeLimbMovementDesc(String string) {
    changeLimbMovDesc = string;
    notifyListeners();
  }

  String get getChangeLimbMovDesc => changeLimbMovDesc;

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

  void setDeepCut(bool value) {
    deepCut = value;
    notifyListeners();
  }

  bool get getDeepCut => deepCut;




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


  void setBPH(int value) {
    bpH = value;
    notifyListeners();
  }

  int get getBPH => bpH;

  void setBPL(int value) {
    bpL = value;
    notifyListeners();
  }

  int get getBPL => bpL;


  void setHr(int value) {
    hR = value;
    notifyListeners();
  }

  int get getHr => hR;

  void setPupils(int value) {
    pupils = value;
    notifyListeners();
  }

  int get getPupils => pupils;

  void setBGL(double value) {
    bgl = value;
    notifyListeners();
  }

  double get getBGL => bgl;


}