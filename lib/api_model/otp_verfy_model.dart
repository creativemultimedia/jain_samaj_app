class otp_verify_model {
  dynamic status;
  dynamic message;
  dynamic count;
  List<Response>? response;

  otp_verify_model({this.status, this.message, this.count, this.response});

  otp_verify_model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    count = json['count'];
    if (json['response'] != null) {
      response = <Response>[];
      json['response'].forEach((v) {
        response!.add(new Response.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['count'] = this.count;
    if (this.response != null) {
      data['response'] = this.response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Response {
  dynamic userId;
  dynamic userSlug;
  dynamic mobile;
  dynamic email;
  dynamic checkVerified;
  dynamic isMobileVerified;
  dynamic isEmailVerified;
  dynamic isUserVerified;
  dynamic language;
  dynamic adminApproved;
  dynamic adminMessage;
  dynamic showScreen;

  Response(
      {this.userId,
        this.userSlug,
        this.mobile,
        this.email,
        this.checkVerified,
        this.isMobileVerified,
        this.isEmailVerified,
        this.isUserVerified,
        this.language,
        this.adminApproved,
        this.adminMessage,
        this.showScreen});

  Response.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userSlug = json['user_slug'];
    mobile = json['mobile'];
    email = json['email'];
    checkVerified = json['check_verified'];
    isMobileVerified = json['is_mobile_verified'];
    isEmailVerified = json['is_email_verified'];
    isUserVerified = json['is_user_verified'];
    language = json['language'];
    adminApproved = json['admin_approved'];
    adminMessage = json['admin_message'];
    showScreen = json['show_screen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_slug'] = this.userSlug;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['check_verified'] = this.checkVerified;
    data['is_mobile_verified'] = this.isMobileVerified;
    data['is_email_verified'] = this.isEmailVerified;
    data['is_user_verified'] = this.isUserVerified;
    data['language'] = this.language;
    data['admin_approved'] = this.adminApproved;
    data['admin_message'] = this.adminMessage;
    data['show_screen'] = this.showScreen;
    return data;
  }
}
