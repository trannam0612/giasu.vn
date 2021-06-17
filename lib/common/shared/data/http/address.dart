class Address {
  static const String DOMAIN = "http://dev3.tinnhanh365.vn";
  static const String BASE_URL = DOMAIN + "/api_app";
  static const String LOGIN_PARENT = BASE_URL + "/login_parent.php";
  static const String LOGIN_TEACHER = BASE_URL + "/login_tutor.php";

  static const String HOME = BASE_URL + "/index.php";
  static const String TUTOR_INVITED = BASE_URL + "/tutor_invited.php";
  static const String TUTOR_OFFERED_TEACH = BASE_URL + "/tutor_offered_teach.php";
  static const String LIST_CLASS_POST = BASE_URL + "/list_class_post.php";
  static const String TUTOR_SAVED = BASE_URL + "/tutor_saved.php";

//AUTHEN
  static const String verify_register = BASE_URL + "/verify_register.php";
  static const String REGISTER_PARENT = BASE_URL + "/register_parent.php";
  static const String REGISTER_TEACHER = BASE_URL + "/register_tutor.php";

  //all
  static const String list_city_subject = BASE_URL + "/list_city_subject.php";

  // static const String detail_city = BASE_URL + "/detail_city.php?ugs_city=1111";
  static String detail_city(int idCity) {
    return '$BASE_URL/detail_city.php?ugs_city=${idCity}';
  }

  static String detail_subject(String asId) {
    return '$BASE_URL/detail_subject.php?as_id=${asId}';
  }

  // static const String detail_subject = BASE_URL + "detail_subject.php";
}
