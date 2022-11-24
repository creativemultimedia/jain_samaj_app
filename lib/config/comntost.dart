import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';


class loader {

  // show error; Dialog
  static
     void showErroDialog(
      {

        String? description = 'Something went wrong'}) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                description ?? '',
                style: TextStyle(fontSize: 16),
              ),
              TextButton(
                onPressed: () {
                  if (Get.isDialogOpen!) Get.back();
                },
                child: Text(
                  'Ok',
                  style: TextStyle( fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //show toast
  //show snack bar
  //show loading
  void showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static  showLoading([String? message]) {
    Get.dialog(
      Center(
          child: CircularProgressIndicator(

          )),
    );
  }

  //hide loading
  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }

  void showloding([String? message]) {
    showLoading(message);
  }

  void hideloading() {
    hideLoading();
  }
}


FormatedDate(_date) {
  var date = DateTime.parse(_date);
  var inputFormat =DateFormat("yyyy-MM-dd");
  var inputDate = inputFormat.parse(_date);
  var outputFormat = DateFormat('dd MMM yyyy');
  return outputFormat.format(inputDate);
}