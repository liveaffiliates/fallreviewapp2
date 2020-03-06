import 'package:flutter/material.dart';
import 'dart:convert';




FallData isolationDataFromJson(String str) => FallData.fromJson(json.decode(str));

String isolationDataToJson(FallData data) => json.encode(data.toJson());

class FallData with ChangeNotifier{

  int id;

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
  bool witnessed;
  String otherInformation;
  int oxygenSaturation;




  FallData({
    this.id,

    this.fallId,
    this.name,
    this.fallTime,
    this.unconciousNotBreathingBleeding,
    this.hitHead,
    this.pain,
    this.painDesc,
    this.changePainWithMov,
    this.changePainWithMovDesc,
    this.bonyTenderness,
    this.bonyTendernessDesc,
    this.limbShort,
    this.limbShortDecs,
    this.nausea,
    this.vomit,
    this.sevHeadache,
    this.cut,
    this.neckPain,
    this.changConcious,
    this.antiCoag,
    this.weightBear,
    this.bpDia,
    this.bpSis,
    this.hR,
    this.temperature,
    this.bgl,
    this.possibleInjury,
    this.suspectedFracture,
    this.pupilLeft,
    this.pupilRight,
    this.pupilDesc,
    this.respRate,
    this.fallWitnessed,
    this.fallDesc,
    this.timeOnGround,
    this.witnessed,
    this.otherInformation,
    this.oxygenSaturation,


  });


  factory FallData.fromJson(Map<String, dynamic> json) => FallData(

    id: json["id"] == null ? null : json["id"],
    fallId: json["fallId"] == null ? null : json["fallId"],
    name: json["name"] == null ? null : json["name"],
    fallTime: json["fallTime"] == null ? null : json["fallTime"],
    unconciousNotBreathingBleeding: json["unconciousNotBreathingBleeding"] == null ? null : json["unconciousNotBreathingBleeding"],
    hitHead: json["hitHead"] == null ? null : json["hitHead"],
    pain: json["pain"] == null ? null : json["pain"],
    painDesc: json["painDesc"] == null ? null : json["painDesc"],
    changePainWithMov: json["changePainWithMov"] == null ? null : json["changePainWithMov"],
    changePainWithMovDesc: json["changePainWithMovDesc"] == null ? null : json["changePainWithMovDesc"],
    bonyTenderness: json["bonyTenderness"] == null ? null : json["bonyTenderness"],
    bonyTendernessDesc: json["bonyTendernessDesc"] == null ? null : json["bonyTendernessDesc"],
    limbShort: json["limbShort"] == null ? null : json["limbShort"],
    limbShortDecs: json["limbShortDecs"] == null ? null : json["limbShortDecs"],
    nausea: json["nausea"] == null ? null : json["nausea"],
    vomit: json["vomit"] == null ? null : json["vomit"],
    sevHeadache: json["sevHeadache"] == null ? null : json["sevHeadache"],
    cut: json["cut"] == null ? null : json["cut"],
    neckPain: json["neckPain"] == null ? null : json["neckPain"],
    changConcious: json["changConcious"] == null ? null : json["changConcious"],
    antiCoag: json["antiCoag"] == null ? null : json["antiCoag"],
    weightBear: json["weightBear"] == null ? null : json["weightBear"],
    bpDia: json["bpDia"] == null ? null : json["bpDia"],
    bpSis: json["bpSis"] == null ? null : json["bpSis"],
    hR: json["hR"] == null ? null : json["hR"],
    temperature: json["temperature"] == null ? null : json["temperature"],
    bgl: json["bgl"] == null ? null : json["bgl"],
    possibleInjury: json["possibleInjury"] == null ? null : json["possibleInjury"],
    suspectedFracture: json["suspectedFracture"] == null ? null : json["suspectedFracture"],
    pupilLeft: json["pupilLeft"] == null ? null : json["pupilLeft"],
    pupilRight: json["pupilRight"] == null ? null : json["pupilRight"],
    pupilDesc: json["pupilDesc"] == null ? null : json["pupilDesc"],
    respRate: json["respRate"] == null ? null : json["respRate"],
    fallWitnessed: json["fallWitnessed"] == null ? null : json["fallWitnessed"],
    fallDesc: json["fallDesc"] == null ? null : json["fallDesc"],
    timeOnGround: json["timeOnGround"] == null ? null : json["timeOnGround"],
    witnessed: json["witnessed"] == null ? null : json["witnessed"],
    otherInformation: json["otherInformation"] == null ? null : json["otherInformation"],
    oxygenSaturation: json["oxygenSaturation"] == null ? null : json["oxygenSaturation"],


  );



  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "fallId": fallId == null ? null : fallId,
    "name": name == null ? null : name,
    "fallTime": fallTime == null ? null : fallTime,
    "unconciousNotBreathingBleeding": unconciousNotBreathingBleeding == null ? null : unconciousNotBreathingBleeding,
    "hitHead": hitHead == null ? null : hitHead,
    "pain": pain == null ? null : pain,
    "painDesc": painDesc == null ? null : painDesc,
    "changePainWithMov": changePainWithMov == null ? null : changePainWithMov,
    "changePainWithMovDesc": changePainWithMovDesc == null ? null : changePainWithMovDesc,
    "bonyTenderness": bonyTenderness == null ? null : bonyTenderness,
    "bonyTendernessDesc": bonyTendernessDesc == null ? null : bonyTendernessDesc,
    "limbShort": limbShort == null ? null : limbShort,
    "limbShortDecs": limbShortDecs == null ? null : limbShortDecs,
    "nausea": nausea == null ? null : nausea,
    "vomit": vomit == null ? null : vomit,
    "sevHeadache": sevHeadache == null ? null : sevHeadache,
    "cut": cut == null ? null : cut,
    "neckPain": neckPain == null ? null : neckPain,
    "changConcious": changConcious == null ? null : changConcious,
    "antiCoag": antiCoag == null ? null : antiCoag,
    "weightBear": weightBear == null ? null : weightBear,
    "bpDia": bpDia == null ? null : bpDia,
    "bpSis": bpSis == null ? null : bpSis,
    "hR": hR == null ? null : hR,
    "temperature": temperature == null ? null : temperature,
    "bgl": bgl == null ? null : bgl,
    "possibleInjury": possibleInjury == null ? null : possibleInjury,
    "suspectedFracture": suspectedFracture == null ? null : suspectedFracture,
    "pupilLeft": pupilLeft == null ? null : pupilLeft,
    "pupilRight": pupilRight == null ? null : pupilRight,
    "pupilDesc": pupilDesc == null ? null : pupilDesc,
    "respRate": respRate == null ? null : respRate,
    "fallWitnessed": fallWitnessed == null ? null : fallWitnessed,
    "fallDesc": fallDesc == null ? null : fallDesc,
    "timeOnGround": timeOnGround == null ? null : timeOnGround,
    "witnessed": witnessed == null ? null : witnessed,
    "otherInformation": otherInformation == null ? null : otherInformation,
    "oxygenSaturation": oxygenSaturation == null ? null : oxygenSaturation,

  };

  void setLocalDBID(int value) {
    id = value;
    notifyListeners();
  }

  int get getLocalDBID => id;




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

  void setChangeInPaiWitMovDesc(String string) {
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


  void setOtherInfo(String string) {
    otherInformation = string;
    notifyListeners();
  }

  String get getOtherInfo => otherInformation;


  void setOxygenSat(int value) {
    oxygenSaturation = value;
    notifyListeners();
  }

  int get getOxygenSat => oxygenSaturation;

  void setCompleteFallInformation(FallData fallData) {

    fallId = fallData.getFallID;
    name = fallData.getName;
    fallTime = fallData.getFallTime;
    unconciousNotBreathingBleeding = fallData.getUnconciousNotBreathingBleeding;
    hitHead = fallData.getHitHead;
    pain = fallData.getPain;
    painDesc = fallData.getPainDesc;
    changePainWithMov = fallData.getChangePainWithMovement;
    changePainWithMovDesc = fallData.getChangePainWithMovDesc;
    bonyTenderness = fallData.getBonyTenderness;
    bonyTendernessDesc = fallData.getBonyTendernessDesc;
    limbShort = fallData.limbShort;
    limbShortDecs = fallData.limbShortDecs;
    nausea = fallData.getNausea;
    vomit = fallData.getVomit;
    sevHeadache = fallData.getSevHeadache;
    cut = fallData.getCut;
    neckPain = fallData.getNeckPain;
    changConcious = fallData.getChangeConious;
    antiCoag = fallData.getAntiCoag;
    weightBear = fallData.getWeightBear;
    bpDia = fallData.getBPDia;
    bpSis = fallData.getBPSis;
    hR = fallData.getHr;
    temperature = fallData.getTemperature;
    bgl = fallData.getBGL;
    possibleInjury = fallData.getPossibleInjury;
    suspectedFracture = fallData.getSuspectedFracture;
    pupilLeft = fallData.getPupilL;
    pupilRight = fallData.getPupilR;
    pupilDesc = fallData.getPupilDesc;
    respRate = fallData.getRespRate;
    fallWitnessed = fallData.getFallWitnessed;
    fallDesc = fallData.getFallDesc;
    timeOnGround = fallData.getTimeOnGround;
    witnessed = fallData.getFallWitnessed;
    otherInformation = fallData.getOtherInfo;
    oxygenSaturation = fallData.getOxygenSat;
    id = fallData.getLocalDBID;


    notifyListeners();
  }





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
    witnessed = null;
    otherInformation = null;
    oxygenSaturation = null;
    id = null;

    notifyListeners();
  }


}