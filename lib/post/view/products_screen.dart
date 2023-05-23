import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_json_parshing/post/provider/post_provider.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  PostProvider? postProviderFalse;
  PostProvider? postProviderTrue;

  @override
  void initState() {
    super.initState();
    Provider.of<PostProvider>(context, listen: false).productsGetJson();
  }
  @override
  Widget build(BuildContext context) {
    postProviderFalse = Provider.of(context, listen: false);
    postProviderTrue = Provider.of(context, listen: true);
    return SafeArea(
        child: Scaffold(
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
      body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 210),
          itemBuilder: (context, index) => print(index),
          itemCount: postProviderTrue!.proList.length),
    ));
  }

  Widget print(int index) {
    return Center(
      child: Container(
        height: 500,
        width: 150,
        margin: EdgeInsets.all(5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                height: 150,
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    '${postProviderFalse!.proList[index].image}',
                    fit: BoxFit.fill,
                  ),
                )),
            SizedBox(height: 5),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "${postProviderFalse!.proList[index].cate}",
                style:
                    TextStyle(color: Colors.white, fontSize: 15, letterSpacing: 1),
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Text(
                  "${postProviderFalse!.proList[index].rate!.rate}",
                  style:
                  TextStyle(color: Colors.white, fontSize: 15, letterSpacing: 1),),
                Spacer(),
                Text(
                  "${postProviderFalse!.proList[index].price}",
                  style:
                  TextStyle(color: Colors.white, fontSize: 15, letterSpacing: 1),)
              ],
            )
          ],
        ),
      ),
    );
  }
}