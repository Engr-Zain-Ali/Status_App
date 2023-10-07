import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
void main(){
  runApp(Statues());
}
class Statues extends StatefulWidget {
  const Statues({super.key});

  @override
  State<Statues> createState() => _StatuesState();
}

class _StatuesState extends State<Statues> {
  late VideoPlayerController _videoPlayerController;
  File? _video;
  final picker=ImagePicker();
  _pickVideo()async{
    final video=await picker.pickVideo(source:ImageSource.gallery);
    _video=File(video!.path);
    _videoPlayerController =VideoPlayerController.file(_video!)..initialize().then((_){
      setState(() {

      });
      _videoPlayerController.play();
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if(_video!=null)
              _videoPlayerController.value.isInitialized ? AspectRatio(
                aspectRatio:_videoPlayerController.value.aspectRatio,
                child: VideoPlayer(_videoPlayerController),
              ):Container()
            else
              Center(child: Text('Click on pick video to selected video')),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){_pickVideo();}, child:Text('Pick video from galery')),
          ],


        ),
      ),
    );
  }
}
//Solve the error in my code so error is _video has not been initalizes