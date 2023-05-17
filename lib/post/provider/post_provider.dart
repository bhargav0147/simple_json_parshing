import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class PostProvider extends ChangeNotifier
{
    List<dynamic>jsonList=[];
    Future<void> getPostJson()
    async {
      String jsonString=await rootBundle.loadString("assets/json/postData.json");
      jsonList=jsonDecode(jsonString);
      notifyListeners();

    }
}