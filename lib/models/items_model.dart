import 'dart:typed_data'; // Import this at the top of your file

import 'package:flutter_project/models/commentmodels.dart';

class Post {
  final String id;
  final String description;
  final Uint8List image;
  List<Comment> comments;

  Post({
    required this.id,
    required this.description,
    required this.image,
    List<Comment>? comments,
  }) : this.comments = comments ?? [];

  factory Post.fromJson(Map<String, dynamic> json) {
    List<Comment> comments = [];
    if (json['comments'] != null) {
      comments = (json['comments'] as List)
          .map((commentJson) => Comment.fromJson(commentJson))
          .cast<Comment>()
          .toList();
    }

    Uint8List image = Uint8List(0);
    if (json['picture'] != null && json['picture']['data'] != null) {
      image = Uint8List.fromList(List<int>.from(json['picture']['data']));
    }

    return Post(
      id: json['_id'],
      description: json['description'],
      image: image,
      comments: comments,
    );
  }
}
