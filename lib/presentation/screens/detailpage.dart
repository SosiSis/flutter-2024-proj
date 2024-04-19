import 'package:flutter/material.dart';

<<<<<<< HEAD
import '../widgets/top_bar.dart';
=======

>>>>>>> origin/main

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
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
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(4), // Remove button padding
                // Remove button padding
              ),
              child: const Text(
                'Unclaimed',
                style: TextStyle(color: Colors.black), // Adjust text color
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
=======
      backgroundColor: Colors.blue[100],
        appBar: AppBar(
        backgroundColor: Colors.blue[300],
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
            child: Text('Item',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,color: Colors.white,letterSpacing: 1.3),) ,

          )
          
        ],
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back,),style: ButtonStyle(iconColor: MaterialStatePropertyAll(Colors.white)),),
      ),

      body: Center(
        child: Stack(
          
          children: [
            Column(
              children: [
                Container(
                  height: 200,
                  color: Colors.blue[300],
                )
              ],
            
            ),

            Positioned(
              top: 50,
              left: 55,
              child:ClipOval(
                
  child: Container(
    width: 300,
    height: 300,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      
    ),
    child: Image.asset(
      'Assets/keys.jpg',
      fit: BoxFit.cover,
    ),
  ),
)),
Positioned(
  top: 380,
  left: 45,
  child: Container(
    width: 330,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Center(child: Text('Item name',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, ),),),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[300],
                    border: Border.all(
                        color: Colors.white),
                    borderRadius: BorderRadius.circular(50),
>>>>>>> origin/main
                  ),
                  padding: const EdgeInsets.all(16),
                  child: const Column(
                    children: [
                      Text(
                        "Found on ",
<<<<<<< HEAD
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "April 4, 2024",
                        style: TextStyle(fontWeight: FontWeight.normal),
=======
                        style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 238, 238, 238)),
                      ),
                      Text(
                        "April 4, 2024",
                        style: TextStyle(fontWeight: FontWeight.normal,color: Color.fromARGB(255, 238, 238, 238)),
>>>>>>> origin/main
                      ),
                    ],
                  ),
                ),
<<<<<<< HEAD
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
=======


                

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.blue),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: const EdgeInsets.all(16),
                  margin: EdgeInsets.all(10),
>>>>>>> origin/main
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
<<<<<<< HEAD
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
            )
          ],
        ));
  }
}
=======
        ],
        ),
        SizedBox(height: 20,),
        Container(
          child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce sed purus in sapien tempor pulvinar. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam molestie, nulla sed scelerisque pharetra, nisi quam fringilla odio, vel porta mauris velit a dolor. Integer nec arcu non elit consequat semper. Sed eui',
          
          style: TextStyle(overflow: TextOverflow.visible,),),
        ),

        IconButton(onPressed: (){}, icon: Icon(Icons.comment),style:ButtonStyle(side:  MaterialStateProperty.resolveWith<BorderSide>(
      (Set<MaterialState> states) {
        return BorderSide(
          color: Colors.grey,
          width: 2, 
        );
    
      },
    ),
    alignment:Alignment.topCenter,
    
    )
    )
        



        


      ]
      )
      )
      )

          ],
        ),
      ) ,
    );
  }
}
>>>>>>> origin/main
