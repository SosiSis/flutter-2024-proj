import 'package:flutter_project/models/commentmodels.dart';
import 'package:flutter_project/models/items_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostNotifier extends StateNotifier<List<Post>> {
  PostNotifier() : super([]);

  void addPost(Post post) {
    state = [...state, post];
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

  // Methods to update or delete posts and comments as needed
}
