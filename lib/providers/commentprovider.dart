// providers.dart
import 'package:flutter_project/models/commentmodels.dart';
import 'package:flutter_project/providers/comment_notifier.dart';
import 'package:flutter_project/repositories/comment_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// Comment Repository Provider
final commentRepositoryProvider = Provider<CommentRepository>((ref) {
  return CommentRepository("http://localhost:3003"); // Adjust your URL
});

// Comment Notifier Provider
final commentNotifierProvider = StateNotifierProvider<CommentNotifier, List<Comment>>((ref) {
  final repository = ref.watch(commentRepositoryProvider);
  return CommentNotifier(repository);
});
