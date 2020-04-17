import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;

  DatabaseService({ this.uid});

  //collection reference
  final CollectionReference notificationCollection = Firestore.instance.collection('notifications');

  Future updateNotifationData(String notificationCategory, String notificationContent) async {
    return await notificationCollection.document(uid).setData({
      'notifcationCategory': notificationCategory,
      'notificationContent': notificationContent,
    });
  }
}