import 'package:flutter/material.dart';

class team extends StatefulWidget {
  String s;
  team({Key? key, required this.s}) : super(key: key);

  @override
  State<team> createState() => _teamState(s: s);
}

class _teamState extends State<team> {
  String s;
  _teamState({required this.s});
  @override
  Widget build(BuildContext context) {
    var value = s.split('#');
    var j = value[1].split(',');
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFF0A75BC),
          border: Border.all(
            width: 2,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(30))),
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: density(10), right: density(10), top: density(5), bottom: density(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: density(10), top: density(5)),
            width: 80,
            child: Text(
              value[0],
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'MOOD',
                  fontWeight: FontWeight.w500),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 120,
                margin: EdgeInsets.only(left: density(10)),
                child: Text(
                  j[0],
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: density(10)),
                child: Text(
                  j[1],
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(
            height: (50),
            width: (50),
            child: im(value[0])
          ),
          Text(value[2].toString(),
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
          Text(" point",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white))
        ],
      ),
    );
  }

  im(String Team) {
    if (Team == 'AGNI') {
      return Image.asset(
        'assets/AGNI.png',
        fit: BoxFit.fill,
        color: Colors.white
      );
    } else if (Team == 'RUDRA') {
      return Image.asset(
        'assets/Rudra.png',
        fit: BoxFit.fill,
        color: Colors.white
      );
    } else if (Team == 'VAJRA') {
      return Image.asset(
        
        'assets/VAJRA.png',
        fit: BoxFit.fill,
        color: Colors.white,
      );
    } else  {
      return Image.asset(
        'assets/ASTRA.png',
        fit: BoxFit.fill,
        color: Colors.white
      );
    }
  }
    double density(double d) {
    double height = MediaQuery.of(context).size.width;
    double value = d * (height / 384);
    return value;
  }
}
