import 'package:flutter/material.dart';
Map<String, List<String>> chatMessages = {};


class ChatPage extends StatefulWidget {
  final String creatorId; // Identifier for the creator

  const ChatPage({super.key, required this.creatorId});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController messageController = TextEditingController();

  void sendMessage() {
    setState(() {
      final message = messageController.text;
      if (message.isNotEmpty) {
        final messages = chatMessages.putIfAbsent(widget.creatorId, () => []);
        messages.add(message);
        messageController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final messages = chatMessages[widget.creatorId] ?? []; // Get messages for this creator

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Chat'),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // More button action
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Align(
                    alignment: index % 2 == 0 ? Alignment.centerLeft : Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                      decoration: BoxDecoration(
                        color: index % 2 == 0 ? Colors.grey : Colors.red,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Text(
                        messages[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Type a message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.red,
                  child: IconButton(
                    iconSize: 28,
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }
}
