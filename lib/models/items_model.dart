import 'package:flutter_project/models/commentmodels.dart';

class Post{
  Post({required this.id,  required this.description, required this.image,List<Comment>? comments})
  : this.comments = comments ?? [];


  factory Post.fromJson(Map<String, dynamic> json) {
  List<Comment> comments = [];
  if (json['comments'] != null) {
    comments = (json['comments'] as List)
        .map((commentJson) => Comment.fromJson(commentJson))
        .cast<Comment>()
        .toList();
  }
  return Post(
    id: json['_id'],
    description: json['description'],
    image: json['picture'] != null ? json['picture']['data'].toString() : '',
    comments: comments,
  );
}


  void addcomment(Comment comment){
    comments.add(comment);
  }


  final String id;
  final String description;
  final String image;
  List<Comment> comments;


}