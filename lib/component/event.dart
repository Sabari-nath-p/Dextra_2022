import 'package:flutter/material.dart';

late BuildContext Context;

class event extends StatefulWidget {
  String a1, a2, a3, eve;
  event(
      {Key? key,
      required this.a1,
      required this.a2,
      required this.a3,
      required this.eve})
      : super(key: key);

  @override
  State<event> createState() => _eventState(a1: a1, a2: a2, a3: a3, eve: eve);
}

class _eventState extends State<event> {
  String a1, a2, a3, eve;
  _eventState(
      {required this.a1,
      required this.a2,
      required this.a3,
      required this.eve});
  @override
  Widget build(BuildContext context) {
    Context = context;

    List f1 = a1.split('#');
    List f2 = a2.split('#');
    List f3 = a3.split('#');

    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Color.fromARGB(103, 148, 150, 153),
        //     border: Border(bottom: BorderSide(color: Colors.grey, width: .5),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(density(5)),
            alignment: Alignment.topLeft,
            child: Text(
              f1[4],
              style: TextStyle(
                  fontSize: 18, fontFamily: 'MOOD', color: Colors.white),
            ),
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border:
                      Border(right: BorderSide(color: Colors.grey, width: .5)),
                ),
                padding: EdgeInsets.all(density(5)),
                child: Text('1',
                    style: TextStyle(fontFamily: 'MOOD', color: Colors.white)),
              ),
              Container(
                child: Container(
                  width: density(150),
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.grey, width: .5)),
                  ),
                  padding: EdgeInsets.all(density(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        f1[0],
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      Text('S' + f1[1] + ',' + f1[2],
                          style: TextStyle(fontSize: 12, color: Colors.white))
                    ],
                  ),
                ),
              ),
               Container(
                  margin: EdgeInsets.only(left: density(5)),
                  child: SizedBox(
                    height: density(50),
                    width: density(50),
                    child: im(f1[3]),
                  )),
              Expanded(
                child: Text(
                  f1[3],
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border:
                      Border(right: BorderSide(color: Colors.grey, width: .5)),
                ),
                padding: EdgeInsets.all(density(5)),
                child: Text(
                  '2',
                  style: TextStyle(fontFamily: 'MOOD', color: Colors.white),
                ),
              ),
              Container(
                child: Container(
                  width: density(150),
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.grey, width: .5)),
                  ),
                  padding: EdgeInsets.all(density(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        f2[0],
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Text('S' + f2[1] + ',' + f2[2],
                          style: TextStyle(fontSize: 12, color: Colors.white))
                    ],
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: density(5)),
                  child: SizedBox(
                    height: density(50),
                    width: density(50),
                    child: im(f2[3]),
                  )),
              Expanded(
                child: Container(
                  // margin: EdgeInsets.only(right: density(30), left: density(10)),
                  child: Text(
                    f2[3],
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border:
                      Border(right: BorderSide(color: Colors.grey, width: .5)),
                ),
                padding: EdgeInsets.all(density(5)),
                child: Text('3',
                    style: TextStyle(fontFamily: 'MOOD', color: Colors.white)),
              ),
              Container(
                child: Container(
                  width: density(150),
                  decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.grey, width: .5)),
                  ),
                  padding: EdgeInsets.all(density(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        f3[0],
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Text('S' + f3[1] + ',' + f3[2],
                          style: TextStyle(fontSize: 12, color: Colors.white))
                    ],
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: density(5)),
                  child: SizedBox(
                    height: density(50),
                    width: density(50),
                    child: im(f3[3]),
                  )),
              Container(
                width: 100,
                child: Text(
                  f3[3],
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  im(String Team) {
    if (Team == 'AGNI') {
      return Image.asset('assets/AGNI.png',
          fit: BoxFit.fill, color: Colors.white);
    } else if (Team == 'RUDRA') {
      return Image.asset('assets/Rudra.png',
          fit: BoxFit.fill, color: Colors.white);
    } else if (Team == 'VAJRA') {
      return Image.asset(
        'assets/VAJRA.png',
        fit: BoxFit.fill,
        color: Colors.white,
      );
    } else {
      return Image.asset('assets/ASTRA.png',
          fit: BoxFit.fill, color: Colors.white);
    }
  }
}

double density(double d) {
  double height = MediaQuery.of(Context).size.width;
  double value = d * (height / 384);
  return value;
}
