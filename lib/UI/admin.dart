import 'package:dextra_2022/UI/uished.dart';
import 'package:dextra_2022/UI/winner.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

late BuildContext Context;

class admin extends StatefulWidget {
  const admin({Key? key}) : super(key: key);

  @override
  State<admin> createState() => _adminState();
}

class _adminState extends State<admin> {
  bool Passvis = true;
  bool pass = false;
  TextEditingController textEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    Context = context;
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: density(150)),
            child: Text(
              'Admin Control Pannel',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 91, 89, 89),
                fontSize: 30,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: density(70), left: density(50), right: density(50)),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              obscureText: Passvis,
              controller: textEditingController,
              decoration: InputDecoration(
                  fillColor: Colors.white70,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          if (Passvis) {
                            Passvis = false;
                          } else {
                            Passvis = true;
                          }
                        });
                      },
                      icon: (!Passvis)
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility)),
                  labelText: 'Enter Pin  *',
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
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey, width: .5)),
            ),
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(
              top: density(10),
            ),
            padding: EdgeInsets.only(left: density(54), right: density(54)),
            child: ElevatedButton(
                onPressed: () {
                  if (textEditingController.text.toString() == "7594092293") {
                    setState(() {
                      print(textEditingController.text);
                      pass = true;
                    });
                  } else {
                    To();
                  }
                },
                child: Text('    Login    '),
                style: ElevatedButton.styleFrom(
                    primary: Color(0xff11cfc5), shape: StadiumBorder())),
          ),
          Visibility(
            visible: pass,
            child: Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(
                  top: density(10), left: density(50), right: density(50)),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Edit Team Point '),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff11cfc5), shape: StadiumBorder())),
            ),
          ),
          Visibility(
            visible: pass,
            child: Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(
                  top: density(10), left: density(50), right: density(50)),
              child: ElevatedButton(
                  onPressed: () {
                     Navigator.of(context).push(
                        MaterialPageRoute(builder: ((context) => uished())));
                  },
                  child: Text('Sheduled new Item'),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff11cfc5), shape: StadiumBorder())),
            ),
          ),
          Visibility(
            visible: pass,
            child: Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(
                  top: density(10), left: density(50), right: density(50)),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: ((context) => winner())));
                  },
                  child: Text('add winner'),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff11cfc5), shape: StadiumBorder())),
            ),
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

To() {
  Fluttertoast.showToast(
    msg: "Incorrect Password \n mob number recoded ",
  );
}
