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
    data =data.isNotEmpty? data:ModalRoute.of(context).settings.arguments;
    print('this is the data $data');
    String bgImage = data['dayTime'] ? 'day2.jpg' : 'night2.jpg';
    Color bgColor = data['dayTime'] ? Colors.blue : Colors.indigo[700];
    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
            child: Container(

              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/$bgImage"),
                  fit: BoxFit.cover,
                ),
              ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(children: <Widget>[
              SizedBox(height: 20.0),
              FlatButton.icon(
                  onPressed: () async {
                    dynamic result=await Navigator.of(context).pushNamed('/location');
                    setState(() {

                      data={
                      'location':result['location'],
                      'time':result['time'],
                      'flag':result['flag'],
                      'dayTime':result['dayTime']
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(color: Colors.grey[300]),
                  )),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(fontSize: 28.0, letterSpacing: 2.0,color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 66.0,
                  color: Colors.white
                ),
              )
            ]),
          ),
        )));
  }
}
