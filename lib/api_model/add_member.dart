class yatra_add_menber_add {
  int? status;
  String? message;
  int? count;
  List<Response>? response;

  yatra_add_menber_add({this.status, this.message, this.count, this.response});

  yatra_add_menber_add.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? mobile;
  String? email;
  String? gender;

  Response(
      {this.userId,
        this.memberId,
        this.name,
        this.mobile,
        this.email,
        this.gender});

  Response.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    memberId = json['member_id'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['member_id'] = this.memberId;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['gender'] = this.gender;
    return data;
  }
}
