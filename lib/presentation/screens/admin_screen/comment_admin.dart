import 'package:flutter/material.dart';

class AdminCommentPage extends StatefulWidget {
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<AdminCommentPage> {
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
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
          child: ListTile(
            title: Row(
              children: [
                Text(
                  data[index]['name']!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      filedata.removeAt(index);
                    });
                  },
                ),
              ],
            ),
            subtitle: Text(data[index]['message']!),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comment Page"),
        backgroundColor: Colors.blue[300],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: commentChild(filedata),
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
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 7, vertical: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ],
        ),
      ),
    );
  }
}
