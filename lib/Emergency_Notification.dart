import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:push_notification_poc/services/database.dart';


void createRecord() async {
  await DatabaseService().notificationCollection;
}

class Emergency_Notification extends StatefulWidget {
  @override
  _Emergency_NotificationState createState() => _Emergency_NotificationState();
}

class _Emergency_NotificationState extends State<Emergency_Notification> {
  String _notificationCategory;
  String _notificationContent;

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: true,
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          "EMERGENCY NOTIFICATION",
          style: TextStyle(
              color: Colors.blue,
              fontSize: 24.0,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 10.0,
            ),
            Text("NOTIFICATION CATEGORY"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoTextField(
                controller: controller1,
                maxLines: 1,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(244, 242, 246, 1),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                onChanged: (value){
                  _notificationCategory = value;
                },
              ),
            ),
            Text("NOTIFICATION CONTENT"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoTextField(
                controller: controller2,
                maxLines: 5,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(244, 242, 246, 1),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                onChanged: (value){
                  _notificationContent = value;
                },
              ),
            ),
            FlatButton(
              color: Colors.blue,
              child: Text(
                  "SEND NOTIFICATION"
              ),
              onPressed: (){
                //create a new document for the notfication
                print(_notificationCategory);
                print(_notificationContent);
              },
            ),
          ],
        ),
      ),
    );
  }
}
