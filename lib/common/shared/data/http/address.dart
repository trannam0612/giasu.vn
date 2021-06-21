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
  static const String PARENT_INVITED = BASE_URL + "/parent_invited.php";
  static const String PARENT_SAVED = BASE_URL + "/parent_saved.php";
  static const String CLASS_OFFERED = BASE_URL + "/class_offered.php";
  static const String CLASS_SAVED = BASE_URL + "/class_saved.php";
  static const String CLASS_ACCEPTED = BASE_URL + "/class_accepted.php";
  static const String ACCEPT_INVITE_TEACH = BASE_URL + "/accept_parent_invite_teach.php";
  static const String REFUSE_INVITE_TEACH = BASE_URL + "/refuse_invite.php";
  static const String DELETE_CLASS_ACCEPTED = BASE_URL + "/delete_class_accepted.php";
  static const String DELETE_CLASS_OFFERED = BASE_URL + "/delete_class_offered.php";
  static const String SAVE_TEACH = BASE_URL + "/save_teach.php";
  static const String SAVE_CLASS = BASE_URL + "/save_class.php";
  static const String DELETE_CLASS_SAVED = BASE_URL + "/delete_class_saved.php";
  static const String OFFER_TEACH = BASE_URL + "/offer_teach.php";
  static const String SAVE_TUTOR = BASE_URL + "/save_tutor.php";

  static String detailClass(int idClass) {
    return '$BASE_URL/detail_class.php?pft_id=${idClass}';
  }

//AUTHEN
  //register
  static const String verify_register = BASE_URL + "/verify_register.php";
  static const String REGISTER_PARENT = BASE_URL + "/register_parent.php";
  static const String REGISTER_TEACHER = BASE_URL + "/register_tutor.php";
  static const String send_back_otp = BASE_URL + "/send_back_otp.php";

  //forgot
  static const String mail_forgot_password = BASE_URL + "/mail_forgot_password.php";
  static const String verify_password = BASE_URL + "/verify_password.php";
  static const String forgot_password = BASE_URL + "/forgot_password.php";

  //Change
  static const String change_password = BASE_URL + "/change_password.php";

  //all
  static const String list_city_subject = BASE_URL + "/list_city_subject.php";

//POST
  static const String created_class_post = BASE_URL + "/created_class_post.php";
  static const String update_class_post = BASE_URL + "/update_class_post.php";

//User
  static const String update_avatar = BASE_URL + "/update_avatar.php";
  static const String add_avatar = BASE_URL + "/add_avatar.php";
  static const String get_info_parent = BASE_URL + "/info_parent.php";
  static const String update_info_parent = BASE_URL + "/update_info_parent.php";
  static const String get_info_teacher = BASE_URL + "/info_tutor.php";
  static const String update_info_tutor = BASE_URL + "/update_info_tutor.php";

  // static const String detail_city = BASE_URL + "/detail_city.php?ugs_city=1111";
  static String detail_city(int idCity) {
    return '$BASE_URL/detail_city.php?ugs_city=${idCity}';
  }

  static String detail_subject(String asId) {
    return '$BASE_URL/detail_subject.php?as_id=${asId}';
  }

// static const String detail_subject = BASE_URL + "detail_subject.php";
}
