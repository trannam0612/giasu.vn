class Address {
  static const String DOMAIN = "http://dev3.tinnhanh365.vn";
  static const String BASE_URL = DOMAIN + "/api_app";
  static const String check_token = BASE_URL + "/check_token.php";
  static const String check_mail_gs = BASE_URL + "/check_mail_register_gs.php";
  static const String check_mail_ph = BASE_URL + "/check_mail_register_ph.php";
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
  static const String REFUSE_OFFER = BASE_URL + "/refuse_offer.php";
  static const String ACCEPT_OFFER = BASE_URL + "/accept_offer.php";
  static const String TUTOR_DELETE_OFFER = BASE_URL + "/tutor_delete_offer.php";
  static const String DELETE_TUTOR_SAVED = BASE_URL + "/delete_tutor_saved.php";
  static const String INVITE_TEACH = BASE_URL + "/invite_teach.php";
  static const String TUTOR_FROM_FILTER_POINT = BASE_URL + "/tutor_from_filter_point.php";
  static const String TUTOR_TEACHING = BASE_URL + "/tutor_is_teaching.php";
  static const String DELETE_PARENT_SAVED = BASE_URL + "/delete_parent_saved.php";
  static const String DELETE_TUTOR_POINT_FREE = BASE_URL + "/delete_tutor_point_free.php";
  static const String MINUS_POINT = BASE_URL + "/update_point_free_buy.php";

  static String detailClass(String token, int idClass) {
    return '$BASE_URL/detail_class.php?token=${token}&pft_id=${idClass}';
  }

  static String detailTutor(String token, int idGS) {
    return '$BASE_URL/detail_tutor.php?token=${token}&id_gs=${idGS}';
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
  static const String change_status_class_post = BASE_URL + "/change_status_class.php";

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

  // static String searchParent(int idCity, int idDistrict, int idSubject, int idForm, int currentPage, int limit) {
  //   return '$BASE_URL/search_by_filter_tutor.php?=${idCity}&country=${idDistrict}&subject=${idSubject}&form=${idForm}&current_page=${currentPage}&limit=${limit}';
  // }
  //
  // static String searchTeacher(int idCity, int idDistrict, int idSubject, int idForm, int currentPage, int limit) {
  //   return '$BASE_URL/search_by_filter_class.php?=${idCity}&country=${idDistrict}&subject=${idSubject}&form=${idForm}&current_page=${currentPage}&limit=${limit}';
  // }

//Noti
  static const String notification = BASE_URL + "/notification.php";
  static const String delete_notification = BASE_URL + "/delete_notification.php";

//Search
  static const String search_list_teacher = BASE_URL + "/list_tutor.php";
  static const String search_list_class = BASE_URL + "/list_class.php";

// static const String detail_subject = BASE_URL + "detail_subject.php";
}
