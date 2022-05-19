import 'package:dextra_2022/UI/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Dextra());
}


class Dextra extends StatelessWidget {
  const Dextra({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      

      home: Home() ,
    );
  }
}

