

import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_project/models/commentmodels.dart';
import 'package:flutter_project/models/items_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class PostNotifier extends StateNotifier<List<Post>>{
  PostNotifier(): super([]){
    fetchPosts();
  }

  
  Future<void> fetchPosts() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:3003/items'));
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        List<dynamic> postJson = json.decode(response.body);
        state = postJson.map((json) => Post.fromJson(json)).toList();
      } else {
        print('Failed to load posts: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching posts: $e');
    }
  }


Future<void> createPost(String description, Uint8List imageData) async {
    var uri = Uri.parse('http://localhost:3003/items');
    var request = http.MultipartRequest('POST', uri)
      ..fields['description'] = description
      ..files.add(http.MultipartFile.fromBytes(
        'picture', // Ensure this field matches the name expected by your NestJS backend
        imageData,
        filename: 'upload.jpg', // Optional, you can provide filename based on your requirement
      ));

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        print('Post created successfully!');
        fetchPosts(); // Optionally fetch posts again to update the list
      } else {
        print('Failed to create post: ${response.statusCode}');
      }
    } catch (e) {
      print('Error creating post: $e');
    }
  }



  void editPost(String id, String newDescription) {
  state = state.map((post) {
    if (post.id == id) {
      // Create a new Post instance with updated description
      return Post(id: post.id, description: newDescription, image: post.image, comments: post.comments);
    }
    return post;
  }).toList();
  // Ensure the state update is propagated by explicitly setting the state
  state = [...state];
}


  void deletepost(String id){
    state = state.where((post) => post.id != id).toList();
  }

  void addCommentToPost(String postId, Comment comment) {
    state = state.map((post) {
      if (post.id == postId) {
        return Post(
          id: post.id,
          image: post.image,
          description: post.description,
          comments: [...post.comments, comment],
        );
      }
      return post;
    }).toList();
  }

}


final postprovider = StateNotifierProvider<PostNotifier,List<Post>>((ref) {
  return PostNotifier();
});

