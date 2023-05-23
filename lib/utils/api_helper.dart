import 'dart:convert';

import 'package:http/http.dart' as http;

import '../post/modal/products_modal.dart';

class ApiHelper
{
  static ApiHelper apiHelper = ApiHelper();

  String link='https://fakestoreapi.com/products';
  Future<void> productsGetJson()
  async {
    var response = await http.get(Uri.parse(link));
    String? jsonString=response.body;
  }
}