class gaccgha__model {
  int? status;
  String? message;
  int? count;
  List<Response>? response;

  gaccgha__model({this.status, this.message, this.count, this.response});

  gaccgha__model.fromJson(Map<String, dynamic> json) {
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
  String? gacchId;
  String? name;
  String? nameSlug;
  String? description;

  Response({this.gacchId, this.name, this.nameSlug, this.description});

  Response.fromJson(Map<String, dynamic> json) {
    gacchId = json['gacch_id'];
    name = json['name'];
    nameSlug = json['name_slug'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gacch_id'] = this.gacchId;
    data['name'] = this.name;
    data['name_slug'] = this.nameSlug;
    data['description'] = this.description;
    return data;
  }
}
