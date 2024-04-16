import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(home: Profile()));
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        //remember this
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      child: Icon(
                        Icons.account_circle,
                        size: 55,
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      flex: 2, // Adjusted flex factor
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name: Woldemariam aberta",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis, // Prevent overflow
                          ),
                          SizedBox(
                            height: 7.0,
                          ),
                          Text(
                            "Phone number: 0912234567",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child:
                            IconButton(onPressed: null, icon: Icon(Icons.edit)))
                  ],
                ),
              ),
            ),
            const Divider(
              height: 10.0,
              color: Colors.grey,
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  children: [
                    cards(
                      imag:
                          Imag(text: "Oscar wild", link: "assets/necklace.png"),
                    ),
                    cards(
                      imag:
                          Imag(text: "Oscar wild", link: "assets/necklace.png"),
                    ),
                    cards(
                      imag:
                          Imag(text: "Oscar wild", link: "assets/necklace.png"),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.post_add,
                color: Colors.lightBlue,
              ),
              label: const Text("New post"),
            )
          ],
        ),
      ),
    );
  }
}

class cards extends StatelessWidget {
  final Imag imag;
  const cards({required this.imag});
  @override
  Widget build(BuildContext context) {
    return Flexible(
      // Wrap Card with Flexible
      flex: 1, // Set a flex factor
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10), // Adjust padding as needed
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment:
                CrossAxisAlignment.stretch, // Center content vertically
            children: [
              Expanded(
                  flex: 3,
                  // Wrap Image.asset with Expanded
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20), // Image border
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(48), // Image radius
                      child: Image.network(imag.link, fit: BoxFit.cover),
                    ),
                  )),
              const Expanded(
                flex: 1,
                child: SizedBox(
                  height: 10, // Adjust spacing between image and text
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Text(
                    "Description: " + imag.text,
                    textAlign: TextAlign.start, // Center text horizontally
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class Imag {
  String text;
  String link;

  Imag({required this.text, required this.link});
}
