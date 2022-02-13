class Validate {
  static RegExp regExp = new RegExp(r'^((0[0-9])|(84[0-9]))\d{8,10}$');
  static RegExp regExpPass = new RegExp(r"(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])\w+");

  static String validateEmail(String value, {bool checkMail = false}) {
    if (value.isEmpty) {
      return 'Bạn vui lòng nhập email';
    } else if (!value.contains('@')) {
      return 'Bạn vui lòng nhập email đúng định dạng!';
    } else if (!value.contains('.')) {
      return 'Bạn vui lòng nhập email đúng định dạng!';
    } else if (checkMail) {
      return 'Email đăng ký đã tồn tại!';
    }
    return null;
  }

  static String validatePassword(String value) {
    if (value.isEmpty) {
      return 'Bạn vui lòng nhập mật khẩu';
    } else if (value.length < 8) {
      return 'Mật khẩu ít nhất 8 ký tự';
    } else if (!regExpPass.hasMatch(value)) {
      return 'Mật khẩu phải bao gồm chữ hoa, chữ thường, ít nhất một số!';
    }
    return null;
  }

  static String validateRePassword(String value, String passOld) {
    if (value.isEmpty) {
      return 'Bạn vui lòng nhập mật khẩu';
    } else if (value.length < 8) {
      return 'Mật khẩu ít nhất 8 ký tự';
    } else if (value != passOld) {
      return 'Mật khẩu không trùng khớp';
    }
    return null;
  }

  static String validatePhone(String value) {
    if (value.isEmpty) {
      return 'Số điện thoại không được để trống!';
    } else if (!regExp.hasMatch(value)) {
      return 'Số điện thoại sai định dạng!';
    }
    return null;
  }

  static String validateIsEmpty(String value) {
    if (value.isEmpty) {
      return 'Vui lòng nhập đầy đủ trường này!';
    }
    return null;
  }

  static String validateSalaryCD(String value) {
    if (value.isEmpty) {
      return 'Vui lòng nhập lương cố định!';
    } else if (int.parse(value) <= 0) {
      return 'Lương cố định phải lớn hơn 0!';
    }
    return null;
  }

  static String validateSalaryUL1(String value, String value2) {
    print('value:$value');
    print('value2:$value2');
    value = value == '' ? '0' : value;
    value2 = value2 == '' ? '0' : value2;
    if (value.isEmpty) {
      return 'Vui lòng nhập lương cố định!';
    } else{
      if (int.parse(value) <= 0) {
        return 'Lương ước lượng\n phải lớn hơn 0!';
      } else if (int.parse(value2) <= 0) {
        return 'Lương ước lượng\n phải lớn hơn 0!';
      } else if (int.parse(value) > int.parse(value2)) {
        return 'Lương bắt đầu phải\n nhỏ hơn lương kết thúc';
      }
    }
    return null;
  }

  static String validateSalaryUL2(String value, String value2) {
    print('value:$value');
    print('value2:$value2');
    value = value == '' ? '0' : value;
    value2 = value2 == '' ? '0' : value2;
    if (value.isEmpty) {
      return 'Vui lòng nhập lương cố định!';
    } else{
      if (int.parse(value) <= 0) {
        return 'Lương ước lượng\n phải lớn hơn 0!';
      } else if (int.parse(value2) <= 0) {
        return 'Lương ước lượng\n phải lớn hơn 0!';
      } else if (int.parse(value) < int.parse(value2)) {
        return 'Lương bắt đầu phải\n nhỏ hơn lương kết thúc';
      }
    }
    return null;

  }
}
