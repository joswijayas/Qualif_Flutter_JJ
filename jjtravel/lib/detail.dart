import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jjtravel/listcomment.dart';
import 'package:jjtravel/place.dart';

class DetailPage extends StatefulWidget {
  var title, image, description, rate, username, email;

  DetailPage(
      {super.key,
      required this.title,
      required this.image,
      required this.description,
      required this.rate,
      required this.username,
      required this.email});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<Comment> comments = [
    // Comment(comment: "aaa", email: "aaa", username: "aaaa")
  ];

  TextEditingController commentController = TextEditingController();

  void handleComment() {
    String comment = commentController.text;
    if (comment.isEmpty) {
      // ScaffoldMessenger.of(BuildContext context)
      //     .showSnackBar(SnackBar(content: Text("Comment can't empty!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: Color.fromARGB(255, 16, 16, 39),
            appBar: AppBar(
              title: const Text("JJTravel"),
              actions: <Widget>[
                IconButton(
                    onPressed: () {}, icon: Image.asset('assets/logo.png'))
              ],
              bottom: const TabBar(tabs: [
                Tab(
                  icon: Icon(Icons.confirmation_num),
                ),
                Tab(
                  icon: Icon(Icons.comment),
                ),
              ]),
            ),
            body: TabBarView(
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 195, 226, 255),
                            fontSize: 20),
                      ),
                      Image.asset(widget.image),
                      Text(
                        "Rate: " + widget.rate,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 195, 226, 255),
                            fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          widget.description,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 195, 226, 255),
                              fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextField(
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                          controller: commentController,
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(23, 255, 255, 255),
                              border: OutlineInputBorder(),
                              labelText: 'Comment',
                              labelStyle: TextStyle(
                                color: Color.fromARGB(
                                    255, 255, 255, 255), //<-- SEE HERE
                              )),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (commentController.text.isEmpty) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                  "Comment can't empty!",
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                ),
                                backgroundColor: Color.fromARGB(255, 101, 0, 0),
                              ));
                            } else {
                              comments.add(Comment(
                                  comment: commentController.text,
                                  email: widget.email,
                                  username: widget.username));
                              setState(() {
                                comments = comments;
                              });
                              for (var element in comments) {
                                print(element.comment);
                              }
                            }
                          },
                          child: const Text("Add Comment"))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const Text(
                        "Comment about this place",
                        style: TextStyle(
                            color: Color.fromARGB(252, 219, 253, 255)),
                      ),
                      Expanded(
                          child: ListView.builder(
                              itemCount: comments.length,
                              itemBuilder: (context, index) {
                                return Column(children: [
                                  // const Text(
                                  //   "JAJAJAJAJAJ",
                                  //   style: TextStyle(
                                  //       color:
                                  //           Color.fromARGB(255, 255, 255, 255),
                                  //       fontSize: 50),
                                  // ),
                                  Text(
                                    comments[index].username +
                                        "/" +
                                        comments[index].email +
                                        ": " + "'" +
                                        comments[index].comment + "'",
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(252, 219, 253, 255),
                                        fontSize: 20),
                                  ),
                                ]);
                              }))
                    ],
                  ),
                ),
              ],
            )));
  }
}
