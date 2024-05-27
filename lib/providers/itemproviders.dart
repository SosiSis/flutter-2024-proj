

import 'package:flutter_project/models/items_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostNotifier extends StateNotifier<List<Post>>{
  PostNotifier(): super([]);

  void addpost(String id , String description, String image){
    final NewPost = Post(id: id, description: description, image: image);
    state=[...state,NewPost];
  }

  void editPost(String id, String newdescription){
    state=  state.map((post){
      return post.id == id ? Post(id: post.id , description: newdescription, image: post.image):post;

    }).toList();
  }

  void deletepost(String id){
    state = state.where((post) => post.id != id).toList();
  }

}

final postprovider = StateNotifierProvider<PostNotifier,List<Post>>((ref) {
  return PostNotifier();
});

