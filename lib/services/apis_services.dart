
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:untitled/models/articles_model.dart';

class MainService {
 static  Dio dio = Dio();
 static Future<String>loginRequest(String password , String email ) async
 {
  String message= '';
  Response response = await dio.post('https://elsewedyteam.runasp.net/api/Login/CheckUser',
     data: {'Password': password , 'Email' : email}
     );
    if(response.statusCode != 200 )
     {
       return '${response.statusCode}';
     }
    if (kDebugMode) {
      print(response.data['message']);
    }
   message = response.data['message'];
    return '${response.data['message']}';

 }
 static Future<String>signUpRequest(String password , String email , String username, String phone  ) async
 {
  String message= '';
  Response response = await dio.post('https://elsewedyteam.runasp.net/api/Register/AddUser',
      data: {'password': password , 'email' : email ,  'name': username,'phone':phone }
  );
  if(response.statusCode != 200 )
  {
   print(response.statusCode);
   return '${response.statusCode}';
  }
  if (kDebugMode) {
   print(response.data['message']);
  }

  message = response.data['message'];
  return '${response.data['message']}';

 }
 static Future<ArticlesModel>getData(String category) async
 {
   Response response = await dio.get('https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=beb27b6812424c1a8d74895e1d8afbcd');
   if(response.data['totalResults'] <=  0)
    {
      return ArticlesModel.fromJson({});

    }

   return ArticlesModel.fromJson(response.data);

 }
}