import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class Musicplayerscreen extends StatefulWidget {
  const Musicplayerscreen({super.key});

  @override
  State<Musicplayerscreen> createState() => _MusicplayerscreenState();
}

class _MusicplayerscreenState extends State<Musicplayerscreen> with SingleTickerProviderStateMixin {

  bool isPlaying= false;
  double progress= 0.3;

  late AnimationController _rotationController;
  final String albumUrl =
      "https://picsum.photos/400/400?3";

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(vsync: this, duration: const Duration(seconds: 10));
    _rotationController.stop();
  }

  void togglePlayPause(){
    setState(() {
      isPlaying = !isPlaying;
      if(isPlaying){
        _rotationController.repeat();
      }
      else{
        _rotationController.stop();
      }
    });
  }
  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RotationTransition(
                      turns: _rotationController,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.greenAccent.withOpacity(0.4),
                              blurRadius: 20,
                              spreadRadius: 5
                            )
                          ]
                        ),
                        child: CircleAvatar(
                          radius: 120,
                          backgroundImage: NetworkImage(albumUrl),
                        ),
                      ),
                  ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 30,
                    child: Marquee(
                        text: "Shape of You - Ed Sheeran 🎶",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      velocity: 30,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Ed Sheeran",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),

               Column(
                 children: [
                   Slider(
                       value: progress,
                       onChanged: (val){
                         setState(() => progress = val);
                       },
                     activeColor: Colors.greenAccent,
                     inactiveColor: Colors.grey,
                   ),
                   Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 20),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text("1:20", style: TextStyle(color: Colors.white),),
                         Text("3:45", style: TextStyle(color: Colors.white)),
                       ],
                     ),
                   )

                 ],
               ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      iconSize: 40,
                      onPressed: (){},
                      icon: const Icon(Icons.skip_previous),
                      color: Colors.white,
                  ),
                  IconButton(
                    iconSize: 60,
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    color: Colors.greenAccent,
                    onPressed: togglePlayPause,
                  ),
                  IconButton(
                    iconSize: 40,
                    color: Colors.white,
                    icon: const Icon(Icons.skip_next),
                    onPressed: () {},
                  ),
                ],
              ),

              Container(
                color: Colors.grey[900],
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(albumUrl),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                        child: Text(
                          "Mini Player Song - Artist",
                          style: TextStyle(color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                        )
                    ),
                    IconButton(
                      icon: const Icon(Icons.play_arrow, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          )
      ),

    );
  }
}

