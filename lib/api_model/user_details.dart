class user_details_model {
  int? status;
  String? message;
  int? count;
  List<Response>? response;

  user_details_model({this.status, this.message, this.count, this.response});

  user_details_model.fromJson(Map<String, dynamic> json) {
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
  String? memberId;
  String? userSlug;
  String? name;
  String? mobile;
  String? email;
  String? passwordUpDate;
  String? passwordUpMsg;
  String? address;
  String? country;
  String? state;
  String? city;
  String? pincode;
  String? profilePic;
  String? dob;
  String? gender;
  String? latitudes;
  String? longitude;
  String? refCode;
  String? registerType;
  String? checkVerified;
  String? isMobileVerified;
  String? isEmailVerified;
  String? isUserVerified;
  String? language;
  String? adminApproved;
  String? adminMessage;

  Response(
      {this.userId,
        this.memberId,
        this.userSlug,
        this.name,
        this.mobile,
        this.email,
        this.passwordUpDate,
        this.passwordUpMsg,
        this.address,
        this.country,
        this.state,
        this.city,
        this.pincode,
        this.profilePic,
        this.dob,
        this.gender,
        this.latitudes,
        this.longitude,
        this.refCode,
        this.registerType,
        this.checkVerified,
        this.isMobileVerified,
        this.isEmailVerified,
        this.isUserVerified,
        this.language,
        this.adminApproved,
        this.adminMessage});

  Response.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    memberId = json['member_id'];
    userSlug = json['user_slug'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    passwordUpDate = json['password_up_date'];
    passwordUpMsg = json['password_up_msg'];
    address = json['address'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    pincode = json['pincode'];
    profilePic = json['profile_pic'];
    dob = json['dob'];
    gender = json['gender'];
    latitudes = json['latitudes'];
    longitude = json['longitude'];
    refCode = json['ref_code'];
    registerType = json['register_type'];
    checkVerified = json['check_verified'];
    isMobileVerified = json['is_mobile_verified'];
    isEmailVerified = json['is_email_verified'];
    isUserVerified = json['is_user_verified'];
    language = json['language'];
    adminApproved = json['admin_approved'];
    adminMessage = json['admin_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['member_id'] = this.memberId;
    data['user_slug'] = this.userSlug;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['password_up_date'] = this.passwordUpDate;
    data['password_up_msg'] = this.passwordUpMsg;
    data['address'] = this.address;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['pincode'] = this.pincode;
    data['profile_pic'] = this.profilePic;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['latitudes'] = this.latitudes;
    data['longitude'] = this.longitude;
    data['ref_code'] = this.refCode;
    data['register_type'] = this.registerType;
    data['check_verified'] = this.checkVerified;
    data['is_mobile_verified'] = this.isMobileVerified;
    data['is_email_verified'] = this.isEmailVerified;
    data['is_user_verified'] = this.isUserVerified;
    data['language'] = this.language;
    data['admin_approved'] = this.adminApproved;
    data['admin_message'] = this.adminMessage;
    return data;
  }
}
