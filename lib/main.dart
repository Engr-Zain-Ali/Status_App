import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final StoryController storyController = StoryController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Your existing content here

                    // Add a container to display the story view
                    Container(
                      width: double.infinity, // Adjust the width as needed
                      height: 300, // Adjust the height as needed
                      child: StoryView(
                        storyItems: [
                          StoryItem.text(
                            title:
                            "I guess you'd love to see more of our food. That's great.",
                            backgroundColor: Colors.blue,
                          ),
                          StoryItem.text(
                            title: "Nice!\n\nTap to continue.",
                            backgroundColor: Colors.red,
                            textStyle: TextStyle(
                              fontFamily: 'Dancing',
                              fontSize: 40,
                            ),
                          ),
                          StoryItem.pageImage(
                            url:
                            "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
                            caption: "Still sampling",
                            controller: storyController,
                          ),
                          StoryItem.pageImage(
                              url:
                              "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
                              caption: "Working with gifs",
                              controller: storyController),
                          StoryItem.pageImage(
                            url:
                            "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
                            caption: "Hello, from the other side",
                            controller: storyController,
                          ),
                          StoryItem.pageImage(
                            url:
                            "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
                            caption: "Hello, from the other side2",
                            controller: storyController,
                          ),
                        ],
                        onStoryShow: (s) {
                          print("Showing a story");
                        },
                        onComplete: () {
                          print("Completed a cycle");
                        },
                        progressPosition: ProgressPosition.top,
                        repeat: false,
                        controller: storyController,
                      ),
                    ),

                    SizedBox(height: 40),
                    // Add other content below the story view
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
