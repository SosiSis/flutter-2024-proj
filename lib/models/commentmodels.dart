class Comment {
  final String id;
  final String userId;
  final String content;
  final DateTime timestamp;

  Comment({
    required this.id,
    required this.userId,
    required this.content,
    required this.timestamp,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      userId: json['userId'],
      content: json['content'],
      timestamp: DateTime.parse(json['timestamp'])
      
    );
  }

  
}