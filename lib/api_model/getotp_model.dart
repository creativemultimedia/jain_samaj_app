class getotp_api {
  int? status;
  String? message;
  int? count;
  List<Response>? response;

  getotp_api({this.status, this.message, this.count, this.response});

  getotp_api.fromJson(Map<String, dynamic> json) {
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
  String? mobile;
  String? otp;
  String? numOfOptSentToday;

  Response({this.userId, this.mobile, this.otp, this.numOfOptSentToday});

  Response.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    mobile = json['mobile'];
    otp = json['otp'];
    numOfOptSentToday = json['num_of_opt_sent_today'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['mobile'] = this.mobile;
    data['otp'] = this.otp;
    data['num_of_opt_sent_today'] = this.numOfOptSentToday;
    return data;
  }
}
