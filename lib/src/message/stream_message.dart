import 'package:chat_app/src/constants/colors.dart';
import 'package:chat_app/src/data/message_m.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StreamMessage extends StatelessWidget {
  const StreamMessage(
    this.streamMessage, {
    super.key,
  });

  final Stream<QuerySnapshot<Map<String, dynamic>>> streamMessage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        // color: AppColors.purple,
        child: StreamBuilder(
          stream: streamMessage,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              final message = (snapshot.data.docs.reversed as Iterable)
                  .map(
                    (e) => Message.fromJson(e.data())
                      ..isMy = e.data()['sender'] ==
                          FirebaseAuth.instance.currentUser?.email,
                  )
                  .toList();
              return ListView(
                children: message.map((e) => MessagesWidg(e)).toList(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class MessagesWidg extends StatelessWidget {
  const MessagesWidg(
    this.message, {
    super.key,
  });

  final Message message;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        !message.isMy! ? 10 : width / 2,
        5,
        message.isMy! ? 10 : width / 2,
        5,
      ),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(23),
            topRight: const Radius.circular(23),
            bottomLeft: message.isMy!
                ? const Radius.circular(23)
                : const Radius.circular(0),
            bottomRight: !message.isMy!
                ? const Radius.circular(23)
                : const Radius.circular(0),
          ),
        ),
        color: message.isMy! ? AppColors.purple : AppColors.pink,
        shadowColor: Colors.black,
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              !message.isMy!
                  ? Row(
                      children: [
                        Text(message.sender),
                      ],
                    )
                  : const SizedBox(),
              // const SizedBox(height: 2),
              Text(
                message.sms,
                style: const TextStyle(fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    DateFormat('dd/MM/yy (hh:mm)').format(message.dateTime),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
