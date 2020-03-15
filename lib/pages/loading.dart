import 'package:flutter/material.dart';
import 'package:worldtime/service/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time='Loading ...';
  void setUpTime() async{
    WorldTime instance=WorldTime(location: 'Berline',flag: 'germany.png',url: 'Europe/Berlin');
    await instance.getTime();
    print(instance.time);
    setState(() {
      time=instance.time;

    });
    Navigator.pushNamed(context, '/home',arguments: {
      'location':instance.location,
      'time':instance.time,
      'flag':instance.flag,
      'dayTime':instance.daytime
    });

  }


  @override
  void initState() {
    print('this is the init method');
    super.initState();
    setUpTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],

      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SpinKitCircle(
              color: Colors.white,

            ),
            Text('Loading...',
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ],
        )


      )
    );
  }
}
