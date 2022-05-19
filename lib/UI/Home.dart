import 'package:dextra_2022/UI/Teamrank.dart';
import 'package:dextra_2022/UI/admin.dart';
import 'package:dextra_2022/UI/photo.dart';
import 'package:dextra_2022/UI/temp.dart';
import 'package:flutter/material.dart';

late BuildContext Context;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Context = context;
    return Scaffold(
      body: Container(
        color: Color(0xFFFAE062),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: density(250)),
              child: Text(
                'DEXTRA 22',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Dead Stock',
                  color: Color.fromARGB(255, 16, 15, 15),
                  fontSize: 40,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 1),
              child: Text(
                'Arts Fest ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 91, 89, 89),
                  fontSize: 17,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 1),
              child: Text(
                'college of engineering and management punnapra',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 91, 89, 89),
                  fontSize: 11,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(
                  top: density(10), left: density(50), right: density(50)),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: ((context) => teamrank())));
                  },
                  child: Text('Team Scorecard'),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF0A75BC), shape: StadiumBorder())),
            ),
            
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(
                  top: density(10), left: density(50), right: density(50)),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: ((context) => sh())));
                    
                  },
                  child: Text('Scheduled item'),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF0A75BC), shape: StadiumBorder())),
            ),
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(
                  top: density(10), left: density(50), right: density(50)),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: ((context) => photoupload())));
                  },
                  child: Text('  Spot Photography '),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF0A75BC), shape: StadiumBorder())),
            ),
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(
                  top: density(10), left: density(50), right: density(50)),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: ((context) => admin())));
                  },
                  child: Text('  Admin Login  '),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF0A75BC), shape: StadiumBorder())),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: density(280), left: density(50), right: density(50)),
              child: Text("Powdered by \nCEMP Media Team",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 10, color: Color.fromARGB(255, 0, 0, 0))),
            )
          ],
        ),
      ),
    );
  }
}

double density(double d) {
  double height = MediaQuery.of(Context).size.width;
  double value = d * (height / 384);
  return value;
}
