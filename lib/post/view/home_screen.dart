import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_json_parshing/post/provider/post_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PostProvider? postProviderFalse;
  PostProvider? postProviderTrue;

  @override
  Widget build(BuildContext context) {
    postProviderFalse = Provider.of(context, listen: false);
    postProviderTrue = Provider.of(context, listen: true);
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 100),
                  Text(
                    "JSON Example",
                    style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 35),
                  ElevatedButton(
                    onPressed: () {
                    Navigator.pushNamed(context, 'post');
                    },
                    child: Text(
                      "Post",
                      style: TextStyle(
                          letterSpacing: 1,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  ),
                  SizedBox(height: 35),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'user');
                    },
                    child: Text(
                      "User",
                      style: TextStyle(
                          letterSpacing: 1,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  ),
                  SizedBox(height: 35),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'cart');
                    },
                    child: Text(
                      "Cart",
                      style: TextStyle(
                          letterSpacing: 1,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  ),
                  SizedBox(height: 35),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'products');
                    },
                    child: Text(
                      "Products",
                      style: TextStyle(
                          letterSpacing: 1,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  )
                ],
              ),
            ),),);
  }
}
