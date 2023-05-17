import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_json_parshing/post/modal/user_model.dart';
import 'package:simple_json_parshing/post/provider/post_provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  PostProvider? postProviderFalse;
  PostProvider? postProviderTrue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<PostProvider>(context,listen: false).UserGetJson();
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
            itemCount: postProviderTrue!.userList.length,
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
          SizedBox(width: 20),
          Text(
            "${postProviderFalse!.userList[i].id}",
            style: TextStyle(letterSpacing: 1, fontSize: 20),
          ),
          SizedBox(width: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "${postProviderFalse!.userList[i].nameModel!.firstname}",
              style: TextStyle(letterSpacing: 1, fontSize: 20),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              height: 50,
              width: 150,
              child: Center(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${postProviderFalse!.userList[i].address!.geoModel!.long}",
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
