// comment_notifier.dart
import 'package:flutter_project/models/commentmodels.dart';
import 'package:flutter_project/repositories/comment_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentNotifier extends StateNotifier<List<Comment>> {
  final CommentRepository commentRepository;

  CommentNotifier(this.commentRepository) : super([]);

  Future<void> fetchComments(String postId) async {
    try {
      final comments = await commentRepository.fetchComments(postId);
      state = comments;
    } catch (e) {
      print('Error fetching comments: $e');
    }
  }

  Future<void> addComment(String postId, String userId, String content) async {
    try {
      await commentRepository.addComment(postId, userId, content);
      // Fetch the updated list of comments after adding a new one
      await fetchComments(postId);
    } catch (e) {
      print('Error adding comment: $e');
    }
  }
}
