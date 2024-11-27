import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsernameController extends GetxController {
  var showHelperText = false.obs; // Observa el estado de helperText

  void onUsernameChanged(String text) {

    showHelperText.value = text.isEmpty; // Cambia el estado según el contenido
  }
}
