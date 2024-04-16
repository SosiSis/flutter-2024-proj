import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: ProfileTwo()));
}

class ProfileTwo extends StatefulWidget {
  const ProfileTwo({super.key});

  @override
  State<ProfileTwo> createState() => _ProfileTwoState();
}

class _ProfileTwoState extends State<ProfileTwo> {
  final TextEditingController _name =
      TextEditingController(text: "Meron fantahun");
  final _controller = TextEditingController(text: "09919123433");
  final _email = TextEditingController(text: "@m_fantahun");

  bool _isEnable = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("your profile"),
        leading: const Icon(Icons.account_circle),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          // Wrap the Column with Center
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 50.0,
                  child: Icon(
                    Icons.account_circle,
                    size: 100,
                  ),
                ),
              ),
              const Divider(
                height: 60,
                color: Colors.black,
              ),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Name",
                          style: TextStyle(
                            letterSpacing: 2.0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 200,
                              child: TextField(
                                controller: _name,
                                enabled: _isEnable,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                setState(() {
                                  if (_isEnable) {
                                    _isEnable = false;
                                  } else {
                                    _isEnable = true;
                                  }
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Phone number",
                          style: TextStyle(
                            letterSpacing: 2.0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 200,
                              child: TextField(
                                controller: _controller,
                                enabled: _isEnable,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                setState(() {
                                  if (_isEnable) {
                                    _isEnable = false;
                                  } else {
                                    _isEnable = true;
                                  }
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Email",
                          style: TextStyle(
                            letterSpacing: 2.0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 200,
                              child: TextField(
                                controller: _email,
                                enabled: _isEnable,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                setState(() {
                                  if (_isEnable) {
                                    _isEnable = false;
                                  } else {
                                    _isEnable = true;
                                  }
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
              const SizedBox(
                height: 20,
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
      ),
    );
  }
}
