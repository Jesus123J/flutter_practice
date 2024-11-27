import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get.dart' as get_x;


class AuthService {

  final Dio _dio = get_x.Get.find<Dio>();

  Future<bool> login(String username, String password) async {
    try {
      final response = await _dio.post(
        '/oauth/login',
        data: {'username': username, 'password': password},
      );
      if (response.statusCode == 200) {
        final data = response.data;
        return data['token'] != null;
      } else {
        return false;
      }
    } catch (e) {
      // Manejo de errores (puedes usar un interceptor para esto también)
      return false;
    }
  }
}
