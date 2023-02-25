import 'package:diversify/common/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _messageController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  User? _loggedInUser;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  void _getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        _loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  void _sendMessage() async {
    try {
      await _firestore.collection('messages').add({
        'text': _messageController.text,
        'sender': _loggedInUser?.email,
        'timestamp': DateTime.now(),
      });
      _messageController.clear();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: _firestore
                .collection('messages')
                .orderBy('timestamp')
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final messages = snapshot.data!.docs.reversed;
              List<MessageBubble> messageBubbles = [];
              for (var message in messages) {
                final messageText = message.get('text');
                final messageSender = message.get('sender');
                final currentUser = _loggedInUser?.email;
                final messageBubble = MessageBubble(
                  text: messageText,
                  sender: messageSender,
                  isMe: currentUser == messageSender,
                );
                messageBubbles.add(messageBubble);
              }
              return Expanded(
                child: ListView(
                  reverse: true,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                  children: messageBubbles,
                ),
              );
            },
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Enter your message...',
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: _sendMessage,
                  child: Text(
                    'Send',
                    style: TextStyle(
                      color: Colors.green[800],
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String text;
  final String? sender;
  final bool isMe;

  MessageBubble({required this.text, required this.sender, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender ?? '',
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.grey[600],
            ),
          ),
          Material(
            borderRadius: BorderRadius.only(
              topLeft: isMe ? Radius.circular(30.0) : Radius.zero,
              topRight: isMe ? Radius.zero : Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
            elevation: 5.0,
            color: isMe ? Colors.lightGreen : Colors.green[400],
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 15.0,
                  color: isMe ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
