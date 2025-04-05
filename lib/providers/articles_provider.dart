import 'package:flutter/cupertino.dart';
import 'package:untitled/models/articles_model.dart';
import 'package:untitled/services/apis_services.dart';

class ArticlesProvider extends ChangeNotifier
{
    ArticlesModel? model ;
   Future<void>displayData(String category)async
   {
     model =  await MainService.getData(category);
     notifyListeners();
   }
}