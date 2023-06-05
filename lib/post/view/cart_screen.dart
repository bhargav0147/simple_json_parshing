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
    super.initState();
    Provider.of<PostProvider>(context,listen: false).cartGetJson();
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
        actions: [
          Center(
            child: Text(
              "Cart",
              style: TextStyle(
                  letterSpacing: 1, fontSize: 20, color: Colors.white),
            ),
          ),
          SizedBox(width: 10)
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => showJson(index),
        itemCount: postProviderTrue!.cartList.length,
      ),
    ));
  }
  Widget showJson(int i) {
    return Container(
      height: 150,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 5),
            Text("Id => ${postProviderFalse!.cartList[i].id}",style: TextStyle(letterSpacing: 1,fontSize: 20),),
            Divider(color: Colors.black,thickness: 0.5,),
            Text("User Id => ${postProviderFalse!.cartList[i].userId}",style: TextStyle(letterSpacing: 1,fontSize: 20),),
            Divider(color: Colors.black,thickness: 0.5,),
            Text("Date => ${postProviderFalse!.cartList[i].date}",style: TextStyle(letterSpacing: 1,fontSize: 20),),
            Divider(color: Colors.black,thickness: 0.5,),
            Text("V => ${postProviderFalse!.cartList[i].v}",style: TextStyle(letterSpacing: 1,fontSize: 20),),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
