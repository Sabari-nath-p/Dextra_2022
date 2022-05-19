import 'package:dextra_2022/component/event.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';

class uished extends StatefulWidget {
  const uished({Key? key}) : super(key: key);

  @override
  State<uished> createState() => _uishedState();
}

class _uishedState extends State<uished> {
  DateTime date = DateTime.now();
 TimeOfDay time = TimeOfDay.now();
  TextEditingController event = new TextEditingController(),
      palce = new TextEditingController();

  late BuildContext Context;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    date = DateTime.now();
    time = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    Context = context;
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: density(50)),
              child: Text(
                'New Event scheduling Pannel',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 91, 89, 89),
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(density(10)),
              child: TextFormField(
                controller: event,
                decoration: const InputDecoration(
                    fillColor: Colors.white70,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: 'Name of Event',
                    labelText: 'Event Name *',
                    labelStyle: TextStyle(color: Colors.black38)),
                onSaved: (String? value) {},
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(density(10)),
              child: TextFormField(
                controller: palce,
                decoration: const InputDecoration(
                    fillColor: Colors.white70,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: 'Place ',
                    labelText: 'Place *',
                    labelStyle: TextStyle(color: Colors.black38)),
                onSaved: (String? value) {},
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(
                  top: density(10),
                  left: density(50),
                  right: density(50),
                  bottom: density(10)),
              child: ElevatedButton(
                  onPressed: () {
                    _settime();
                  },
                  child: Text('  Pick time ${time.hour}-${time.minute}  '),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff11cfc5), shape: StadiumBorder())),
            ),
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(
                  top: density(10),
                  left: density(50),
                  right: density(50),
                  bottom: density(10)),
              child: ElevatedButton(
                  onPressed: () {
                    _setdate();
                  },
                  child: Text(
                      '  Pick Date ${date.day}-${date.month}-${date.year}  '),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff11cfc5), shape: StadiumBorder())),
            ),
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(
                  top: density(10),
                  left: density(50),
                  right: density(50),
                  bottom: density(10)),
              child: ElevatedButton(
                  onPressed: () {
                    String name = event.text;
                    String Place = palce.text;
                    String Date =
                        '${date.day}-${date.month}-${date.year}  ,${time.hour}:${time.minute}  ';
                    String f = name + '#' + Place + ',' + Date;
                    final databaseReference =
                        FirebaseDatabase.instance.reference();
                    databaseReference
                        .child('programs/TOTAL')
                        .once()
                        .then((DataSnapshot snapshot) {
                      int t = int.parse(snapshot.value);
                      t++;
                      databaseReference.child('programs').update({
                        'TOTAL': t.toString(),
                      });

                      databaseReference.child('programs').update({
                        t.toString(): f,
                      }).whenComplete(() => To('Added'));
                    });
                  },
                  child: Text('  SUBMIT  '),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff11cfc5), shape: StadiumBorder())),
            ),
          ],
        ),
      )),
    );
  }

  _setdate() async {
    var d = await showDatePicker(
        context: Context,
        initialDate: date,
        firstDate: DateTime(DateTime.now().year - 1),
        lastDate: DateTime(DateTime.now().year + 1));

    if (d != null) {
      setState(() {
        date = d;
      });
    }
  }

  _settime() async {
    var d = await showTimePicker(context: Context, initialTime: time);

    if (d != null) {
      setState(() {
        time = d;
      });
    }
  }
  double density(double d) {
    double height = MediaQuery.of(context).size.width;
    double value = d * (height / 384);
    return value;
  }
}


To(String k) {
  Fluttertoast.showToast(
    msg: k,
  );
}
