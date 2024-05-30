import 'dart:typed_data';

import 'package:flutter_project/models/items_model.dart';


abstract class PostRepository {
  Future<List<Post>> fetchPosts();
  Future<void> createPost(String description, Uint8List imageData);
  Future<void> updatePost(String postId, String newDescription);
  Future<void> deletePost(String postId);
  Future<Post> getPostById(String postId);
}
