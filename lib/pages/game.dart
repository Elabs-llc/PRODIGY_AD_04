import 'package:flutter/material.dart';
import 'package:tic_tac_toe/helpers/config.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  bool firstTurn = true;
  List<String> displayCord = ['', '', '', '', '', '', '', '', ''];
  int _oScore = 0;
  int _xScore = 0;
  int _filledBoxes = 0;

  void _tapped(int index) {
    setState(() {
      if (firstTurn && displayCord[index] == '') {
        displayCord[index] = 'o';
        _filledBoxes += 1;
      } else if (!firstTurn && displayCord[index] == '') {
        displayCord[index] = 'X';
        _filledBoxes += 1;
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
    } else if (_filledBoxes == 9) {
      _drawDialog();
    }
  }

  void _drawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('It\'s a DRAW'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _clearBoard();
                },
                child: Text('Restart'),
              ),
            ],
          );
        });
  }

  void _showDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('$winner IS THE WINNER'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _clearBoard();
                },
                child: Text('Restart'),
              ),
            ],
          );
        });
    if (winner == 'o') {
      _oScore += 1;
    } else if (winner == 'X') {
      _xScore += 1;
    }
  }

  void _clearBoard() {
    setState(() {
      //displayCord = ['', '', '', '', '', '', '', '', ''];
      for (int i = 0; i < 9; i++) {
        displayCord[i] = '';
      }
      firstTurn = false;
      _filledBoxes = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Column(
            children: [
              SizedBox(
                width: 0,
                height: 20.0,
              ),
              Center(
                  child: Text(
                'Score Board',
                style: Config.whiteFont,
              )),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text("Player O", style: Config.yellowFont),
                            Text(_oScore.toString(), style: Config.whiteFont),
                          ],
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          children: [
                            Text("Player X", style: Config.wineFont),
                            Text(_xScore.toString(), style: Config.whiteFont),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            flex: 3,
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => _tapped(index),
                    child: Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: Center(
                        child: Text(
                          displayCord[index],
                          style: Config.whiteFont,
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
              child: Container(
            child: Column(
              children: [
                SizedBox(
                  width: 0,
                  height: 15.0,
                ),
                Text("Tic Tac Toe Game", style: Config.whiteFont2),
                SizedBox(
                  width: 0,
                  height: 15.0,
                ),
                Text(
                  "@CREATED BY EDDYCODY",
                  style: Config.whiteFont2,
                ),
              ],
            ),
          )),
        ],
      )),
    );
  }
}
