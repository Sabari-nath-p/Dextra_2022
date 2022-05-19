import 'package:dextra_2022/component/shedule.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class sh extends StatefulWidget {
  const sh({Key? key}) : super(key: key);

  @override
  State<sh> createState() => _shState();
}

class _shState extends State<sh> {
  List list = [
    Container(alignment: Alignment.center,
      child: Text(' Please inform in the place before 5 minute',textAlign: TextAlign.center,),
    )
  ];
  void initState() {
    final databaseReference = FirebaseDatabase.instance.reference();
  
    databaseReference
        .child('programs/TOTAL')
        .once()
        .then((DataSnapshot snapshot1) {
     //print(snapshot1.value);
      for (int i = int.parse(snapshot1.value); i >= 1; i--) {
        databaseReference
            .child('programs/' + i.toString())
            .once()
            .then((DataSnapshot a1) {
              setState(() {
                list.add(shlist(s: a1.value));
              });
         
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xFFFAE062),
          child: ListView(
            
            children: [
          
              Container(
                child: Text('Event Chart',
                    textAlign: TextAlign.center, style: TextStyle(fontSize: 28)),
              ),
              Container(
                alignment: Alignment.topCenter,
                  padding: EdgeInsets.all(density(10)),
                  // color: Color.fromARGB(255, 57, 210, 249),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  height: MediaQuery.of(context).size.height-70,
                  child: (list.length != 1)
                      ? ListView.builder(
                        scrollDirection: Axis.vertical,
                      ///    reverse: true,
                          itemCount: list.length,
                          itemBuilder: (BuildContext context, int index) {
                            return list[index];
                          })
                      : Container(
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: density(20)),
                          child: CircularProgressIndicator(),
                        )),
            ],
          ),
        ),
      ),
    );
  }
  double density(double d) {
    double height = MediaQuery.of(context).size.width;
    double value = d * (height / 384);
    return value;
  }
}
