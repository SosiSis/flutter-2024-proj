import 'package:flutter/material.dart';


class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                    width: double.maxFinite,
                    height: 320,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/necklace.png"),
                          fit: BoxFit.cover),
                    ))),
            Positioned(
                left: 20,
                top: 30,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    )
                  ],
                )),
            Positioned(
                top: 300,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Item",
                                style: TextStyle(
                                    letterSpacing: 2, color: Colors.blueGrey),
                              ),
                              Text(
                                "Necklace",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Information",
                                style: TextStyle(
                                    letterSpacing: 2, color: Colors.blueGrey),
                              ),
                              Text(
                                "Brand: Kate spade ",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(
                        height: 25,
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.location_on,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Ethiopia, AAIT",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius:
                              BorderRadius.circular(15), // Set border radius
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(
                                  0.4), // Adjust opacity to make it darker
                              spreadRadius: 4,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        margin: const EdgeInsets.all(15),
                        padding: const EdgeInsets.all(5),
                        child: const Column(
                          children: [
                            Text(
                              "Description",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "I found this necklace in the lounge of AAIT. Anyone who has proof of ownership can come claim it.",
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Found Item",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.8),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                            Positioned(
                              bottom: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .end, // Align the button to the right
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors
                                                .lightBlue, // Set button's background color here
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Colors
                                                    .blueAccent), // Optional: Add border
                                          ),
                                          child: IconButton(
                                            onPressed: () {
                                              // Add your onPressed logic here
                                            },
                                            icon: const Icon(
                                              Icons.comment,
                                              color: Colors
                                                  .black, // Set icon's color here
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ])
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
