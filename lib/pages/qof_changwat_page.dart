import 'dart:async';
import 'dart:convert';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:flutter/material.dart';
import 'package:kpi/api_provider.dart';

class QofChangwatPage extends StatefulWidget {
  String qofId;
  String qofName;

  QofChangwatPage(this.qofId, this.qofName);

  @override
  _QofChangwatPageState createState() => _QofChangwatPageState();
}

class _QofChangwatPageState extends State<QofChangwatPage> {
  List items = [];
  bool isLoading = true;

  ApiProvider apiProvider = ApiProvider();

  Future fetchQof() async {
    try {
      var response = await apiProvider.getQofChw(widget.qofId);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print(jsonResponse);
        setState(() {
          isLoading = false;
          items = jsonResponse;
        });
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchQof();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ภาพรวมจังหวัด'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'ตัวชี้วัดคุณภาพการให้บริการ (QOF)',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      var item = items[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 5.0,
                          right: 5.0,
                          top: 5.0,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: ListTile(
                            onTap: () {
//                              Navigator.of(context).push(MaterialPageRoute(
//                                  builder: (context) => QofChangwatPage(
//                                      item['id'], item['name'])));
                            },
                            title: Text(
                              item['changwatname'],
                              style: TextStyle(fontSize: 20.0),
                            ),
                            subtitle: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      ' ${item['target']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.teal),
                                    ),
                                    Text(' / '),
                                    Text(
                                      ' ${item['result']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepOrange),
                                    ),
                                  ],
                                ),
                                LinearPercentIndicator(
                                  width: 160.0,
                                  lineHeight: 5.0,
                                  percent: double.parse(item['pers']) / 100,
                                  backgroundColor: Colors.orange,
                                  progressColor: Colors.green,
                                )
                              ],
                            ),
                            trailing: Icon(Icons.keyboard_arrow_right),
                            leading: CircularPercentIndicator(
                              radius: 45.0,
                              lineWidth: 3.0,
                              percent: double.parse(item['pers']) / 100,
                              center: new Text(
                                "${item['pers']}",
                                style: TextStyle(fontSize: 12.0),
                              ),
                              progressColor: Colors.green,
                              backgroundColor: Colors.orange,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: items != null ? items.length : 0,
                  ),
          )
        ],
      ),
    );
  }
}
