import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLiked = false;
  int likeCount = 120;
  List<String> comments = ["Nice video!", "Love this!", "🔥🔥🔥"];
  final TextEditingController commentController = TextEditingController();

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likeCount += isLiked ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
        ),
        backgroundColor: Colors.blue[100],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(width * 0.02),
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.network(
                      'https://img.youtube.com/vi/dQw4w9WgXcQ/0.jpg',
                      height: height * 0.24,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned.fill(
                      child: Center(
                        child: Icon(
                          Icons.play_circle_fill,
                          color: Colors.white,
                          size: height * 0.08,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.01,
                    horizontal: width * 0.05,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: toggleLike,
                        child: Container(
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  isLiked
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isLiked ? Colors.red : Colors.grey,
                                  size: height * 0.03,
                                ),
                                onPressed: toggleLike,
                              ),
                              Text(
                                '${likeCount} likes',
                                style: TextStyle(fontSize: height * 0.02),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: width * 0.03),
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(width * 0.1),
                                ),
                              ),
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: Container(
                                    padding: EdgeInsets.all(width * 0.05),
                                    height: height * 0.5,
                                    child: Column(
                                      children: [
                                        Text(
                                          "Comments",
                                          style: TextStyle(
                                            fontSize: height * 0.03,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Expanded(
                                          child: ListView.builder(
                                            itemCount: comments.length,
                                            itemBuilder: (context, index) =>
                                                ListTile(
                                                  leading: CircleAvatar(
                                                    child: Text(
                                                      comments[index][0],
                                                    ),
                                                  ),
                                                  title: Text(comments[index]),
                                                ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: TextField(
                                                controller: commentController,
                                                decoration: InputDecoration(
                                                  hintText:
                                                      "Write a comment...",
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          width * 0.05,
                                                        ),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                        horizontal:
                                                            width * 0.05,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(Icons.send),
                                              onPressed: () {
                                                final comment =
                                                    commentController.text
                                                        .trim();
                                                if (comment.isNotEmpty) {
                                                  setState(() {
                                                    comments.add(comment);
                                                  });
                                                  commentController.clear();
                                                  Navigator.pop(context);
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: width * 0.02),
                                  child: Icon(
                                    Icons.comment,
                                    size: height * 0.03,
                                  ),
                                ),
                                Text(
                                  "Comments",
                                  style: TextStyle(fontSize: height * 0.02),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
