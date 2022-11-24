class yatra_location_menber_add {
  int? status;
  String? message;
  int? count;
  List<Response>? response;

  yatra_location_menber_add(
      {this.status, this.message, this.count, this.response});

  yatra_location_menber_add.fromJson(Map<String, dynamic> json) {
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
  String? yatraTravelModeId;
  String? name;
  String? nameSlug;
  String? description;

  Response(
      {this.yatraTravelModeId, this.name, this.nameSlug, this.description});

  Response.fromJson(Map<String, dynamic> json) {
    yatraTravelModeId = json['yatra_travel_mode_id'];
    name = json['name'];
    nameSlug = json['name_slug'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['yatra_travel_mode_id'] = this.yatraTravelModeId;
    data['name'] = this.name;
    data['name_slug'] = this.nameSlug;
    data['description'] = this.description;
    return data;
  }
}
