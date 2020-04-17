import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Event_Notificaton.dart';
import 'package:path/path.dart';

void main(){
  runApp(
    CupertinoApp(
      initialRoute: '/',
      routes: {
        '/first': (context) => Event_Notification()
      },
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        child: Container(
          child: SafeArea(
            child: Push_Notification(),
          ),
        ),
      ),
    )
  );
}

class Push_Notification extends StatefulWidget {
  @override
  _Push_NotificationState createState() => _Push_NotificationState();
}



class _Push_NotificationState extends State<Push_Notification> {
  
  FlatButton ButtonMaker (String message) {
   return FlatButton(
     color: Colors.lightBlue,
     child: Text(
       message,
     ),
     onPressed: (){
       print("button was clicked");
       Navigator.pushNamed(this.context, '/first');
     },
   ); 
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: <Widget>[
            ButtonMaker("EVENT NOTIFICATION"),
            ButtonMaker("EMERGENCY NOTIFICATION"),
            ButtonMaker("LIFE OR DEATH NOTIFCATION")
          ],
        ),
      ),
    );
  }
}
