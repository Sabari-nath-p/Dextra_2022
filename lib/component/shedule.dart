import 'package:dextra_2022/component/event.dart';
import 'package:flutter/material.dart';

class shlist extends StatefulWidget {
  String s;
  shlist({Key? key, required this.s}) : super(key: key);

  @override
  State<shlist> createState() => _shlistState(s: s);
}

class _shlistState extends State<shlist> {
  String s;
  _shlistState({required this.s});

 
  @override
  Widget build(BuildContext context) {


     final sepn = s.split('#');
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(bottom: density(15), top: density(10), left: density(10), right: density(10)),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: .5)),
      ),
      child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sepn[0],
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Text(sepn[1],
              style: TextStyle(fontSize: 12))
        ],
      ),
    );
  }
    double density(double d) {
    double height = MediaQuery.of(context).size.width;
    double value = d * (height / 384);
    return value;
  }
}
