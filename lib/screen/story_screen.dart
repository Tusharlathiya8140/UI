import 'package:flutter/material.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Upload Story", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
        ),
        backgroundColor: Colors.blue[100],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(width * 0.03),
            child: Column(
              children: [
                // Media preview box
                Container(
                  height: height * 0.3,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(width * 0.07),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.photo,
                      size: 100,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.02),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.add_a_photo, size: height * 0.025),
                    label: Text(
                      "Choose Image or Video",
                      style: TextStyle(fontSize: height * 0.025),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      textStyle: TextStyle(fontSize: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Upload Story",
                    style: TextStyle(
                      fontSize: height * 0.025,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
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
