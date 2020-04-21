import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Event_Notificaton.dart';
import 'Emergency_Notification.dart';
import 'package:path/path.dart';

void main(){
  runApp(
    CupertinoApp(
      initialRoute: '/',
      routes: {
        '/first': (context) => Event_Notification(),
        //'/second': (context) => Emergency_Notification()
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

  int sharedValue=0;

  final Map<int, Widget> tabs = const<int, Widget>{
    0: Text('Notifications'),
    1: Text('Draft'),
  };

  final Map<int, Widget> pages = const<int, Widget>{};

  FlatButton ButtonMaker (String message, String RouteName) {
   return FlatButton(
     color: Colors.white,
     child: Row(
       children: <Widget>[
         Icon(Icons.ac_unit),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text(
             message,
             style: TextStyle(
               color: Color.fromRGBO(37, 8, 86, 1),
               fontSize: 16.0
             ),
           ),
         ),
       ],
     ),
     onPressed: (){
       print("button was clicked");
       Navigator.pushNamed(this.context, RouteName);
     },
   ); 
  }

  Column buildBody(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Category",
            style: TextStyle(
                color: const Color.fromRGBO(37, 8, 86, 1),
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ButtonMaker("EVENT NOTIFICATION", "/first"),
            ButtonMaker("EMERGENCY NOTIFICATION", "/first"),
            ButtonMaker("LIFE OR DEATH NOTIFCATION", "first")
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: true,
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          "NOTIFICATION",
          style: TextStyle(
              color: Colors.blue,
              fontSize: 24.0,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoSegmentedControl<int>(
                children: tabs,
                onValueChanged: (int val){
                  setState(() {
                    sharedValue = val;
                  });
                },
                groupValue: sharedValue,
              ),
            ),
            buildBody(),
          ],
        )
      ),
    );
  }
}
