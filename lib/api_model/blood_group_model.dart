class bloodgroup_api {
  int? status;
  String? message;
  int? count;
  List<Response>? response;

  bloodgroup_api({this.status, this.message, this.count, this.response});

  bloodgroup_api.fromJson(Map<String, dynamic> json) {
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
  String? bloodGroupId;
  String? name;
  String? nameSlug;
  String? description;

  Response({this.bloodGroupId, this.name, this.nameSlug, this.description});

  Response.fromJson(Map<String, dynamic> json) {
    bloodGroupId = json['blood_group_id'];
    name = json['name'];
    nameSlug = json['name_slug'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['blood_group_id'] = this.bloodGroupId;
    data['name'] = this.name;
    data['name_slug'] = this.nameSlug;
    data['description'] = this.description;
    return data;
  }
}
