import 'package:flutter/material.dart';

class Chatscreen extends StatelessWidget {
  const Chatscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.teal,
        titleSpacing: 0,
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(   "https://randomuser.me/api/portraits/men/32.jpg"),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Dhruv Patel",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                    ),
                ),
                Text(
                    "online",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white70
                  ),
                )
              ],
            )
          ],
        ),
        actions: const[
          Icon(Icons.video_call, size: 24,),
          const SizedBox(width: 20,),
          Icon(Icons.call, size: 20,),
          const SizedBox(width: 10),
        ],
      ),

      body: Column(
        children: [
           Expanded(
               child: ListView(
                 padding: EdgeInsets.all(12),
                 children: [
                   NewChat(message: "Hey!", isMe: true),
                   NewChat(message: "Hi, how are you?", isMe: false),
                    NewChat(message: "I'm good. Working on Flutter 🚀", isMe: true),
                    NewChat(message: "Wow that's great 👌", isMe: false),
                    NewChat(message: "Yes, learning BLoC too!", isMe: true),
                 ],
               )
           ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                       decoration: InputDecoration(
                         hintText: "Type a message",
                         filled: true,
                         fillColor: Colors.grey[100],
                         contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(30),
                           borderSide: BorderSide.none,
                         ),
                       ),

                    )
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: Colors.teal,
                  child: IconButton(
                    icon: const Icon(Icons.mic, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NewChat extends StatelessWidget{
  final String message;
  final bool isMe;

  NewChat({super.key, required this.message, required this.isMe});


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isMe? Colors.teal : Colors.grey[300],
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft:  isMe ? const Radius.circular(16): const Radius.circular(0),
            bottomRight: isMe ? const Radius.circular(0): const Radius.circular(16)
          )
        ),
        child: Text(
          message,

        ),
      ),
    );
  }
}
