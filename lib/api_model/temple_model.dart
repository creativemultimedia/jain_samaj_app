class temple_details_model {
  int? status;
  String? message;
  int? count;
  List<Response>? response;

  temple_details_model({this.status, this.message, this.count, this.response});

  temple_details_model.fromJson(Map<String, dynamic> json) {
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
  String? yatraLocationId;
  String? title;
  String? titleSlug;
  String? location;
  String? description;
  String? maxPeople;
  String? noOfDays;
  String? gender;
  String? startDate;
  String? endDate;
  String? image;
  List<YatraLocationGallery>? yatraLocationGallery;
  List<YatraLocationVideo>? yatraLocationVideo;
  String? startMonthYear;
  String? endMonthYear;
  List<String>? monthYear;
  List<BookingData>? bookingData;
  String? yatraLocationScreenTitle;
  String? yatraLocationScreenSubtitle;
  List<YatraLocationScreenInfo>? yatraLocationScreenInfo;
  String? yatraLocationScreenButton;
  String? yatraLocationScreenMsg;

  Response(
      {this.yatraLocationId,
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
        this.yatraLocationGallery,
        this.yatraLocationVideo,
        this.startMonthYear,
        this.endMonthYear,
        this.monthYear,
        this.bookingData,
        this.yatraLocationScreenTitle,
        this.yatraLocationScreenSubtitle,
        this.yatraLocationScreenInfo,
        this.yatraLocationScreenButton,
        this.yatraLocationScreenMsg});

  Response.fromJson(Map<String, dynamic> json) {
    yatraLocationId = json['yatra_location_id'];
    title = json['title'];
    titleSlug = json['title_slug'];
    location = json['location'];
    description = json['description'];
    maxPeople = json['max_people'];
    noOfDays = json['no_of_days'];
    gender = json['gender'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    image = json['image'];
    if (json['yatra_location_gallery'] != null) {
      yatraLocationGallery = <YatraLocationGallery>[];
      json['yatra_location_gallery'].forEach((v) {
        yatraLocationGallery!.add(new YatraLocationGallery.fromJson(v));
      });
    }
    if (json['yatra_location_video'] != null) {
      yatraLocationVideo = <YatraLocationVideo>[];
      json['yatra_location_video'].forEach((v) {
        yatraLocationVideo!.add(new YatraLocationVideo.fromJson(v));
      });
    }
    startMonthYear = json['start_month_year'];
    endMonthYear = json['end_month_year'];
    monthYear = json['month_year'].cast<String>();
    if (json['booking_data'] != null) {
      bookingData = <BookingData>[];
      json['booking_data'].forEach((v) {
        bookingData!.add(new BookingData.fromJson(v));
      });
    }
    yatraLocationScreenTitle = json['yatra_location_screen_title'];
    yatraLocationScreenSubtitle = json['yatra_location_screen_subtitle'];
    if (json['yatra_location_screen_info'] != null) {
      yatraLocationScreenInfo = <YatraLocationScreenInfo>[];
      json['yatra_location_screen_info'].forEach((v) {
        yatraLocationScreenInfo!.add(new YatraLocationScreenInfo.fromJson(v));
      });
    }
    yatraLocationScreenButton = json['yatra_location_screen_button'];
    yatraLocationScreenMsg = json['yatra_location_screen_msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['yatra_location_id'] = this.yatraLocationId;
    data['title'] = this.title;
    data['title_slug'] = this.titleSlug;
    data['location'] = this.location;
    data['description'] = this.description;
    data['max_people'] = this.maxPeople;
    data['no_of_days'] = this.noOfDays;
    data['gender'] = this.gender;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['image'] = this.image;
    if (this.yatraLocationGallery != null) {
      data['yatra_location_gallery'] =
          this.yatraLocationGallery!.map((v) => v.toJson()).toList();
    }
    if (this.yatraLocationVideo != null) {
      data['yatra_location_video'] =
          this.yatraLocationVideo!.map((v) => v.toJson()).toList();
    }
    data['start_month_year'] = this.startMonthYear;
    data['end_month_year'] = this.endMonthYear;
    data['month_year'] = this.monthYear;
    if (this.bookingData != null) {
      data['booking_data'] = this.bookingData!.map((v) => v.toJson()).toList();
    }
    data['yatra_location_screen_title'] = this.yatraLocationScreenTitle;
    data['yatra_location_screen_subtitle'] = this.yatraLocationScreenSubtitle;
    if (this.yatraLocationScreenInfo != null) {
      data['yatra_location_screen_info'] =
          this.yatraLocationScreenInfo!.map((v) => v.toJson()).toList();
    }
    data['yatra_location_screen_button'] = this.yatraLocationScreenButton;
    data['yatra_location_screen_msg'] = this.yatraLocationScreenMsg;
    return data;
  }
}

class YatraLocationGallery {
  String? image;
  String? title;

  YatraLocationGallery({this.image, this.title});

  YatraLocationGallery.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['title'] = this.title;
    return data;
  }
}

class YatraLocationVideo {
  String? title;
  String? titleSlug;
  String? link;

  YatraLocationVideo({this.title, this.titleSlug, this.link});

  YatraLocationVideo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    titleSlug = json['title_slug'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['title_slug'] = this.titleSlug;
    data['link'] = this.link;
    return data;
  }
}

class BookingData {
  String? date;
  String? showDate;
  String? gacch;
  String? tithi;
  String? color;
  String? bgColor;
  String? isActive;
  String? dateSeries;
  List<AllDateSeries>? allDateSeries;

  BookingData(
      {this.date,
        this.showDate,
        this.gacch,
        this.tithi,
        this.color,
        this.bgColor,
        this.isActive,
        this.dateSeries,
        this.allDateSeries});

  BookingData.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    showDate = json['show_date'];
    gacch = json['gacch'];
    tithi = json['tithi'];
    color = json['color'];
    bgColor = json['bg_color'];
    isActive = json['is_active'];
    dateSeries = json['date_series'];
    if (json['all_date_series'] != null) {
      allDateSeries = <AllDateSeries>[];
      json['all_date_series'].forEach((v) {
        allDateSeries!.add(new AllDateSeries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['show_date'] = this.showDate;
    data['gacch'] = this.gacch;
    data['tithi'] = this.tithi;
    data['color'] = this.color;
    data['bg_color'] = this.bgColor;
    data['is_active'] = this.isActive;
    data['date_series'] = this.dateSeries;
    if (this.allDateSeries != null) {
      data['all_date_series'] =
          this.allDateSeries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllDateSeries {
  String? dateSelect;

  AllDateSeries({this.dateSelect});

  AllDateSeries.fromJson(Map<String, dynamic> json) {
    dateSelect = json['date_select'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date_select'] = this.dateSelect;
    return data;
  }
}

class YatraLocationScreenInfo {
  String? text;
  String? color;

  YatraLocationScreenInfo({this.text, this.color});

  YatraLocationScreenInfo.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['color'] = this.color;
    return data;
  }
}
