import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jjtravel/homelight.dart';
import 'package:jjtravel/infographic.dart';
import 'package:jjtravel/item.dart';
import 'package:jjtravel/login.dart';
import 'package:jjtravel/profile.dart';

class HomePage extends StatelessWidget {
  String username, email;
  HomePage({super.key, required this.username, required this.email});
  var images = [
    'assets/banner1.jpg',
    'assets/banner2.jpg',
    'assets/banner3.jpg',
    'assets/banner4.jpg',
    'assets/banner5.jpg',
  ];

  var infographics = [
    Infographic(
        desc:
            "We are focusing to bring you extraordinary experience about traveling around the world.",
        image: "assets/infographic1.jpg"),
    Infographic(
        desc:
            "Finding out the story of someone's journey, can be done with just the pinch of a finger.",
        image: "assets/infographic2.jpg"),
    Infographic(
        desc:
            "Start share your journey with us and other people around the world, become an Extraordinary Traveler!",
        image: "assets/infographic3.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 16, 16, 39),
        appBar: AppBar(
          title: const Text('JJTravel'),
          actions: <Widget>[
            PopupMenuButton<int>(
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: const [
                      Icon(Icons.sunny),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Light Mode",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      )
                    ],
                  ),
                             
                ),
                PopupMenuItem(
                  value: 2,
                  child: Row(
                    children: const [
                      Icon(Icons.shield_moon),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Dark Mode",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      )
                    ],
                  ),
               
                ),
              ],
              offset: const Offset(0, 100),
              color:  const Color.fromARGB(255, 87, 87, 87),
              elevation: 2,
              onSelected: (value) {
                print(value);
                if (value == 1) {
                  print('value 1');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            HomeLightPage(username: username, email: email)),
                  );
                  // if value 2 show dialog
                } else if (value == 2) {
                  print('value 2');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            HomePage(username: username, email: email)),
                  );
                }
              },
            ),
            IconButton(onPressed: () {}, icon: Image.asset('assets/logo.png'))
          ],
        ),
        drawer: Drawer(
          child: ListView(children: [
            // const DrawerHeader(child: Text("Header")),
            ListTile(
              title: Text("Hello, " + username),
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text("Profile"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ProfilePage(username: username, email: email);
                  },
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.airplanemode_active),
              title: const Text("Places"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ItemPage(username: username, email: email,);
                  },
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return LoginPage();
                  },
                ));
              },
            ),
          ]),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: CarouselSlider(
                    items: images.map((e) => Image.asset(e)).toList(),
                    options: CarouselOptions(
                      height: 200,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      viewportFraction: 1,
                      autoPlayInterval: const Duration(seconds: 3),
                    )),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: infographics.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Image.asset(infographics[index].image),
                        Text(infographics[index].desc,
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 20)),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
