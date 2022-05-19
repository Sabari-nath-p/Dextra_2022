import 'dart:convert';
import 'dart:ffi';

import 'package:dextra_2022/UI/temp.dart';
import 'package:dextra_2022/component/event.dart';
import 'package:dextra_2022/component/hh.dart';
import 'package:dextra_2022/component/shedule.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

late BuildContext Context;
int t = 0;

class teamrank extends StatefulWidget {
  const teamrank({Key? key}) : super(key: key);

  @override
  State<teamrank> createState() => _teamrankState();
}

class _teamrankState extends State<teamrank> {
  List vl = [
    Container(
      alignment: Alignment.center,
      child: Text(
        'congratulations to all participants',
        textAlign: TextAlign.center,
      ),
    )
  ];

  late List l = [
      Container(
      alignment: Alignment.center,
      child: Text(
        ' Please inform in the place before 5 minute',
        textAlign: TextAlign.center,
      ),
    )
  ];
  void initState() {
    final databaseReference = FirebaseDatabase.instance.reference();

    databaseReference.child('Winner/T1').once().then((DataSnapshot snap) {
      l.add(team(s: snap.value));
      databaseReference.child('Winner/T2').once().then((DataSnapshot snap) {
        l.add(team(s: snap.value));
           databaseReference.child('Winner/T3').once().then((DataSnapshot snap) {
          l.add(team(s: snap.value));
          print(snap.value);
           databaseReference.child('Winner/T4').once().then((DataSnapshot snap) {
            l.add(team(s: snap.value));
          });
        });
      });
    });
    
 
   
    databaseReference
        .child('Winner/TOTAL')
        .once()
        .then((DataSnapshot snapshot1) {
      //t = snapshot1.value;
      for (int i = int.parse(snapshot1.value) ; i >= 1; i--) {
        databaseReference
            .child('Winner/' + i.toString() + "/1")
            .once()
            .then((DataSnapshot a1) {
          print(a1.value);
          databaseReference
              .child('Winner/' + i.toString() + "/2")
              .once()
              .then((DataSnapshot a2) {
            databaseReference
                .child('Winner/' + i.toString() + "/3")
                .once()
                .then((DataSnapshot a3) {
              databaseReference
                  .child('Winner/' + i.toString() + "/event")
                  .once()
                  .then((DataSnapshot a) {
                print(a.value);
                setState(() {
                  t = i;
                  vl.add(event(
                      a1: a1.value, a2: a2.value, a3: a3.value, eve: 'h'));
                });
              });
            });
          });
        });
      }
    });
  }

  addteam() {
    final instance =
        FirebaseDatabase.instance.reference().child('Winner/TOTAL');

    for (int i = 0; i < 4; i++) {
      instance

          //   .child(i.toString())
          .once()
          .then((DataSnapshot snapshot1) {
        final split = snapshot1.key.split('#');

        print(snapshot1.key);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Context = context;
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFFFAE062),title :   Text(
                'DEXTRA 22',
                textAlign: TextAlign.left,
                style: TextStyle(fontFamily: 'Dead Stock',
                  color: Color.fromARGB(255, 16, 15, 15),
                  fontSize: 30,
                ),
              ),

      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.all(density(5)),
                decoration: BoxDecoration(
                  border:
                      Border(right: BorderSide(color: Colors.grey, width: .5)),
                ),
                child: Text('Team Score Card',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28,fontFamily: 'MOOD')),
              ),
              if (l.length >= 2)
                Container(
                  child: l[1],
                ),
              if (l.length >= 2)
                Container(
                  child: l[2],
                ),
              if (l.length >= 3)
                Container(
                  child: l[3],
                ),
              if (l.length >= 4)
                Container(
                  child: l[4],
                ),
              Container(
                margin: EdgeInsets.only(top: density(density(30))),
              ),
              Container(
                child: Text('Event Winner',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28,fontFamily: 'MOOD')),
              ),
              Container(
                  margin: EdgeInsets.all(density(10)),
                  padding: EdgeInsets.all(density(10)),
                  // color: Color.fromARGB(255, 57, 210, 249),
                  decoration: BoxDecoration(
                      color: Color(0xFF0A75BC),
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  height: 415,
                  child: (vl.length != 1)
                      ? ListView.builder(
                          shrinkWrap: true,
                       //   reverse: true,
                          itemCount: vl.length,
                          itemBuilder: (BuildContext context, int index) {
                            return vl[index];
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
}

double density(double d) {
  double height = MediaQuery.of(Context).size.width;
  double value = d * (height / 384);
  return value;
}
