import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_json_parshing/post/modal/cart_modal.dart';
import 'package:simple_json_parshing/post/modal/user_model.dart';

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
    List<ProductsModal> proList=[];
    String link='https://fakestoreapi.com/products';
    Future<void> productsGetJson()
    async {
      var response = await http.get(Uri.parse(link));
      String? jsonString=response.body;
      List jsonList=jsonDecode(jsonString);
      proList=jsonList.map((e) => ProductsModal.fromJson(e)).toList();
      notifyListeners();
    }
    // Future<void> cartGetJson()
    // async {
    //   String jsonString=await rootBundle.loadString("assets/json/cart.json");
    //   List jsonList=jsonDecode(jsonString);
    //   cartList=jsonList.map((e) => CartModal.fromJson(e)).toList();
    //   notifyListeners();
    // }

}