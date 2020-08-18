import 'package:flutter/material.dart';

import 'package:random_design/houses.dart';

import 'package:random_design/select_date.dart';

class LonKate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: null,
              )
            ],
          ),
        ],
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20.0, left: 25.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Choose date',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: ButtonTheme(
                    minWidth: 44.0,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        'July',
                        style:
                            TextStyle(fontSize: 15.0, color: Colors.grey[600]),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                        side: BorderSide(
                          color: Colors.grey[200],
                          style: BorderStyle.solid,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 60.0,
              child: ListView(
                key: Key('listviews'),
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(right: 5.0),
                children: <Widget>[
                  SelectDateScreen(date: 'today'),
                  SelectDateScreen(date: '10'),
                  SelectDateScreen(date: '11'),
                  SelectDateScreen(date: '13'),
                  SelectDateScreen(date: '19'),
                  SelectDateScreen(date: '17'),
                  SelectDateScreen(date: '31'),
                  SelectDateScreen(date: '6'),
                  SelectDateScreen(date: '4'),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.only(bottom: 10.0),
                children: [
                  Houses(
                    houseImage: "assets/red.png",
                    housePrice: '80\$ - 100\$',
                    houseType: 'A-frame',
                    index: 0,
                  ),
                  Houses(
                    houseImage: "assets/flutter_logo.png",
                    housePrice: '70\$ - 150\$',
                    houseType: 'Cattage',
                    index: 1,
                  ),
                  Houses(
                    houseImage: "assets/red.png",
                    housePrice: '50 - 100\$',
                    houseType: 'Villa',
                    index: 2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
