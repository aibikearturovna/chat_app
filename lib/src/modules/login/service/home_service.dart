import 'package:chat_app/src/data/message_m.dart';
import 'package:chat_app/src/service/user_manage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeService {
  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await userMan.removeuid();
  }

  static Future<void> delete() async {
    await FirebaseAuth.instance.currentUser!.delete();
    await userMan.removeuid();
  }

  static Future<dynamic> sendMessages(String sms) async {
    final sender = FirebaseAuth.instance.currentUser;
    if (sender != null) {
      final db = FirebaseFirestore.instance;
      final Message message =
          Message(sender: sender.email!, sms: sms, dateTime: DateTime.now());
      await db.collection('message').add(message.toJson());
    }
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> streamMessage() {
    final db = FirebaseFirestore.instance;
    return db
        .collection('message')
        .orderBy('dateTime', descending: true)
        .snapshots();
  }
}
