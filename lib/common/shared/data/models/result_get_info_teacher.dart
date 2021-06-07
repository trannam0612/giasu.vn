// To parse this JSON data, do
//
//     final resultGetInforTeacher = resultGetInforTeacherFromJson(jsonString);

import 'dart:convert';

ResultGetInforTeacher resultGetInforTeacherFromJson(String str) => ResultGetInforTeacher.fromJson(json.decode(str));

String resultGetInforTeacherToJson(ResultGetInforTeacher data) => json.encode(data.toJson());

class ResultGetInforTeacher {
  ResultGetInforTeacher({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultGetInforTeacher.fromJson(Map<String, dynamic> json) => ResultGetInforTeacher(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    error: json["error"] == null ? null : Error.fromJson(json["error"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : data.toJson(),
    "error": error == null ? null : error.toJson(),
  };
}

class Data {
  Data({
    this.result,
    this.message,
    this.avatar,
    this.citId,
    this.userPhone,
    this.userName,
    this.userSex,
    this.userEmail,
    this.userBirth,
    this.imgCard,
    this.userAddress,
    this.typeId,
    this.nametype,
    this.teachSchool,
    this.teachWorkPlace,
    this.teachBranch,
    this.teachInfo,
    this.teachExpNumber,
    this.teachGraduate,
    this.teachAchivement,
    this.area,
    this.districtId,
    this.levelClassId,
    this.gsSubjectId,
    this.topicId,
    this.methodTeach,
    this.prices,
    this.priceExpect,
    this.priceTime,
    this.teachDescribe,
    this.mondayMorning,
    this.mondayAfternoon,
    this.mondayEverning,
    this.tuesdayMorning,
    this.tuesdayAfternoon,
    this.tuesdayEverning,
    this.wednesdayMorning,
    this.wednesdayAfternoon,
    this.wednesdayEverning,
    this.thursdayMorning,
    this.thursdayAfternoon,
    this.thursdayEverning,
    this.fridayMorning,
    this.fridayAfternoon,
    this.fridayEverning,
    this.saturdayMorning,
    this.saturdayAfternoon,
    this.saturdayEverning,
    this.sundayMorning,
    this.sundayAfternoon,
    this.sundayEverning,
  });

  bool result;
  String message;
  String avatar;
  String citId;
  String userPhone;
  String userName;
  String userSex;
  String userEmail;
  DateTime userBirth;
  String imgCard;
  String userAddress;
  String typeId;
  String nametype;
  String teachSchool;
  String teachWorkPlace;
  String teachBranch;
  String teachInfo;
  String teachExpNumber;
  String teachGraduate;
  String teachAchivement;
  String area;
  String districtId;
  String levelClassId;
  String gsSubjectId;
  String topicId;
  String methodTeach;
  String prices;
  String priceExpect;
  String priceTime;
  String teachDescribe;
  int mondayMorning;
  int mondayAfternoon;
  int mondayEverning;
  int tuesdayMorning;
  int tuesdayAfternoon;
  int tuesdayEverning;
  int wednesdayMorning;
  int wednesdayAfternoon;
  int wednesdayEverning;
  int thursdayMorning;
  int thursdayAfternoon;
  int thursdayEverning;
  int fridayMorning;
  int fridayAfternoon;
  int fridayEverning;
  int saturdayMorning;
  int saturdayAfternoon;
  int saturdayEverning;
  int sundayMorning;
  int sundayAfternoon;
  int sundayEverning;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    avatar: json["avatar"] == null ? null : json["avatar"],
    citId: json["cit_id"] == null ? null : json["cit_id"],
    userPhone: json["user_phone"] == null ? null : json["user_phone"],
    userName: json["user_name"] == null ? null : json["user_name"],
    userSex: json["user_sex"] == null ? null : json["user_sex"],
    userEmail: json["user_email"] == null ? null : json["user_email"],
    userBirth: json["user_birth"] == null ? null : DateTime.parse(json["user_birth"]),
    imgCard: json["img_card"] == null ? null : json["img_card"],
    userAddress: json["user_address"] == null ? null : json["user_address"],
    typeId: json["type_id"] == null ? null : json["type_id"],
    nametype: json["nametype"] == null ? null : json["nametype"],
    teachSchool: json["teach_school"] == null ? null : json["teach_school"],
    teachWorkPlace: json["teach_work_place"] == null ? null : json["teach_work_place"],
    teachBranch: json["teach_branch"] == null ? null : json["teach_branch"],
    teachInfo: json["teach_info"] == null ? null : json["teach_info"],
    teachExpNumber: json["teach_exp_number"] == null ? null : json["teach_exp_number"],
    teachGraduate: json["teach_graduate"] == null ? null : json["teach_graduate"],
    teachAchivement: json["teach_achivement"] == null ? null : json["teach_achivement"],
    area: json["area"] == null ? null : json["area"],
    districtId: json["district_id"] == null ? null : json["district_id"],
    levelClassId: json["level_class_id"] == null ? null : json["level_class_id"],
    gsSubjectId: json["gs_subject_id"] == null ? null : json["gs_subject_id"],
    topicId: json["topic_id"] == null ? null : json["topic_id"],
    methodTeach: json["method_teach"] == null ? null : json["method_teach"],
    prices: json["prices"] == null ? null : json["prices"],
    priceExpect: json["price_expect"] == null ? null : json["price_expect"],
    priceTime: json["price_time"] == null ? null : json["price_time"],
    teachDescribe: json["teach_describe"] == null ? null : json["teach_describe"],
    mondayMorning: json["monday_morning"] == null ? null : json["monday_morning"],
    mondayAfternoon: json["monday_afternoon"] == null ? null : json["monday_afternoon"],
    mondayEverning: json["monday_everning"] == null ? null : json["monday_everning"],
    tuesdayMorning: json["tuesday_morning"] == null ? null : json["tuesday_morning"],
    tuesdayAfternoon: json["tuesday_afternoon"] == null ? null : json["tuesday_afternoon"],
    tuesdayEverning: json["tuesday_everning"] == null ? null : json["tuesday_everning"],
    wednesdayMorning: json["wednesday_morning"] == null ? null : json["wednesday_morning"],
    wednesdayAfternoon: json["wednesday_afternoon"] == null ? null : json["wednesday_afternoon"],
    wednesdayEverning: json["wednesday_everning"] == null ? null : json["wednesday_everning"],
    thursdayMorning: json["thursday_morning"] == null ? null : json["thursday_morning"],
    thursdayAfternoon: json["thursday_afternoon"] == null ? null : json["thursday_afternoon"],
    thursdayEverning: json["thursday_everning"] == null ? null : json["thursday_everning"],
    fridayMorning: json["friday_morning"] == null ? null : json["friday_morning"],
    fridayAfternoon: json["friday_afternoon"] == null ? null : json["friday_afternoon"],
    fridayEverning: json["friday_everning"] == null ? null : json["friday_everning"],
    saturdayMorning: json["saturday_morning"] == null ? null : json["saturday_morning"],
    saturdayAfternoon: json["saturday_afternoon"] == null ? null : json["saturday_afternoon"],
    saturdayEverning: json["saturday_everning"] == null ? null : json["saturday_everning"],
    sundayMorning: json["sunday_morning"] == null ? null : json["sunday_morning"],
    sundayAfternoon: json["sunday_afternoon"] == null ? null : json["sunday_afternoon"],
    sundayEverning: json["sunday_everning"] == null ? null : json["sunday_everning"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "avatar": avatar == null ? null : avatar,
    "cit_id": citId == null ? null : citId,
    "user_phone": userPhone == null ? null : userPhone,
    "user_name": userName == null ? null : userName,
    "user_sex": userSex == null ? null : userSex,
    "user_email": userEmail == null ? null : userEmail,
    "user_birth": userBirth == null ? null : "${userBirth.year.toString().padLeft(4, '0')}-${userBirth.month.toString().padLeft(2, '0')}-${userBirth.day.toString().padLeft(2, '0')}",
    "img_card": imgCard == null ? null : imgCard,
    "user_address": userAddress == null ? null : userAddress,
    "type_id": typeId == null ? null : typeId,
    "nametype": nametype == null ? null : nametype,
    "teach_school": teachSchool == null ? null : teachSchool,
    "teach_work_place": teachWorkPlace == null ? null : teachWorkPlace,
    "teach_branch": teachBranch == null ? null : teachBranch,
    "teach_info": teachInfo == null ? null : teachInfo,
    "teach_exp_number": teachExpNumber == null ? null : teachExpNumber,
    "teach_graduate": teachGraduate == null ? null : teachGraduate,
    "teach_achivement": teachAchivement == null ? null : teachAchivement,
    "area": area == null ? null : area,
    "district_id": districtId == null ? null : districtId,
    "level_class_id": levelClassId == null ? null : levelClassId,
    "gs_subject_id": gsSubjectId == null ? null : gsSubjectId,
    "topic_id": topicId == null ? null : topicId,
    "method_teach": methodTeach == null ? null : methodTeach,
    "prices": prices == null ? null : prices,
    "price_expect": priceExpect == null ? null : priceExpect,
    "price_time": priceTime == null ? null : priceTime,
    "teach_describe": teachDescribe == null ? null : teachDescribe,
    "monday_morning": mondayMorning == null ? null : mondayMorning,
    "monday_afternoon": mondayAfternoon == null ? null : mondayAfternoon,
    "monday_everning": mondayEverning == null ? null : mondayEverning,
    "tuesday_morning": tuesdayMorning == null ? null : tuesdayMorning,
    "tuesday_afternoon": tuesdayAfternoon == null ? null : tuesdayAfternoon,
    "tuesday_everning": tuesdayEverning == null ? null : tuesdayEverning,
    "wednesday_morning": wednesdayMorning == null ? null : wednesdayMorning,
    "wednesday_afternoon": wednesdayAfternoon == null ? null : wednesdayAfternoon,
    "wednesday_everning": wednesdayEverning == null ? null : wednesdayEverning,
    "thursday_morning": thursdayMorning == null ? null : thursdayMorning,
    "thursday_afternoon": thursdayAfternoon == null ? null : thursdayAfternoon,
    "thursday_everning": thursdayEverning == null ? null : thursdayEverning,
    "friday_morning": fridayMorning == null ? null : fridayMorning,
    "friday_afternoon": fridayAfternoon == null ? null : fridayAfternoon,
    "friday_everning": fridayEverning == null ? null : fridayEverning,
    "saturday_morning": saturdayMorning == null ? null : saturdayMorning,
    "saturday_afternoon": saturdayAfternoon == null ? null : saturdayAfternoon,
    "saturday_everning": saturdayEverning == null ? null : saturdayEverning,
    "sunday_morning": sundayMorning == null ? null : sundayMorning,
    "sunday_afternoon": sundayAfternoon == null ? null : sundayAfternoon,
    "sunday_everning": sundayEverning == null ? null : sundayEverning,
  };
}

class Error {
  Error({
    this.code,
    this.message,
  });

  int code;
  String message;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    code: json["code"] == null ? null : json["code"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "message": message == null ? null : message,
  };
}
