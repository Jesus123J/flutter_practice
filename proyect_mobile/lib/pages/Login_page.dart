// login_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyect_mobile/Controllers/AuthController.dart';
import 'package:proyect_mobile/pages/widgets/PasswordController.dart';
import 'package:proyect_mobile/pages/widgets/UsernameController.dart';

class LoginPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  final UsernameController usernameController = Get.put(UsernameController());
  final TextEditingController usernameTextController = TextEditingController(text: "jesusthiago@gmail.com");

  final PasswordController passwordController = Get.put(PasswordController());
  final TextEditingController passwordTextController = TextEditingController(text: "J240501194055");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
                    () =>  TextField(
                      controller: usernameTextController,
                      decoration: InputDecoration(
                        labelText: "Username",
                        helperText: usernameController.showHelperText.value ? "No hay usurio": ""


                      ),

                      onChanged: (value) => {
                          if(usernameController.showHelperText.value){
                           usernameController.showHelperText.value = false
                          }else{
                            usernameController.showHelperText.value = false
                          }

                      },

                    )
            ),
            SizedBox(height: 20),
            Obx(() => TextField(
              controller: passwordTextController,
              obscureText: !passwordController.isPasswordVisible.value,
              decoration: InputDecoration(
                labelText: "Password",
                helperText: passwordController.showHelperText.value
                    ? "La contraseña no puede estar vacía"
                    : "",
                suffixIcon: IconButton(
                  icon: Icon(passwordController.isPasswordVisible.value
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: passwordController.togglePasswordVisibility,
                ),
              ),
              onChanged: (value) => {
                if(passwordController.showHelperText.value){
                  passwordController.showHelperText.value = false
                }else{
                  passwordController.showHelperText.value = false
                }

              },
            )),
            SizedBox(height: 20),
            Obx(() {
              if (authController.isLoading.value) {
                return CircularProgressIndicator(); // Muestra indicador de carga
              }
              return ElevatedButton(
                onPressed: () {
                  if(passwordTextController.text.trim().isEmpty && usernameTextController.text.trim().isEmpty){
                    usernameController.showHelperText.value = true;
                    passwordController.showHelperText.value = true;
                    return;
                  }
                  if(usernameTextController.text.trim().isEmpty ){
                    usernameController.showHelperText.value = true;
                    return;
                  }
                  if(passwordTextController.text.trim().isEmpty){
                    passwordController.showHelperText.value = true;
                    return;
                  }
                  authController.login(
                    usernameTextController.text,
                    passwordTextController.text,
                  );
                },
                child: Text("Login"),
              );
            }),
          ],
        ),
      ),
    );
  }
}
