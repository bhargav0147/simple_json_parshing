import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_json_parshing/post/provider/post_provider.dart';
import 'package:simple_json_parshing/post/view/post_screen.dart';
void main()
{
  runApp(DevicePreview(
    builder: (context) => ChangeNotifierProvider(
      create: (context) => PostProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => PostScreen()
        },
      ),
    ),
  ));
}