class login_api {
  int? status;
  String? message;
  int? count;
  List<Response>? response;

  login_api({this.status, this.message, this.count, this.response});

  login_api.fromJson(Map<String, dynamic> json) {
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
  String? userSlug;
  String? name;
  String? mobile;
  String? email;
  String? checkVerified;
  String? isMobileVerified;
  String? isEmailVerified;
  String? isUserVerified;
  String? language;
  String? adminApproved;
  String? adminMessage;
  String? showScreen;

  Response(
      {this.userId,
        this.userSlug,
        this.name,
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
    name = json['name'];
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
    data['name'] = this.name;
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
