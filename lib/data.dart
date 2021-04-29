import 'dart:async';

import 'package:flutter/material.dart';

import 'package:sapmobile/model/test.dart';

class Data extends StatefulWidget{
  @override
  _data createState()=> _data();
  
}
class _data extends State<Data>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
        automaticallyImplyLeading: true,
      ),
    );
  }
}