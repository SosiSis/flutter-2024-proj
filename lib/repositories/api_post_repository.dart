import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_project/models/items_model.dart';
import 'package:flutter_project/repositories/post_repositories.dart';
import 'package:http/http.dart' as http;


class ApiPostRepository implements PostRepository {
  final String baseUrl = 'http://localhost:3003/items';

  @override
  Future<List<Post>> fetchPosts() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => Post.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      throw Exception('Error fetching posts: $e');
    }
  }

  @override
  Future<void> createPost(String description, Uint8List imageData) async {
    var request = http.MultipartRequest('POST', Uri.parse(baseUrl))
      ..fields['description'] = description
      ..files.add(http.MultipartFile.fromBytes(
        'picture', 
        imageData,
        filename: 'upload.jpg',
      ));
    var response = await request.send();
    if (response.statusCode != 200) {
      throw Exception('Failed to create post');
    }
  }

  @override
  Future<void> updatePost(String postId, String newDescription) async {
    var response = await http.patch(Uri.parse('$baseUrl/$postId'), 
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'description': newDescription}),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update post');
    }
  }

  @override
  Future<void> deletePost(String postId) async {
    var response = await http.delete(Uri.parse('$baseUrl/$postId'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete post');
    }
  }
}
