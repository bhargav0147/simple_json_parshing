import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_json_parshing/post/provider/post_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  PostProvider? postProviderFalse;
  PostProvider? postProviderTrue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Provider.of<PostProvider>(context,listen: false).cartGetJson();
  }
  @override
  Widget build(BuildContext context) {
    postProviderFalse = Provider.of(context, listen: false);
    postProviderTrue = Provider.of(context, listen: true);
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => showJson(index),
            itemCount: postProviderTrue!.cartList.length,
          ),
        ),
      ),
    ));
  }
  Widget showJson(int i) {
    return Container(
      height: 100,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Text("${postProviderFalse!.cartList[i].id}"),
          Divider(),
          Text("${postProviderFalse!.cartList[i].userId}"),
          Divider(),
          Text("${postProviderFalse!.cartList[i].v}"),
        ],
      ),
    );
  }
}
