import 'package:flutter/material.dart';
import 'package:kpi/pages/info_page.dart';
import 'package:kpi/pages/setting_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = 'Flutter';
  int age = 20;
  double height = 160.0;
  bool isSuccess = true;
  List fruits = ['Apple', 'Mango', 'Banana']; // array
  Map fruit = {'Apple': 'red', 'Banana': 'Yellow'}; // object

  void showMessage() {
    print('Hello world!!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ตัวชี้วัด'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SettingPage(),
                        fullscreenDialog: true));
              }),
          IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InfoPage()));
              }),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
//        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 100.0,
            color: Colors.red,
          ),
          Container(
            height: 100.0,
            color: Colors.green,
          ),
          Container(
            height: 100.0,
            color: Colors.blue,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  height: 100.0,
                  color: Colors.red,
                ),
              ),
              Expanded(
                child: Container(
                  height: 100.0,
                  color: Colors.green,
                ),
              ),
              Expanded(
                child: Container(
                  height: 100.0,
                  color: Colors.blue,
                ),
              ),
            ],
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Color(0xff344955),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.dashboard,
                        color: Colors.white,
                      ),
                      onPressed: () {}),
                ],
              ),
              Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.star,
                        color: Colors.white,
                      ),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                      onPressed: () {}),
                ],
              )
            ],
          )),
    );
  }

  showAlert() {
    Person person = Person('Flutter');
    person.showName();
  }
}

class Person {
  String name;
  Person(this.name);

  showName() {
    print('Hello, $name');
  }
}
