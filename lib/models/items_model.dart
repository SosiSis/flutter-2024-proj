import 'package:flutter_project/models/commentmodels.dart';

class Post{
  Post({required this.id,  required this.description, required this.image,List<Comment>? comments})
  : this.comments = comments ?? [];


  void addcomment(Comment comment){
    comments.add(comment);
  }


  final String id;
  final String description;
  final String image;
  List<Comment> comments;


}