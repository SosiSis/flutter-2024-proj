import 'package:flutter/material.dart';

import '../../widgets/top_bar.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            PagesAppBar(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Image.asset(
                "Assets/keys.jpg",
                height: 300,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey), // Adjust color as needed
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: const Column(
                    children: [
                      Text(
                        "Found on ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "April 4, 2024",
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey), // Adjust color as needed
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: const Column(
                    children: [
                      Text(
                        "Found At ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "6 AM",
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey), // Adjust color as needed
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  padding: const EdgeInsets.all(16),
                  margin: EdgeInsets.all(12),
                  child: const Column(
                    children: [
                      Text(
                        "Location ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "5 kilo Lounge",
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                border:
                    Border.all(color: Colors.grey), // Adjust color as needed
                borderRadius: BorderRadius.circular(4.0),
              ),
              padding: const EdgeInsets.all(16),
              child: const Column(
                children: [
                  Text(
                    "Description ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet consectetur adipisicing elit. Deleniti atque, minus ex, itaque, cupiditate quibusdam consequatur odio vitae molestiae dolore magni earum maxime! Dolorum, fuga quo earum blanditiis expedita amet. Perferendis, voluptas dicta alias itaque labore vitae quod totam molestiae modi quia sequi maxime nesciunt, quo est minima sit laudantium ullam? ",
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(4), // Remove button padding
                    // Remove button padding
                  ),
                  child: const Text(
                    'Edit',
                    style: TextStyle(color: Colors.black), // Adjust text color
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(4), // Remove button padding
                    // Remove button padding
                  ),
                  child: const Text(
                    'Delete',
                    style: TextStyle(color: Colors.black), // Adjust text color
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
