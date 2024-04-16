import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';

class CommentPage extends StatefulWidget {
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List<Map<String, String>> filedata = [
    {
      'name': 'Nahusenay',
      'message':
          "Thank you for posting! I lost my keys near the park yesterday. Could you please describe any unique features of the key? I can confirm if it's mine.",
    },
    {
      'name': 'Liya Abebe',
      'message': 'Very cool',
    },
    {
      'name': 'Abel Daniel',
      'message': 'Do the keys have ',
    },
    {
      'name': 'Dagmawi Elias',
      'message': 'Your phone is not working how can I contact you',
    },
  ];

  final commentFieldKey = GlobalKey<FormState>();
  final commentTextFieldController = TextEditingController();

  Widget commentChild(List<Map<String, String>> data) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
                child: ListTile(
                  title: Text(
                    data[index]['name']!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(data[index]['message']!),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(9.0),
          child: Form(
            key: commentFieldKey,
            child: TextFormField(
              controller: commentTextFieldController,
              decoration: const InputDecoration(
                labelText: 'Add a comment',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a comment';
                }
                return null;
              },
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (commentFieldKey.currentState!.validate()) {
              setState(() {
                var value = {
                  'name': 'New User',
                  'message': commentTextFieldController.text,
                };
                filedata.insert(0, value);
              });
              commentTextFieldController.clear();
              FocusScope.of(context).unfocus();
            }
          },
          child: const Text('Add Comment'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comment Page"),
        backgroundColor: Color.fromARGB(255, 34, 91, 213),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: CommentBox(
            child: commentChild(filedata),
            labelText: 'Write a comment...',
            errorText: 'Comment cannot be blank',
            withBorder: false,
            sendButtonMethod: () {
              if (formKey.currentState!.validate()) {
                setState(() {
                  var value = {
                    'name': 'New User',
                    'message': commentController.text,
                  };
                  filedata.insert(0, value);
                });
                commentController.clear();
                FocusScope.of(context).unfocus();
              } else {
                print("Not validated");
              }
            },
            formKey: formKey,
            commentController: commentController,
            backgroundColor: Color.fromARGB(255, 59, 77, 154),
            textColor: Colors.white,
            sendWidget:
                const Icon(Icons.send_sharp, size: 30, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
