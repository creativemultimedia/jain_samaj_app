// To parse this JSON data, do
//
//     final homepageApi = homepageApiFromMap(jsonString);

import 'dart:convert';

HomepageApi homepageApiFromMap(String str) => HomepageApi.fromMap(json.decode(str));

String homepageApiToMap(HomepageApi data) => json.encode(data.toMap());

class HomepageApi {
  HomepageApi({
    this.status,
    this.message,
    this.count,
    this.response,
  });

  int? status;
  String? message;
  int? count;
  List<Response>? response;

  factory HomepageApi.fromMap(Map<String, dynamic> json) => HomepageApi(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    count: json["count"] == null ? null : json["count"],
    response: json["response"] == null ? null : List<Response>.from(json["response"].map((x) => Response.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "count": count == null ? null : count,
    "response": response == null ? null : List<dynamic>.from(response!.map((x) => x.toMap())),
  };
}

class Response {
  Response({
    this.homeBanner,
    this.yatraLocation,
    this.yatraLocationBookingShow,
    this.yatraLocationBookingInfo,
  });

  List<HomeBanner>? homeBanner;
  List<YatraLocation>? yatraLocation;
  String? yatraLocationBookingShow;
  List<YatraLocationBookingInfo>? yatraLocationBookingInfo;

  factory Response.fromMap(Map<String, dynamic> json) => Response(
    homeBanner: json["home_banner"] == null ? null : List<HomeBanner>.from(json["home_banner"].map((x) => HomeBanner.fromMap(x))),
    yatraLocation: json["yatra_location"] == null ? null : List<YatraLocation>.from(json["yatra_location"].map((x) => YatraLocation.fromMap(x))),
    yatraLocationBookingShow: json["yatra_location_booking_show"] == null ? null : json["yatra_location_booking_show"],
    yatraLocationBookingInfo: json["yatra_location_booking_info"] == null ? null : List<YatraLocationBookingInfo>.from(json["yatra_location_booking_info"].map((x) => YatraLocationBookingInfo.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "home_banner": homeBanner == null ? null : List<dynamic>.from(homeBanner!.map((x) => x.toMap())),
    "yatra_location": yatraLocation == null ? null : List<dynamic>.from(yatraLocation!.map((x) => x.toMap())),
    "yatra_location_booking_show": yatraLocationBookingShow == null ? null : yatraLocationBookingShow,
    "yatra_location_booking_info": yatraLocationBookingInfo == null ? null : List<dynamic>.from(yatraLocationBookingInfo!.map((x) => x.toMap())),
  };
}

class HomeBanner {
  HomeBanner({
    this.text,
    this.link,
    this.img,
  });

  String? text;
  String? link;
  String? img;

  factory HomeBanner.fromMap(Map<String, dynamic> json) => HomeBanner(
    text: json["text"] == null ? null : json["text"],
    link: json["link"] == null ? null : json["link"],
    img: json["img"] == null ? null : json["img"],
  );

  Map<String, dynamic> toMap() => {
    "text": text == null ? null : text,
    "link": link == null ? null : link,
    "img": img == null ? null : img,
  };
}

class YatraLocation {
  YatraLocation({
    this.yatraLocationId,
    this.title,
    this.titleSlug,
    this.location,
    this.description,
    this.maxPeople,
    this.noOfDays,
    this.gender,
    this.startDate,
    this.endDate,
    this.image,
  });

  String? yatraLocationId;
  String? title;
  String? titleSlug;
  String? location;
  String? description;
  String? maxPeople;
  String? noOfDays;
  String? gender;
  DateTime? startDate;
  DateTime? endDate;
  String? image;

  factory YatraLocation.fromMap(Map<String, dynamic> json) => YatraLocation(
    yatraLocationId: json["yatra_location_id"] == null ? null : json["yatra_location_id"],
    title: json["title"] == null ? null : json["title"],
    titleSlug: json["title_slug"] == null ? null : json["title_slug"],
    location: json["location"] == null ? null : json["location"],
    description: json["description"] == null ? null : json["description"],
    maxPeople: json["max_people"] == null ? null : json["max_people"],
    noOfDays: json["no_of_days"] == null ? null : json["no_of_days"],
    gender: json["gender"] == null ? null : json["gender"],
    startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
    endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
    image: json["image"] == null ? null : json["image"],
  );

  Map<String, dynamic> toMap() => {
    "yatra_location_id": yatraLocationId == null ? null : yatraLocationId,
    "title": title == null ? null : title,
    "title_slug": titleSlug == null ? null : titleSlug,
    "location": location == null ? null : location,
    "description": description == null ? null : description,
    "max_people": maxPeople == null ? null : maxPeople,
    "no_of_days": noOfDays == null ? null : noOfDays,
    "gender": gender == null ? null : gender,
    "start_date": startDate == null ? null : "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
    "end_date": endDate == null ? null : "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
    "image": image == null ? null : image,
  };
}

class YatraLocationBookingInfo {
  YatraLocationBookingInfo({
    this.yatraLocationBookingId,
    this.dateOfBooking,
    this.dateOfBookingText,
    this.yatraTravelMode,
    this.title,
    this.titleSlug,
    this.location,
    this.description,
    this.image,
    this.color,
    this.bgColor,
    this.statusShow,
    this.yatraBookBy,
  });

  String? yatraLocationBookingId;
  String? dateOfBooking;
  String? dateOfBookingText;
  String? yatraTravelMode;
  String? title;
  String? titleSlug;
  String? location;
  String? description;
  String? image;
  String? color;
  String? bgColor;
  String? statusShow;
  String? yatraBookBy;

  factory YatraLocationBookingInfo.fromMap(Map<String, dynamic> json) => YatraLocationBookingInfo(
    yatraLocationBookingId: json["yatra_location_booking_id"] == null ? null : json["yatra_location_booking_id"],
    dateOfBooking: json["date_of_booking"] == null ? null : json["date_of_booking"],
    dateOfBookingText: json["date_of_booking_text"] == null ? null : json["date_of_booking_text"],
    yatraTravelMode: json["yatra_travel_mode"] == null ? null : json["yatra_travel_mode"],
    title: json["title"] == null ? null : json["title"],
    titleSlug: json["title_slug"] == null ? null : json["title_slug"],
    location: json["location"] == null ? null : json["location"],
    description: json["description"] == null ? null : json["description"],
    image: json["image"] == null ? null : json["image"],
    color: json["color"] == null ? null : json["color"],
    bgColor: json["bg_color"] == null ? null : json["bg_color"],
    statusShow: json["status_show"] == null ? null : json["status_show"],
    yatraBookBy: json["yatra_book_by"] == null ? null : json["yatra_book_by"],
  );

  Map<String, dynamic> toMap() => {
    "yatra_location_booking_id": yatraLocationBookingId == null ? null : yatraLocationBookingId,
    "date_of_booking": dateOfBooking == null ? null : dateOfBooking,
    "date_of_booking_text": dateOfBookingText == null ? null : dateOfBookingText,
    "yatra_travel_mode": yatraTravelMode == null ? null : yatraTravelMode,
    "title": title == null ? null : title,
    "title_slug": titleSlug == null ? null : titleSlug,
    "location": location == null ? null : location,
    "description": description == null ? null : description,
    "image": image == null ? null : image,
    "color": color == null ? null : color,
    "bg_color": bgColor == null ? null : bgColor,
    "status_show": statusShow == null ? null : statusShow,
    "yatra_book_by": yatraBookBy == null ? null : yatraBookBy,
  };
}
