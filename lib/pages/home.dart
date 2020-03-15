import 'package:flutter/material.dart';
import 'package:worldtime/pages/choose_location.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    print('this is the data $data');
    String bgImage = data['dayTime'] ? 'day.png' : 'night.png';
    return Scaffold(
        body: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                image:DecorationImage(
                  image: AssetImage('assets/day.png'),
                      fit: BoxFit.cover
                ),



              ),
              child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
      child: Column(children: <Widget>[
        SizedBox(height: 20.0),
        FlatButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamed('/location');
              },
              icon: Icon(Icons.edit_location),
              label: Text('Edit Location')),
        SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              Text(
                data['location'],
                style: TextStyle(fontSize: 28.0, letterSpacing: 2.0),
              ),
          ],
        ),
        SizedBox(height: 20.0),
        Text(
          data['time'],
          style: TextStyle(
              fontSize: 66.0,
          ),
        )
      ]),
    ),
            )));
  }
}
