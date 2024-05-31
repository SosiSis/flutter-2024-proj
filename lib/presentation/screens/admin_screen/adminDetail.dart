import 'package:flutter/material.dart';
import 'package:flutter_project/models/items_model.dart'; // Make sure this contains the Post model
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


class AdminDetailPage extends ConsumerStatefulWidget {
  final Post item;

  AdminDetailPage({required this.item});

  @override
  _AdminDetailPageState createState() => _AdminDetailPageState();
}

class _AdminDetailPageState extends ConsumerState<AdminDetailPage> {
  late TextEditingController _descriptionController;
  bool _isEditing = false;

@override
void initState() {
  super.initState();
  _descriptionController = TextEditingController();
}

@override
void didChangeDependencies() {
  super.didChangeDependencies();
  _descriptionController.text = widget.item.description; // Set text here to avoid overriding during rebuilds
}


  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Text('Item Details', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19, color: Colors.white)),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
  
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 300,
              child: Hero(
                tag: 'postImage${widget.item.image}',
                child: Image.memory(widget.item.image, fit: BoxFit.fitWidth),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: _isEditing
                  ? TextField(
                      controller: _descriptionController,
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: "Edit Description",
                        border: OutlineInputBorder(),
                      ),
                    )
                  : Text(
                      widget.item.description,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
            ),

            Row(
              children: [
                IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => {}
            // _editPost(context, ref, widget.item.id),
                ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => _deletePost(context, ref, widget.item.id),
          ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _deletePost(BuildContext context, WidgetRef ref, String postId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text('Are you sure you want to delete this post?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () => context.pop(),
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                // ref.read(postProvider.notifier).deletePost(postId);
                context.pop();
                context.pop(); // Also close the detail page
              },
            ),
          ],
        );
      },
    );
  }
}
