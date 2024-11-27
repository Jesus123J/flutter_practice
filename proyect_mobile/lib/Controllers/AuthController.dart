// auth_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyect_mobile/services/AuthService.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();
  var showHelperText = true.obs; // Observa el estado de helperText

  void onUsernameChanged(String text) {
    showHelperText.value = text.isEmpty; // Cambia el estado según el contenido
  }
  // Variables reactivas de GetX

  var isLoading = false.obs;
  var isLoggedIn = false.obs;

  Future<void> login(String username, String password) async {
    isLoading.value = true;
    bool success = await _authService.login(username, password);
    isLoading.value = false;

    if (success) {
      isLoggedIn.value = true;
      Get.snackbar('Login exitoso', 'Bienvenido, $username');
      Get.offNamed('/home');
    } else {
      Get.snackbar(
        'Message',
        'Error de componente',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        borderRadius: 20,
        margin: EdgeInsets.all(10),
        icon: Icon(Icons.error, color: Colors.white),
        duration: Duration(seconds: 3),
        isDismissible: true,
      );
    }
  }
}
