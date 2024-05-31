// comment_model.dart
class Comment {
  final String id;
  final String postId;
  final String content;
  final DateTime createdAt;

  Comment({
    required this.id,
    required this.postId,
    required this.content,
    required this.createdAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
  return Comment(
    id: json['_id'] ?? '', // Provide a default value in case of null
    postId: json['postId'] ?? '', // Provide a default value in case of null
    content: json['content'] ?? '', // Provide a default value in case of null
    createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : DateTime.now(), // Handle null with a current timestamp
  );
}


  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'content': content,
    };
  }
}
