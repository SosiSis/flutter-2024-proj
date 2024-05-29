

import 'dart:typed_data';

import 'package:flutter_project/models/commentmodels.dart';
import 'package:flutter_project/models/items_model.dart';
import 'package:flutter_project/repositories/api_post_repository.dart';
import 'package:flutter_project/repositories/post_repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostNotifier extends StateNotifier<List<Post>>{
  final PostRepository repository;

  PostNotifier(this.repository): super([]){
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      state = await repository.fetchPosts();
    } catch (e) {
      print('Error fetching posts: $e');
    }
  }

  Future<void> createPost(String description, Uint8List imageData) async {
    try {
      await repository.createPost(description, imageData);
      fetchPosts(); // Refresh the list after adding a new post
    } catch (e) {
      print('Error creating post: $e');
    }
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

final postRepositoryProvider = Provider<PostRepository>((ref) {
  return ApiPostRepository();
});

final postProvider = StateNotifierProvider<PostNotifier, List<Post>>((ref) {
  return PostNotifier(ref.watch(postRepositoryProvider));
});


