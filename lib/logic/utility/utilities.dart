import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utility {
  static void showLoadingIndicator() {
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
  }
}
