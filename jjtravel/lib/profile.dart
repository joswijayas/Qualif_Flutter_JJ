import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfilePage extends StatelessWidget {
  var username, email;
  ProfilePage({super.key, required this.username, required this.email});

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
            Text('Profile', style: TextStyle(color: Color.fromARGB(255, 224, 255, 255), fontSize: 20),),
            Text('Username: ' + username, style: TextStyle(color: Color.fromARGB(255, 224, 255, 255), fontSize: 20),),
            Text('Email: ' + email, style: TextStyle(color: Color.fromARGB(255, 224, 255, 255), fontSize: 20),),
            Icon(Icons.account_circle)
          ],
        ),
      ),
    );
  }
}
