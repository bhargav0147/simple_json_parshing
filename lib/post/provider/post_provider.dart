import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_json_parshing/post/modal/user_model.dart';

class PostProvider extends ChangeNotifier
{
    List<dynamic>jsonList=[];
    List<UserModel>userList=[];
    Future<void> getPostJson()
    async {
      String jsonString=await rootBundle.loadString("assets/json/postData.json");
      jsonList=jsonDecode(jsonString);
      notifyListeners();
    }
    Future<void> UserGetJson()
    async {
      String jsonString=await rootBundle.loadString("assets/json/user.json");
      List jsonList=jsonDecode(jsonString);
      userList=jsonList.map((e) => UserModel.fromJson(e)).toList();
      notifyListeners();
    }


}