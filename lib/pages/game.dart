import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  bool firstTurn = true;
  List<String> displayCord = ['', '', '', '', '', '', '', '', ''];

  void _tapped(int index) {
    setState(() {
      if (firstTurn && displayCord[index] == '') {
        displayCord[index] = 'o';
      } else if (!firstTurn && displayCord[index] == '') {
        displayCord[index] = 'X';
      }
      firstTurn = !firstTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    // first row
    if (displayCord[0] == displayCord[1] &&
        displayCord[0] == displayCord[2] &&
        displayCord[0] != '') {
      _showDialog(displayCord[0]);
    }

    // 2nd row
    if (displayCord[3] == displayCord[4] &&
        displayCord[3] == displayCord[5] &&
        displayCord[3] != '') {
      _showDialog(displayCord[3]);
    }

    // 3rd row
    if (displayCord[6] == displayCord[7] &&
        displayCord[6] == displayCord[8] &&
        displayCord[6] != '') {
      _showDialog(displayCord[6]);
    }

    // 1st column
    if (displayCord[0] == displayCord[3] &&
        displayCord[0] == displayCord[6] &&
        displayCord[0] != '') {
      _showDialog(displayCord[0]);
    }
    // 2nd column
    if (displayCord[1] == displayCord[4] &&
        displayCord[1] == displayCord[7] &&
        displayCord[1] != '') {
      _showDialog(displayCord[1]);
    }
    // 3rd column
    if (displayCord[2] == displayCord[5] &&
        displayCord[2] == displayCord[8] &&
        displayCord[2] != '') {
      _showDialog(displayCord[2]);
    }
    // Diagonal 1
    if (displayCord[0] == displayCord[4] &&
        displayCord[0] == displayCord[8] &&
        displayCord[0] != '') {
      _showDialog(displayCord[0]);
    }
    // Diagonal 2
    if (displayCord[2] == displayCord[4] &&
        displayCord[2] == displayCord[6] &&
        displayCord[2] != '') {
      _showDialog(displayCord[2]);
    }
  }

  void _showDialog(String winner) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('$winner IS THE WINNER'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
          child: GridView.builder(
              itemCount: 9,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => _tapped(index),
                  child: Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: Center(
                      child: Text(
                        displayCord[index],
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ),
                  ),
                );
              })),
    );
  }
}
