import 'package:flutter/cupertino.dart';
import 'package:untitled/services/apis_services.dart';

class LoginProvider extends ChangeNotifier {
  Future<dynamic> login(String password, String email) async {
    String message = await MainService.loginRequest(password, email);
    notifyListeners();

    if (message == 'Login successful') {
      return true;
    }
    return message; // return the error message
  }
}
