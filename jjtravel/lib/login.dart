import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jjtravel/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void handleLogin() {
    String username = usernameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    if (username.length < 5) {
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content:  Text("Username must be more than 3 chars")));
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error"),
            content: const Text("Username must be more than 5 characters!"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK"))
            ],
          );
        },
      );

      return;
    }

    if (!email.endsWith('@email.com')) {
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content:  Text("Username must be more than 3 chars")));
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error"),
            content: const Text("Email must ends with '@email.com'!"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK"))
            ],
          );
        },
      );

      return;
    }

    if (password.length < 5) {
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content:  Text("Username must be more than 3 chars")));
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error"),
            content: const Text("Password must be more than 5 characters!"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK"))
            ],
          );
        },
      );

      return;
    }

    if (!RegExp('[a-z]').hasMatch(password)||!RegExp('[0-9]').hasMatch(password)||!RegExp('[A-Z]').hasMatch(password)) {
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content:  Text("Username must be more than 3 chars")));
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error"),
            content: const Text("Password must alphanumeric and include capital!"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK"))
            ],
          );
        },
      );

      return;
    }

    //   builder: (context) {
    //     return HomePage(username: usernameController.text);
    //   },
    // ));
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        // return HomePage(username: usernameController.text);
        return HomePage(username: usernameController.text, email: emailController.text);
      },
    ), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 16, 16, 39),
      appBar: AppBar(
        title: const Text('JJTravel'),
        leading:
            IconButton(onPressed: () {}, icon: Image.asset('assets/logo.png')),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Image.asset('assets/logo.png', scale: 2.5),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    controller: usernameController,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(23, 255, 255, 255),
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                        labelStyle: TextStyle(
                          color:
                              Color.fromARGB(255, 255, 255, 255), //<-- SEE HERE
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    controller: emailController,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(23, 255, 255, 255),
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color:
                              Color.fromARGB(255, 255, 255, 255), //<-- SEE HERE
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(23, 255, 255, 255),
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color:
                              Color.fromARGB(255, 255, 255, 255), //<-- SEE HERE
                        )),
                  ),
                ),
                ElevatedButton(
                    onPressed: handleLogin, child: const Text("Login"))
              ],
            )),
      ),
    );
  }
}
