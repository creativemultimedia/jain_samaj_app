
import 'dart:convert';

List<FamilyModel> familyModelFromJson(String str) => List<FamilyModel>.from(json.decode(str).map((x) => FamilyModel.fromJson(x)));

String familyModelToJson(List<FamilyModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FamilyModel {
  FamilyModel({
    this.name,
    this.gender,
    this.relation,
    this.dob,
    this.birthTithi,
    this.bloodGroup,
    this.mobile,
    this.email,
  });

  String? name;
  String? gender;
  String? relation;
  String? dob;
  String? birthTithi;
  String? bloodGroup;
  String? mobile;
  String? email;

  factory FamilyModel.fromJson(Map<String, dynamic> json) => FamilyModel(
    name: json["name"] == null ? null : json["name"],
    gender: json["gender"] == null ? null : json["gender"],
    relation: json["relation"] == null ? null : json["relation"],
    dob: json["dob"] == null ? null : json["dob"],
    birthTithi: json["birth_tithi"] == null ? null : json["birth_tithi"],
    bloodGroup: json["blood_group"] == null ? null : json["blood_group"],
    mobile: json["mobile"] == null ? null : json["mobile"],
    email: json["email"] == null ? null : json["email"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "gender": gender == null ? null : gender,
    "relation": relation == null ? null : relation,
    "dob": dob == null ? null : dob,
    "birth_tithi": birthTithi == null ? null : birthTithi,
    "blood_group": bloodGroup == null ? null : bloodGroup,
    "mobile": mobile == null ? null : mobile,
    "email": email == null ? null : email,
  };
}
