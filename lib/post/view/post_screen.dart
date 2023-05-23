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
  void initState() {
    super.initState();
    Provider.of<PostProvider>(context, listen: false).getPostJson();
  }

  @override
  Widget build(BuildContext context) {
    postProviderFalse = Provider.of(context, listen: false);
    postProviderTrue = Provider.of(context, listen: true);
    return SafeArea(
        child: Scaffold(
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
      backgroundColor: Colors.black,
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
      height: 75,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "${postProviderFalse!.jsonList[i]['id']}",
                style: TextStyle(letterSpacing: 1, fontSize: 20),
              ),
            ),
            Divider(color: Colors.black,thickness: 1),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "${postProviderFalse!.jsonList[i]['title']}",
                style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
