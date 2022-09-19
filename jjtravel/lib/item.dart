import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jjtravel/detail.dart';
import 'package:jjtravel/place.dart';

class ItemPage extends StatelessWidget {
  var username, email;
  ItemPage({super.key, this.username, this.email});

  var items = [
    Place(
        title: "Borobudur Temple",
        image: "assets/place1.jpg",
        description:
            "Borobudur Temple is the largest Buddhist temple in the world and is located in Central Java, the city of Magelang. Many tourists from abroad who visit this place",
        rate: "9/10"),
    Place(
        title: "Atlas Beach Club Bali",
        image: "assets/place2.jpg",
        description: "The most popular beach club in Bali. There's so many tourist here to dance and having fun with their friends.",
        rate: "9.5/10"),
    Place(
        title: "Sudirman Street Bandung",
        image: "assets/place3.jpg",
        description:
            "Sudirman Street is located in the city of Bandung. Usually crowded at night and often visited by people of Chinese descent because there are foods that contain pork, such as mixed rice, pork satay, and so on.",
        rate: "9/10"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 16, 16, 39),
      appBar: AppBar(
        title: const Text('JJTravel'),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Image.asset('assets/logo.png'))
        ],
      ),
      body: Container(
        child: Column(
          children: [
         
            Expanded(
                child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text(items[index].title, style:const  TextStyle(color: Color.fromARGB(255, 195, 226, 255), fontSize: 20),),
                    Image.asset(items[index].image),
                    Text("Rate: " + items[index].rate, style: const TextStyle(color: Color.fromARGB(255, 195, 226, 255), fontSize: 20),),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return DetailPage(username: username, email: email, title: items[index].title, image: items[index].image, description: items[index].description, rate: items[index].rate,);
                            },
                          ));
                        },
                        child: const Text("View detail"))
                  ],
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
