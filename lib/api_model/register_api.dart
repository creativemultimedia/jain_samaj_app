class register_model {
  int? status;
  String? message;
  int? count;
  List<Response>? response;

  register_model({this.status, this.message, this.count, this.response});

  register_model.fromJson(Map<String, dynamic> json) {
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
  String? userId;
  String? checkVerified;
  String? isMobileVerified;
  String? isEmailVerified;
  String? isUserVerified;
  String? alreadyExists;
  String? adminApproved;
  String? userUniqSession;
  String? language;
  String? showScreen;

  Response(
      {this.userId,
        this.checkVerified,
        this.isMobileVerified,
        this.isEmailVerified,
        this.isUserVerified,
        this.alreadyExists,
        this.adminApproved,
        this.userUniqSession,
        this.language,
        this.showScreen});

  Response.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    checkVerified = json['check_verified'];
    isMobileVerified = json['is_mobile_verified'];
    isEmailVerified = json['is_email_verified'];
    isUserVerified = json['is_user_verified'];
    alreadyExists = json['already_exists'];
    adminApproved = json['admin_approved'];
    userUniqSession = json['userUniqSession'];
    language = json['language'];
    showScreen = json['show_screen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['check_verified'] = this.checkVerified;
    data['is_mobile_verified'] = this.isMobileVerified;
    data['is_email_verified'] = this.isEmailVerified;
    data['is_user_verified'] = this.isUserVerified;
    data['already_exists'] = this.alreadyExists;
    data['admin_approved'] = this.adminApproved;
    data['userUniqSession'] = this.userUniqSession;
    data['language'] = this.language;
    data['show_screen'] = this.showScreen;
    return data;
  }
}
