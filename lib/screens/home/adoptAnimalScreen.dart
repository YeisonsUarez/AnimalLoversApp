import 'package:carouserl_inicio/models/animal.dart';
import 'package:carouserl_inicio/screens/optionsMenu/forum/messages/chat_bubble.dart';
import 'package:carouserl_inicio/settings/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseUser loggedInUser;
String emailUserAnimal;

class AdoptAnimalScreen extends StatefulWidget {
  static final String routeName = "/adopt";
  @override
  _AdoptAnimalScreenState createState() => _AdoptAnimalScreenState();
}

class _AdoptAnimalScreenState extends State<AdoptAnimalScreen> {
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
    final Animal animal = ModalRoute.of(context).settings.arguments;
    emailUserAnimal = animal.user.email;
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
          "Chat con el titular",
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Positioned(
              left: 10,
              top: 70,
              right: 10,
              bottom: 70,
              child: Container(
                color: Colors.blue,
              ),
            ),
            Expanded(
              child: MessagePrivate(),
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
                      _fstore
                          .collection('messages' +
                              animal.user.email +
                              loggedInUser.email)
                          .add({
                        'senderName': loggedInUser.email,
                        'text': message,
                        'time': DateTime.now(),
                        'senderEmail': loggedInUser.email,
                      });
                    },
                    child: Icon(Icons.send, color: kPrimaryColor),
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

class MessagePrivate extends StatelessWidget {
  final _fstore = Firestore.instance;
  //String emailUserAnimal;
  //MessagePrivate({this.emailUserAnimal})
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _fstore
          .collection('messages$emailUserAnimal${loggedInUser.email}')
          .orderBy('time')
          .snapshots(),
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
              senderName: loggedInUser.email,
              text: messageStream[itemIndex]['text'],
            );
          },
        );
      },
    );
  }
}
