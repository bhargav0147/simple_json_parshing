import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_json_parshing/post/provider/post_provider.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  PostProvider? postProviderFalse;
  PostProvider? postProviderTrue;

  @override
  Widget build(BuildContext context) {
    postProviderFalse = Provider.of(context, listen: false);
    postProviderTrue = Provider.of(context, listen: true);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "JSON Sample",
          style: TextStyle(letterSpacing: 1),
        ),
        actions: [
          IconButton(
              onPressed: () {
                postProviderFalse!.getPostJson();
              },
              icon: Icon(
                Icons.download,
                color: Colors.white,
                size: 25,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => showJson(index),
            itemCount: postProviderTrue!.jsonList.length,
          ),
        ),
      ),
    ));
  }

  Widget showJson(int i) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          Spacer(),
          Text(
            "${postProviderFalse!.jsonList[i]['id']}",
            style: TextStyle(letterSpacing: 1, fontSize: 20),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              height: 50,
              width: 330,
              child: Center(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${postProviderFalse!.jsonList[i]['title']}",
                    style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
