import 'package:flutter/material.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}


class _ChooseLocationState extends State<ChooseLocation> {
  void getDate() async{
//    simulate network request for the user name
       String fname=await Future.delayed(Duration(seconds: 3),(){
      return 'yared';
    });
      String lname=await Future.delayed(Duration(seconds: 2),(){
        return 'solomon';
       });
    print("This is the name of tha greate person");
    print('Loading...');
    print('$fname $lname');

  }

  int counter=0;
  @override
  void initState() {
    // TODO: implement initState
    print("init function is run");
    getDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    print("build function is run");
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
      ),
      body: RaisedButton(
        onPressed: (){
          setState(() {
            counter++;
          });
        },
        child: Text('Counter is $counter'),

      ),

    );
  }
}

