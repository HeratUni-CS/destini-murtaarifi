import 'dart:math';

import 'package:destini/story_brain.dart';
import 'package:flutter/material.dart';


void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}


class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  StoryBrain first =StoryBrain();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 450,
        width: double.infinity,
        //TODO: Step 1 - Add background.png to this Container as a background image.
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/background.png'),
            fit: BoxFit.cover,

          ),
        ),

        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(

                    first.getStory(),
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      first.nextStory(Random().nextInt(6));
                    });
                    //Choice 1 made by user.


                  },
                  style: TextButton.styleFrom(backgroundColor: Colors.red),
                  child: Text(

                    first.getChoice1(),
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,

                child:Visibility(
                  visible: first.buttonShouldBeVisible(),
                  child: TextButton(
                    onPressed: () {
                      //Choice 2 made by user.

                      
                      setState(() {
                        first.nextStory(Random().nextInt(6));
                      });
                    },
                    
                    
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    child: Text(
                      first.getChoice2(),
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
