
import 'package:get/get.dart';

class PasswordController extends GetxController {
  RxBool isPasswordVisible = false.obs;
  RxBool showHelperText = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
  void onTextChanged(String currentText) {
    showHelperText.value = currentText.isEmpty;
  }
  void onPasswordChanged(String text) {
    showHelperText.value = text.isEmpty;
  }
}
