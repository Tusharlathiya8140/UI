import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String profileImage =
      'assets/avtar.jpg'; // Replace with your asset or a network image
  final String name = "Tushar Lathiya";
  final String bio = "Flutter Developer";

  final List<String> posts = [
    "Built a cool weather app today! ☀️🌧️",
    "Exploring Flutter animations 🔥",
    "New YouTube video uploaded on state management 🎥",
    "Happy coding, folks! 👨‍💻👩‍💻",
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
        ),
        backgroundColor: Colors.blue[100],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(width * 0.05),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: width,
                      padding: EdgeInsets.all(width * 0.02),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: width * 0.15,
                            backgroundImage: AssetImage(profileImage),
                          ),
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: height * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.01,
                            ),
                            child: Text(
                              bio,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: height * 0.02,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Divider(
                    height: height * 0.02,
                    thickness: 2,
                    color: Colors.black,
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.01),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "My Posts",
                          style: TextStyle(
                            fontSize: height * 0.025,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        ...posts.map(
                          (post) => Card(
                            margin: EdgeInsets.only(bottom: height * 0.012),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(width * 0.06),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(width * 0.05),
                              child: Text(
                                post,
                                style: TextStyle(fontSize: height * 0.02),
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
      ),
    );
  }
}
