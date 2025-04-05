import 'package:flutter/cupertino.dart';

import '../services/apis_services.dart';

class SignUpProvider extends ChangeNotifier
{
  Future<String>signup (String password , String email , String username, String phone  )async
  {
    notifyListeners();
    return await MainService.signUpRequest( password ,  email ,  username,  phone  );
  }
}