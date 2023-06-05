import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    super.initState();
    Provider.of<PostProvider>(context, listen: false).UserGetJson();
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
        actions: [
          Center(
            child: Text(
              "User",
              style: TextStyle(
                  letterSpacing: 1, fontSize: 20, color: Colors.white),
            ),
          ),
          SizedBox(width: 10)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
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
      height: 480,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 5),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Id => ${postProviderFalse!.userList[i].id}",
                style: TextStyle(letterSpacing: 1, fontSize: 15,color: Colors.black),
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 0.5,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Name => ${postProviderFalse!.userList[i].nameModel!.firstname} ${postProviderFalse!.userList[i].nameModel!.lastname}",
                style: TextStyle(letterSpacing: 1, fontSize: 15,color: Colors.black),
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 0.5,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Email => ${postProviderFalse!.userList[i].email}",
                style: TextStyle(
                    letterSpacing: 1, fontSize: 15, color: Colors.black),
              ),
            ),

            Divider(
              color: Colors.black,
              thickness: 0.5,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "User Name => ${postProviderFalse!.userList[i].username}",
                style: TextStyle(
                    letterSpacing: 1, fontSize: 15,color: Colors.black),
              ),
            ),

            Divider(
              color: Colors.black,
              thickness: 0.5,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Password => ${postProviderFalse!.userList[i].password}",
                style: TextStyle(
                    letterSpacing: 1, fontSize: 15, color: Colors.black),
              ),
            ),

            Divider(
              color: Colors.black,
              thickness: 0.5,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Phone => ${postProviderFalse!.userList[i].phone}",
                style: TextStyle(
                    letterSpacing: 1, fontSize: 15,color: Colors.black),
              ),
            ),

            Divider(
              color: Colors.black,
              thickness: 0.5,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "V => ${postProviderFalse!.userList[i].v}",
                style: TextStyle(
                    letterSpacing: 1, fontSize: 15,color: Colors.black),
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 0.5,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "City => ${postProviderFalse!.userList[i].address!.city}",
                style: TextStyle(
                    letterSpacing: 1, fontSize: 15, color: Colors.black),
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 0.5,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Street => ${postProviderFalse!.userList[i].address!.street}",
                style: TextStyle(
                    letterSpacing: 1, fontSize: 15, color: Colors.black),
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 0.5,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Number => ${postProviderFalse!.userList[i].address!.number}",
                style: TextStyle(
                    letterSpacing: 1, fontSize: 15, color: Colors.black),
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 0.5,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "ZipCode => ${postProviderFalse!.userList[i].address!.zipcode}",
                style: TextStyle(
                    letterSpacing: 1, fontSize: 15, color: Colors.black),
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 0.5,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Late => ${postProviderFalse!.userList[i].address!.geoModel!.late}",
                style: TextStyle(
                    letterSpacing: 1, fontSize: 15, color: Colors.black),
              ),
            ),

            Divider(
              color: Colors.black,
              thickness: 0.5,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Long => ${postProviderFalse!.userList[i].address!.geoModel!.long}",
                style: TextStyle(
                    letterSpacing: 1, fontSize: 15, color: Colors.black),
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
