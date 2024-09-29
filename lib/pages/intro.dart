import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/helpers/config.dart';
import 'package:tic_tac_toe/pages/game.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Tic Tac Toe',
                      style: Config.whiteFont,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: AvatarGlow(
                    startDelay: const Duration(milliseconds: 1000),
                    glowColor: Colors.white,
                    glowShape: BoxShape.circle,
                    curve: Curves.fastOutSlowIn,
                    repeat: true,
                    child: Material(
                        elevation: 8.0,
                        shape: CircleBorder(),
                        color: Colors.transparent,
                        child: CircleAvatar(
                          radius: 70.0,
                          backgroundImage:
                              AssetImage('assets/images/tic-tac-toe.png'),
                          child: Image.asset('assets/images/tic-tac-toe.png'),
                        )),
                  ),
                ),
                Expanded(
                  child: Center(
                      child: Text(
                    "@Created By EddyCode",
                    style: Config.whiteFont2,
                  )),
                ),
                Expanded(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 40.0, right: 40.0, bottom: 60),
                    child: GestureDetector(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Game())),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          color: Colors.white,
                          child: Text(
                            "PLAY GAME",
                            style: Config.blackFont,
                          ),
                        ),
                      ),
                    ),
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
