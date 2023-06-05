import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_json_parshing/post/modal/cart_modal.dart';
import 'package:simple_json_parshing/post/modal/user_model.dart';
import 'package:simple_json_parshing/utils/api_helper.dart';

import '../modal/products_modal.dart';

class PostProvider extends ChangeNotifier
{
    List<dynamic>jsonList=[];
    List<UserModel>userList=[];
    List<CartModal>cartList=[];
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
    List<dynamic> productList=[];

    Future<void> cartGetJson()
    async {
      String jsonString=await rootBundle.loadString("assets/json/cart.json");
      List jsonList=jsonDecode(jsonString);
      cartList=jsonList.map((e) => CartModal.fromJson(e)).toList();
      print(cartList.length);
      notifyListeners();
    }

    Future<void> getprojson()
    async {
      productList =await ApiHelper.apiHelper.productsGetJson();
      notifyListeners();
    }
}