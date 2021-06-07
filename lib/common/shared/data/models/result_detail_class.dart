// To parse this JSON data, do
//
//     final resultDetailClass = resultDetailClassFromJson(jsonString);

import 'dart:convert';

ResultDetailClass resultDetailClassFromJson(String str) => ResultDetailClass.fromJson(json.decode(str));

String resultDetailClassToJson(ResultDetailClass data) => json.encode(data.toJson());

class ResultDetailClass {
  ResultDetailClass({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultDetailClass.fromJson(Map<String, dynamic> json) => ResultDetailClass(
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
    this.className,
    this.userName,
    this.userPhone,
    this.classId,
    this.districtId,
    this.createAt,
    this.nametype,
    this.status,
    this.fee,
    this.price,
    this.citName,
    this.teacherSex,
    this.address,
    this.studentNumber,
    this.studyForWeek,
    this.checkSave,
    this.methodTeach,
    this.subject,
    this.levelClassId,
    this.phoneContact,
    this.studyForDay,
    this.nameTopic,
    this.classDescribe,
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
    this.checkSuggest,
    this.url,
  });

  bool result;
  String message;
  String avatar;
  String className;
  String userName;
  String userPhone;
  String classId;
  String districtId;
  String createAt;
  String nametype;
  String status;
  String fee;
  String price;
  String citName;
  String teacherSex;
  String address;
  String studentNumber;
  String studyForWeek;
  bool checkSave;
  String methodTeach;
  String subject;
  String levelClassId;
  String phoneContact;
  String studyForDay;
  String nameTopic;
  String classDescribe;
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
  bool checkSuggest;
  String url;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    avatar: json["avatar"] == null ? null : json["avatar"],
    className: json["class_name"] == null ? null : json["class_name"],
    userName: json["user_name"] == null ? null : json["user_name"],
    userPhone: json["user_phone"] == null ? null : json["user_phone"],
    classId: json["class_id"] == null ? null : json["class_id"],
    districtId: json["district_id"] == null ? null : json["district_id"],
    createAt: json["create_at"] == null ? null : json["create_at"],
    nametype: json["Nametype"] == null ? null : json["Nametype"],
    status: json["status"] == null ? null : json["status"],
    fee: json["fee"] == null ? null : json["fee"],
    price: json["price"] == null ? null : json["price"],
    citName: json["cit_name"] == null ? null : json["cit_name"],
    teacherSex: json["teacher_sex"] == null ? null : json["teacher_sex"],
    address: json["address"] == null ? null : json["address"],
    studentNumber: json["student_number"] == null ? null : json["student_number"],
    studyForWeek: json["study_for_week"] == null ? null : json["study_for_week"],
    checkSave: json["check_save"] == null ? null : json["check_save"],
    methodTeach: json["method_teach"] == null ? null : json["method_teach"],
    subject: json["subject"] == null ? null : json["subject"],
    levelClassId: json["level_class_id"] == null ? null : json["level_class_id"],
    phoneContact: json["phone_contact"] == null ? null : json["phone_contact"],
    studyForDay: json["study_for_day"] == null ? null : json["study_for_day"],
    nameTopic: json["NameTopic"] == null ? null : json["NameTopic"],
    classDescribe: json["class_describe"] == null ? null : json["class_describe"],
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
    checkSuggest: json["check_suggest"] == null ? null : json["check_suggest"],
    url: json["url"] == null ? null : json["url"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "avatar": avatar == null ? null : avatar,
    "class_name": className == null ? null : className,
    "user_name": userName == null ? null : userName,
    "user_phone": userPhone == null ? null : userPhone,
    "class_id": classId == null ? null : classId,
    "district_id": districtId == null ? null : districtId,
    "create_at": createAt == null ? null : createAt,
    "Nametype": nametype == null ? null : nametype,
    "status": status == null ? null : status,
    "fee": fee == null ? null : fee,
    "price": price == null ? null : price,
    "cit_name": citName == null ? null : citName,
    "teacher_sex": teacherSex == null ? null : teacherSex,
    "address": address == null ? null : address,
    "student_number": studentNumber == null ? null : studentNumber,
    "study_for_week": studyForWeek == null ? null : studyForWeek,
    "check_save": checkSave == null ? null : checkSave,
    "method_teach": methodTeach == null ? null : methodTeach,
    "subject": subject == null ? null : subject,
    "level_class_id": levelClassId == null ? null : levelClassId,
    "phone_contact": phoneContact == null ? null : phoneContact,
    "study_for_day": studyForDay == null ? null : studyForDay,
    "NameTopic": nameTopic == null ? null : nameTopic,
    "class_describe": classDescribe == null ? null : classDescribe,
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
    "check_suggest": checkSuggest == null ? null : checkSuggest,
    "url": url == null ? null : url,
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
