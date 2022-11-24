import 'dart:convert';

class badrespondce_model {
  int? status;
  dynamic message;
  int? count;
  List<Response>? response;

  badrespondce_model({this.status, this.message, this.count, this.response});

  badrespondce_model.fromJson(Map<String, dynamic> json) {
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
List<Response> ResponseFromJson(String str) => List<Response>.from(json.decode(str).map((x) => Response.fromJson(x)));

String ResponseToJson(List<Response> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class Response {
dynamic key1;
dynamic key2;
dynamic key3;
dynamic key4;

  Response({
    required this.key1,
   required this.key2,
   required this.key3,
   required this.key4,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    key1: json["key1"] == null ? null : json["key1"],
    key2: json["key2"] == null ? null : json["key2"],
    key3: json["key3"] == null ? null : json["key3"],
    key4: json["key4"] == null ? null : json["key4"],
  );

  Map<String, dynamic> toJson() => {
    "key1": key1 == null ? null : key1,
    "key2": key2 == null ? null : key2,
    "key3": key3 == null ? null : key3,
    "key4": key4 == null ? null : key4,
  };
}