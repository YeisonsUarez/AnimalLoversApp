import 'package:carouserl_inicio/settings/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'messages/chat_bubble.dart';

FirebaseUser loggedInUser;

class ChatScreen extends StatefulWidget {
  static String routeName = "/chat";
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final _fstore = Firestore.instance;
  final controller = new TextEditingController();

  String message;

  void getCurrUser() async {
    try {
      FirebaseUser user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Chat grupal",
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: MessageStream(),
            ),
            Container(
              decoration: kMessageDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: controller,
                      textCapitalization: TextCapitalization.sentences,
                      onChanged: (value) {
                        
                        message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  FlatButton(
                    onPressed: () {
                      controller.clear();
                      FocusScope.of(context).unfocus();
                      _fstore.collection('messages').add({
                        'senderName': "Lisseth",
                        'text': message,
                        'time': DateTime.now(),
                        'senderEmail': loggedInUser.email,
                      });
                    },
                    child: Icon(
                      Icons.send,
                      color: kPrimaryColor
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  final _fstore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _fstore.collection('messages').orderBy('time').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            !snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final messageStream = snapshot.data.documents;
        return ListView.builder(
          itemCount: messageStream.length,
          itemBuilder: (context, itemIndex) {
            return ChatBubble(
              isMe: (messageStream[itemIndex]['senderEmail'] ==
                  loggedInUser.email),
              senderName: messageStream[itemIndex]['senderEmail'],
              text: messageStream[itemIndex]['text'],
            );
          },
        );
      },
    );
  }
}
