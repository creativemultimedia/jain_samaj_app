// ignore_for_file: camel_case_types, no_leading_underscores_for_local_identifiers, prefer_typing_uninitialized_variables, unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:location/location.dart';
class location_permission {

  // static const int ispermission = 0;
  // parmission()  async {
  //   Location location = Location();
  //
  //   late bool _serviceEnabled;
  //   late PermissionStatus _permissionGranted;
  //
  //   var response;
  //   LocationData? _locationData;
  //
  //   _serviceEnabled = await location.serviceEnabled();
  //
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       return;
  //     }
  //   }
  //
  //
  //   _locationData = await location.getLocation();
  //
  //   print("lati =${_locationData.latitude}");
  //   print("longoi=${_locationData.longitude}");
  //   Engstring.latitude = _locationData.latitude ?? 0.0;
  //   Engstring.longitude = _locationData.longitude ?? 0.0;
  //   Engstring.locationpermission = true;
  // }
}

class Engstring {
  // latitude
  static double latitude = 0.0;
  static double longitude = 0.0;
  static bool locationpermission = false;
//MARK: Login Screen

}
