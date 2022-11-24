class jain_education_api {
  int? status;
  String? message;
  int? count;
  List<Response>? response;

  jain_education_api({this.status, this.message, this.count, this.response});

  jain_education_api.fromJson(Map<String, dynamic> json) {
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
  String? jainEducationId;
  String? name;
  String? nameSlug;
  String? description;

  Response({this.jainEducationId, this.name, this.nameSlug, this.description});

  Response.fromJson(Map<String, dynamic> json) {
    jainEducationId = json['jain_education_id'];
    name = json['name'];
    nameSlug = json['name_slug'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jain_education_id'] = this.jainEducationId;
    data['name'] = this.name;
    data['name_slug'] = this.nameSlug;
    data['description'] = this.description;
    return data;
  }
}
