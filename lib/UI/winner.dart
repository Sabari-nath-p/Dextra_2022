import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';

late BuildContext Context;

class winner extends StatefulWidget {
  const winner({Key? key}) : super(key: key);

  @override
  State<winner> createState() => _winnerState();
}

class _winnerState extends State<winner> {
  TextEditingController event = TextEditingController(),
      name1 = TextEditingController(),
      y1 = TextEditingController(),
      b1 = TextEditingController(),
      t1 = TextEditingController(),
      name2 = TextEditingController(),
      y2 = TextEditingController(),
      b2 = TextEditingController(),
      t2 = TextEditingController(),
      name3 = TextEditingController(),
      y3 = TextEditingController(),
      b3 = TextEditingController(),
      t3 = TextEditingController();

  upload(List name, List year, List Batch, List Team, String item, int val) {
    final databaseReference = FirebaseDatabase.instance.reference();

    String First = name[0] + "#" + year[0] + "# " + Batch[0] + "#" + Team[0]+ "# " + item;
    String Second = name[1] + "#" + year[1] + "# " + Batch[1] + "#" + Team[1];
    String Third = name[2] + "#" + year[2] + "# " + Batch[2] + "#" + Team[2];
    val++;
    databaseReference.child('Winner').child(val.toString()).set({
      '1': First,
      '2': Second,
      '3': Third,
      'event ': item,
    }).whenComplete(() {
      To("Completed");
      name1.clear();
      name2.clear();
      name3.clear();
      y1.clear();
      b1.clear();
      t1.clear();
      y2.clear();
      b2.clear();
      t3.clear();
      event.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    Context = context;
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Text(
              'Winner Adding Panel',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 91, 89, 89),
                fontSize: 30,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
                top: density(30), left: density(20), right: density(80)),
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
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: density(10)),
            child: Text('First Runner Up'),
            color: Colors.orange,
            height: 20,
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
                top: density(10), left: density(20), right: density(110)),
            child: TextFormField(
              controller: name1,
              style: TextStyle(fontSize: 12),
              decoration: const InputDecoration(
                  fillColor: Colors.white70,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintText: 'Name of Patricipant',
                  labelText: 'Name *',
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
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
                top: density(10), left: density(20), right: density(110)),
            child: TextFormField(
              controller: y1,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 12),
              decoration: const InputDecoration(
                  fillColor: Colors.white70,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintText: 'SEMESTER',
                  labelText: 'SEMESTER *',
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
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
                top: density(10), left: density(20), right: density(110)),
            child: TextFormField(
              controller: b1,
              textCapitalization: TextCapitalization.characters,
              style: TextStyle(fontSize: 12),
              decoration: const InputDecoration(
                  fillColor: Colors.white70,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintText: 'BRANCH',
                  labelText: 'BRANCH *',
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
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
                top: density(10), left: density(20), right: density(110)),
            child: TextFormField(
              controller: t1,
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.characters,
              style: TextStyle(fontSize: 12),
              decoration: const InputDecoration(
                  fillColor: Colors.white70,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintText: 'Name of team',
                  labelText: 'TEAM *',
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
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: density(10)),
            child: Text('Second Runner Up'),
            color: Color.fromARGB(255, 0, 187, 255),
            height: 20,
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
                top: density(10), left: density(20), right: density(110)),
            child: TextFormField(
              controller: name2,
              style: TextStyle(fontSize: 12),
              decoration: const InputDecoration(
                  fillColor: Colors.white70,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintText: 'Name of Patricipant',
                  labelText: 'Name *',
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
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
                top: density(10), left: density(20), right: density(110)),
            child: TextFormField(
              controller: y2,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 12),
              decoration: const InputDecoration(
                  fillColor: Colors.white70,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintText: 'SEMESTER',
                  labelText: 'SEMESTER *',
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
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
                top: density(10), left: density(20), right: density(110)),
            child: TextFormField(
              controller: b2,
              textCapitalization: TextCapitalization.characters,
              style: TextStyle(fontSize: 12),
              decoration: const InputDecoration(
                  fillColor: Colors.white70,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintText: 'BRANCH',
                  labelText: 'BRANCH *',
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
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
                top: density(10), left: density(20), right: density(110)),
            child: TextFormField(
              controller: t2,
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.characters,
              style: TextStyle(fontSize: 12),
              decoration: const InputDecoration(
                  fillColor: Colors.white70,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintText: 'Name of team',
                  labelText: 'TEAM *',
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
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: density(10)),
            child: Text('Third Runner Up'),
            color: Color.fromARGB(255, 255, 65, 65),
            height: 20,
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
                top: density(10), left: density(20), right: density(110)),
            child: TextFormField(
              controller: name3,
              style: TextStyle(fontSize: 12),
              decoration: const InputDecoration(
                  fillColor: Colors.white70,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintText: 'Name of Patricipant',
                  labelText: 'Name *',
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
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
                top: density(10), left: density(20), right: density(110)),
            child: TextFormField(
              controller: y3,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 12),
              decoration: const InputDecoration(
                  fillColor: Colors.white70,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintText: 'SEMESTER',
                  labelText: 'SEMESTER *',
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
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
                top: density(10), left: density(20), right: density(110)),
            child: TextFormField(
              controller: b3,
              textCapitalization: TextCapitalization.characters,
              style: TextStyle(fontSize: 12),
              decoration: const InputDecoration(
                  fillColor: Colors.white70,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintText: 'BRANCH',
                  labelText: 'BRANCH *',
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
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
                top: density(10), left: density(20), right: density(110)),
            child: TextFormField(
              controller: t3,
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.characters,
              style: TextStyle(fontSize: 12),
              decoration: const InputDecoration(
                  fillColor: Colors.white70,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintText: 'Name of team',
                  labelText: 'TEAM *',
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
                  List<String> n = [name1.text, name2.text, name3.text];
                  List<String> y = [y1.text, y2.text, y3.text];
                  List<String> b = [b1.text, b2.text, b3.text];
                  List<String> t = [t1.text, t2.text, t3.text];
                  final databaseReference =
                      FirebaseDatabase.instance.reference();
                  databaseReference
                      .child('Winner/TOTAL')
                      .once()
                      .then((DataSnapshot snapshot) {
                    String s = snapshot.value.toString();
                    int k = int.parse(s);

                    upload(n, y, b, t, event.text, k);
                    k++;
                    databaseReference
                        .child('Winner')
                        .update({'TOTAL': k.toString()});
                  });
                },
                child: Text('  SUBMIT  '),
                style: ElevatedButton.styleFrom(
                    primary: Color(0xff11cfc5), shape: StadiumBorder())),
          ),
        ],
      )),
    );
  }
}

double density(double d) {
  double height = MediaQuery.of(Context).size.width;
  double value = d * (height / 384);
  return value;
}

To(String k) {
  Fluttertoast.showToast(
    msg: k,
  );
}
