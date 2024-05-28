import 'package:flutter/material.dart';
import 'package:flutter_project/models/commentmodels.dart';
import 'package:flutter_project/models/items_model.dart'; // Includes your Post and Comment models
import 'package:flutter_project/providers/itemproviders.dart'; // Includes your postProvider
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentPage extends ConsumerWidget {
  final String postId; // Assume the post ID is passed to this widget

  CommentPage({required this.postId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final post = ref.watch(postprovider.select((value) => 
      value.firstWhere((p) => p.id == postId, orElse: () => Post(id: postId, image: '', description: '', comments: []))
    )); // Find the post by ID

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Text('Comments'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: post.comments.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(post.comments[index].userId, style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(post.comments[index].content),
                );
              },
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CustomCommentBox(
              labelText: 'Add a comment...',
              errorText: 'Please enter a comment',
              sendButtonMethod: (commentText) {
                if (commentText.trim().isNotEmpty) {
                  ref.read(postprovider.notifier).addCommentToPost(postId, Comment(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    userId: 'User', // Example user ID, replace as needed
                    content: commentText,
                    timestamp: DateTime.now(),
                  ));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCommentBox extends StatelessWidget {
  final String labelText;
  final String errorText;
  final Function(String) sendButtonMethod;

  CustomCommentBox({
    required this.labelText,
    required this.errorText,
    required this.sendButtonMethod,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController commentController = TextEditingController();

    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: commentController,
            decoration: InputDecoration(
              labelText: labelText,
              border: OutlineInputBorder(),
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.send, color: Colors.blue),
          onPressed: () {
            sendButtonMethod(commentController.text);
            commentController.clear();
          },
        ),
      ],
    );
  }
}
