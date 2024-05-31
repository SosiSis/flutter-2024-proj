
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_project/models/items_model.dart';
import 'package:flutter_project/providers/itemproviders.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class NoAccount extends ConsumerWidget {


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final posts = ref.watch(postProvider);

    return Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
        backgroundColor: Colors.blue[300],
        actions: [

          // *********************    navigation to the login page here
            TextButton(
              onPressed: (){
                context.push('/login');
                
              },
              child:
                Container(


                  margin: EdgeInsets.symmetric(horizontal: 17),
                  child: Text(
                    'Log In',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        letterSpacing: 1.3),
                  ),
                ))

        ]
      ),
        body: Padding(padding: EdgeInsets.all(10),
        
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 33,
          children: List.generate(posts.length, (index) {
            return GridItem(
              item: posts[index],

            );
          }),
        ),)
      );


  }
}

class Item {
  final String imageUrl;

  Item({required this.imageUrl});
}

class GridItem extends StatelessWidget {
  final Post item;

  GridItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 7),
          Expanded(
            
            child: Image.memory(
              item.image,
              fit: BoxFit.fitWidth,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: () {
                context.push('/login');
              }, icon: Icon(Icons.read_more),style: ButtonStyle(iconColor: MaterialStatePropertyAll(Colors.blue)),),

              IconButton(onPressed: () {
                context.push('/login');
              }, icon: Icon(Icons.comment),style: ButtonStyle(iconColor: MaterialStatePropertyAll(Colors.blue)))
            ],
          ),
        ],
      ),
    );
  }
}



