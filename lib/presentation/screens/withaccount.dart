import 'package:flutter/material.dart';

class WithAccount extends StatefulWidget {
  @override
  _WithAccountState createState() => _WithAccountState();
}

class _WithAccountState extends State<WithAccount> {
  final List<Item> items = [
    Item(
      imageUrl: 'https://www.jumio.com/app/uploads/2020/10/ID-US.png',
      description: 'ID Card',
    ),
    Item(
      imageUrl:
      'https://th.bing.com/th/id/R.a23d6376839899eba3d7648990f34d8a?rik=HEsuS6DJXHM%2bCg&riu=http%3a%2f%2fpngimg.com%2fuploads%2fkey%2fkey_PNG3378.png&ehk=Yu1s6FCMs9b5wv6I7JEhKSZmG0pzUInKvt17AOaXohQ%3d&risl=1&pid=ImgRaw&r=0',
      description: 'Keys',
    ),
    Item(
      imageUrl:
      'https://th.bing.com/th/id/R.a23d6376839899eba3d7648990f34d8a?rik=HEsuS6DJXHM%2bCg&riu=http%3a%2f%2fpngimg.com%2fuploads%2fkey%2fkey_PNG3378.png&ehk=Yu1s6FCMs9b5wv6I7JEhKSZmG0pzUInKvt17AOaXohQ%3d&risl=1&pid=ImgRaw&r=0',
      description: 'Another Key',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Text(
          'Home',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19,
            letterSpacing: 1.3,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: items.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 30,
              crossAxisSpacing: 10,
              childAspectRatio: 1.0,
            ),
            itemBuilder: (context, index) {
              return GridItem(item: items[index]);
            },
          ),
        ),
      ),
    );
  }
}

class Item {
  final String imageUrl;
  final String description;

  Item({required this.imageUrl, required this.description});
}

class GridItem extends StatelessWidget {
  final Item item;

  GridItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail');
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.network(
                item.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Center(child: Icon(Icons.broken_image, size: 50));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                item.description,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
