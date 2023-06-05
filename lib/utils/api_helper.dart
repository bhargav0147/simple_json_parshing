
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simple_json_parshing/post/modal/products_modal.dart';

class ApiHelper
{
  static ApiHelper apiHelper = ApiHelper();
  List proList=[];
  String link='https://fakestoreapi.com/products';
  Future<List> productsGetJson()
  async {
    var response = await http.get(Uri.parse(link));
    String? jsonString=response.body;
    List data=jsonDecode(jsonString!);
    proList = data.map((e) => ProductsModal.fromJson(e)).toList();
    print(proList.length);
    return proList;
  }
}