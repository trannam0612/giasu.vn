// To parse this JSON data, do
//
//     final resultDetailGiaSu = resultDetailGiaSuFromJson(jsonString);

import 'dart:convert';

ResultDetailGiaSu resultDetailGiaSuFromJson(String str) => ResultDetailGiaSu.fromJson(json.decode(str));

String resultDetailGiaSuToJson(ResultDetailGiaSu data) => json.encode(data.toJson());

class ResultDetailGiaSu {
  ResultDetailGiaSu({
    this.result,
    this.message,
    this.data,
    this.listCmt,
    this.error,
  });

  bool result;
  String message;
  Data data;
  List<ListCmt> listCmt;
  Error error;

  factory ResultDetailGiaSu.fromJson(Map<String, dynamic> json) => ResultDetailGiaSu(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    listCmt: json["list_cmt"] == null ? null : List<ListCmt>.from(json["list_cmt"].map((x) => ListCmt.fromJson(x))),
    error: json["error"] == null ? null : Error.fromJson(json["error"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "data": data == null ? null : data.toJson(),
    "list_cmt": listCmt == null ? null : List<dynamic>.from(listCmt.map((x) => x.toJson())),
    "error": error == null ? null : error.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.userName,
    this.avatar,
    this.subjectName,
    this.cityName,
    this.teachSchool,
    this.teachBranch,
    this.teachGraduate,
    this.teachWorkPlace,
    this.fee,
    this.methodTeach,
    this.topicName,
    this.nameType,
    this.dateBirth,
    this.sex,
    this.userAddress,
    this.teachInfo,
    this.teachExpNumber,
    this.teachAchivement,
    this.userPhone,
    this.checkSave,
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

  String id;
  String userName;
  String avatar;
  String subjectName;
  String cityName;
  String teachSchool;
  String teachBranch;
  String teachGraduate;
  String teachWorkPlace;
  String fee;
  String methodTeach;
  String topicName;
  String nameType;
  String dateBirth;
  String sex;
  String userAddress;
  String teachInfo;
  String teachExpNumber;
  String teachAchivement;
  String userPhone;
  bool checkSave;
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
    id: json["id"] == null ? null : json["id"],
    userName: json["user_name"] == null ? null : json["user_name"],
    avatar: json["avatar"] == null ? null : json["avatar"],
    subjectName: json["subject_name"] == null ? null : json["subject_name"],
    cityName: json["city_name"] == null ? null : json["city_name"],
    teachSchool: json["teach_school"] == null ? null : json["teach_school"],
    teachBranch: json["teach_branch"] == null ? null : json["teach_branch"],
    teachGraduate: json["teach_graduate"] == null ? null : json["teach_graduate"],
    teachWorkPlace: json["teach_work_place"] == null ? null : json["teach_work_place"],
    fee: json["fee"] == null ? null : json["fee"],
    methodTeach: json["method_teach"] == null ? null : json["method_teach"],
    topicName: json["topic_name"] == null ? null : json["topic_name"],
    nameType: json["NameType"] == null ? null : json["NameType"],
    dateBirth: json["date_birth"] == null ? null : json["date_birth"],
    sex: json["sex"] == null ? null : json["sex"],
    userAddress: json["user_address"] == null ? null : json["user_address"],
    teachInfo: json["teach_info"] == null ? null : json["teach_info"],
    teachExpNumber: json["teach_exp_number"] == null ? null : json["teach_exp_number"],
    teachAchivement: json["teach_achivement"] == null ? null : json["teach_achivement"],
    userPhone: json["user_phone"] == null ? null : json["user_phone"],
    checkSave: json["check_save"] == null ? null : json["check_save"],
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
    "id": id == null ? null : id,
    "user_name": userName == null ? null : userName,
    "avatar": avatar == null ? null : avatar,
    "subject_name": subjectName == null ? null : subjectName,
    "city_name": cityName == null ? null : cityName,
    "teach_school": teachSchool == null ? null : teachSchool,
    "teach_branch": teachBranch == null ? null : teachBranch,
    "teach_graduate": teachGraduate == null ? null : teachGraduate,
    "teach_work_place": teachWorkPlace == null ? null : teachWorkPlace,
    "fee": fee == null ? null : fee,
    "method_teach": methodTeach == null ? null : methodTeach,
    "topic_name": topicName == null ? null : topicName,
    "NameType": nameType == null ? null : nameType,
    "date_birth": dateBirth == null ? null : dateBirth,
    "sex": sex == null ? null : sex,
    "user_address": userAddress == null ? null : userAddress,
    "teach_info": teachInfo == null ? null : teachInfo,
    "teach_exp_number": teachExpNumber == null ? null : teachExpNumber,
    "teach_achivement": teachAchivement == null ? null : teachAchivement,
    "user_phone": userPhone == null ? null : userPhone,
    "check_save": checkSave == null ? null : checkSave,
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

class ListCmt {
  ListCmt({
    this.parentName,
    this.avatarParent,
    this.timeComment,
    this.commentContent,
    this.rate,
  });

  String parentName;
  String avatarParent;
  DateTime timeComment;
  String commentContent;
  int rate;

  factory ListCmt.fromJson(Map<String, dynamic> json) => ListCmt(
    parentName: json["parent_name"] == null ? null : json["parent_name"],
    avatarParent: json["avatar_parent"] == null ? null : json["avatar_parent"],
    timeComment: json["time_comment"] == null ? null : DateTime.parse(json["time_comment"]),
    commentContent: json["comment_content"] == null ? null : json["comment_content"],
    rate: json["rate"] == null ? null : json["rate"],
  );

  Map<String, dynamic> toJson() => {
    "parent_name": parentName == null ? null : parentName,
    "avatar_parent": avatarParent == null ? null : avatarParent,
    "time_comment": timeComment == null ? null : timeComment.toIso8601String(),
    "comment_content": commentContent == null ? null : commentContent,
    "rate": rate == null ? null : rate,
  };
}
