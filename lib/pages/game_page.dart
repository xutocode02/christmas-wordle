import 'package:flutter/material.dart';
import 'package:wordle/logic/game_logic.dart';
import 'dart:core';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late GameLogic game;
  @override
  void initState() {
    super.initState();
    game = GameLogic();
  }

  var colorLetterNotInWord = Colors.grey[600];
  var colorLetterWrongPlace = const Color.fromARGB(255, 185, 173, 64);
  var colorLetterRightPlace = const Color.fromARGB(255, 40, 151, 44);

  var wrongLetters = [];
  var rightPlaceRightLetters = [];
  var wrongPlaceRightLetters = [];

  var allColors = [
    [Colors.white, Colors.white, Colors.white, Colors.white, Colors.white],
    [Colors.white, Colors.white, Colors.white, Colors.white, Colors.white],
    [Colors.white, Colors.white, Colors.white, Colors.white, Colors.white],
    [Colors.white, Colors.white, Colors.white, Colors.white, Colors.white],
    [Colors.white, Colors.white, Colors.white, Colors.white, Colors.white],
    [Colors.white, Colors.white, Colors.white, Colors.white, Colors.white],
  ];

  var hasWon = false;
  var hasLost = false;
  var wordNotExist = false;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _reactToWinOrLoss();
    });
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Wordle Game Page',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'DMSerifDisplay',
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _makeRow(row: 0),
                    const SizedBox(height: 10),
                    _makeRow(row: 1),
                    const SizedBox(height: 10),
                    _makeRow(row: 2),
                    const SizedBox(height: 10),
                    _makeRow(row: 3),
                    const SizedBox(height: 10),
                    _makeRow(row: 4),
                    const SizedBox(height: 10),
                    _makeRow(row: 5),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _makeKey(letter: 'Q'),
                      const SizedBox(width: 8),
                      _makeKey(letter: 'W'),
                      const SizedBox(width: 8),
                      _makeKey(letter: 'E'),
                      const SizedBox(width: 8),
                      _makeKey(letter: 'R'),
                      const SizedBox(width: 8),
                      _makeKey(letter: 'T'),
                      const SizedBox(width: 8),
                      _makeKey(letter: 'Y'),
                      const SizedBox(width: 8),
                      _makeKey(letter: 'U'),
                      const SizedBox(width: 8),
                      _makeKey(letter: 'I'),
                      const SizedBox(width: 8),
                      _makeKey(letter: 'O'),
                      const SizedBox(width: 8),
                      _makeKey(letter: 'P'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _makeKey(letter: 'A'),
                      const SizedBox(width: 8),
                      _makeKey(letter: 'S'),
                      const SizedBox(width: 8),
                      _makeKey(letter: 'D'),
                      const SizedBox(width: 8),
                      _makeKey(letter: 'F'),
                      const SizedBox(width: 8),
                      _makeKey(letter: 'G'),
                      const SizedBox(width: 8),
                      _makeKey(letter: 'H'),
                      const SizedBox(width: 8),
                      _makeKey(letter: 'J'),
                      const SizedBox(width: 8),
                      _makeKey(letter: 'K'),
                      const SizedBox(width: 8),
                      _makeKey(letter: 'L'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (game.index == 5) {
                              setState(() {
                                verifyWordAndUpdate();
                              });
                            }
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(
                              child: Text(
                                'ENTER',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      _makeKey(letter: 'Z'),
                      const SizedBox(width: 8),
                      _makeKey(letter: 'X'),
                      const SizedBox(width: 8),
                      _makeKey(letter: 'C'),
                      const SizedBox(width: 8),
                      _makeKey(letter: 'V'),
                      const SizedBox(width: 8),
                      _makeKey(letter: 'B'),
                      const SizedBox(width: 8),
                      _makeKey(letter: 'N'),
                      const SizedBox(width: 8),
                      _makeKey(letter: 'M'),
                      const SizedBox(width: 8),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (game.index > 0) {
                              setState(() {
                                game.index--;
                                game.allWords[game.row][game.index] = '';
                              });
                            }
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.backspace_outlined,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _reactToWinOrLoss() {
    if (hasWon) {
      // redirect to win page
      Navigator.pushReplacementNamed(context, '/winPage');
    } else if (hasLost) {
      // redirect to loss page
      Navigator.pushReplacementNamed(context, '/lossPage');
      // Future.delayed(const Duration(milliseconds: 1000), () {
      //   Navigator.pushReplacementNamed(context, '/lossPage');
      // });
    } else {
      if (wordNotExist) {
        wordNotExist = false;
        return;
      }
      if (game.row == 0 || game.index != 0) {
        return;
      }
      // word was valid, but word wasn't correct
      _displayRowDialog(
        text: 'Try Harder, Buddy 💌',
        image: 'assets/images/scruffyDog.png',
      );
      Future.delayed(const Duration(milliseconds: 1000), () {
        Navigator.of(context).pop();
      });
    }
  }

  void verifyWordAndUpdate() async {
    // check if word exists
    var currentArr = game.allWords[game.row];
    String currentWord = currentArr.join();
    bool isValid = await game.isValidWord(currentWord);
    if (!isValid) {
      wordNotExist = true;
      _displayRowDialog(
        text: 'Not A Real Word, Buddy 💌',
        image: 'assets/images/dogTongue.png',
      );
      Future.delayed(const Duration(milliseconds: 800), () {
        Navigator.of(context).pop();
      });
      return;
    }

    // check if word is correct

    setState(() {
      if (currentWord.toLowerCase() == game.solution.join().toLowerCase()) {
        // found correct word
        // color the containers
        for (int i = 0; i < 5; i++) {
          allColors[game.row][i] = colorLetterRightPlace;
          if (!rightPlaceRightLetters
              .contains(game.solution[i].toLowerCase())) {
            wrongPlaceRightLetters.remove(currentArr[i].toLowerCase());
            rightPlaceRightLetters.add(currentArr[i].toLowerCase());
          }
        }
        // ACTION AFTER BC CURRENT WORD HAS BEEN FOUND
        hasWon = true;
      } else {
        // Create a map to track the count of each letter in the solution
        Map<String, int> solutionLetterCount = {};

        // Count the occurrences of each letter in the solution word
        for (var letter in game.solution) {
          String currentLetter = letter.toLowerCase();
          solutionLetterCount[currentLetter] =
              (solutionLetterCount[currentLetter] ?? 0) + 1;
        }
        for (int i = 0; i < 5; i++) {
          if (currentArr[i].toLowerCase() == game.solution[i].toLowerCase()) {
            allColors[game.row][i] = colorLetterRightPlace;
            String currentLetter = currentArr[i].toLowerCase();
            solutionLetterCount[currentLetter] =
                solutionLetterCount[currentLetter]! - 1;

            // handle keys
            if (!rightPlaceRightLetters
                .contains(game.solution[i].toLowerCase())) {
              wrongPlaceRightLetters.remove(currentArr[i].toLowerCase());
              rightPlaceRightLetters.add(currentArr[i].toLowerCase());
            }
          }
        }

        for (int i = 0; i < 5; i++) {
          if (allColors[game.row][i] != colorLetterRightPlace) {
            String currentLetter = currentArr[i].toLowerCase();
            if (game.solution.contains(currentArr[i].toLowerCase()) &&
                solutionLetterCount[currentLetter]! > 0) {
              allColors[game.row][i] = colorLetterWrongPlace;
              solutionLetterCount[currentLetter] =
                  solutionLetterCount[currentLetter]! - 1;

              // handle keys
              if (!rightPlaceRightLetters
                      .contains(game.solution[i].toLowerCase()) &&
                  !wrongPlaceRightLetters
                      .contains(game.solution[i].toLowerCase())) {
                wrongPlaceRightLetters.add(currentArr[i].toLowerCase());
              }
            } else {
              allColors[game.row][i] = colorLetterNotInWord!;

              // handle keys
              if (!rightPlaceRightLetters
                      .contains(game.solution[i].toLowerCase()) &&
                  !wrongPlaceRightLetters
                      .contains(game.solution[i].toLowerCase()) &&
                  !wrongLetters.contains(game.solution[i].toLowerCase())) {
                wrongLetters.add(currentArr[i].toLowerCase());
              }
            }
          }
        }

        game.index = 0;
        // check if player already lost
        if (game.row == 5) {
          // ACTION PLAYER LOST
          hasLost = true;
        } else {
          game.row++;
        }
      }
    });
  }

  Future<dynamic> _displayRowDialog({text, image}) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 133, 42, 36),
          title: Text(
            text,
            style: const TextStyle(
              fontFamily: 'DMSerifDisplay',
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          content: SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(image),
          ),
        );
      },
    );
  }

  void tapOnLetterKey({letter}) {
    game.allWords[game.row][game.index] = letter.toUpperCase();
    game.index++;
  }

  GestureDetector _makeKey({letter}) {
    double screenWidth = MediaQuery.of(context).size.width;
    double keyWidth = (screenWidth - 20 - 9 * 8) / 10;

    Color? color;
    if (rightPlaceRightLetters.contains(letter.toLowerCase())) {
      color = colorLetterRightPlace;
    } else if (wrongPlaceRightLetters.contains(letter.toLowerCase())) {
      color = colorLetterWrongPlace;
    } else if (wrongLetters.contains(letter.toLowerCase())) {
      color = colorLetterNotInWord;
    } else {
      color = Colors.grey[400];
    }

    return GestureDetector(
      onTap: () {
        if (game.index <= 4) {
          setState(() {
            tapOnLetterKey(letter: letter);
          });
        }
      },
      child: Container(
        height: 50,
        width: keyWidth,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            letter,
            style: TextStyle(
              color: color != Colors.grey[400] ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  Row _makeRow({row}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 5; i++)
          Container(
            margin: const EdgeInsets.only(right: 10),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(
                color: allColors[row][i] == Colors.white
                    ? Colors.grey
                    : allColors[row][i],
                width: 2.0,
              ),
              color: allColors[row][i],
            ),
            child: Center(
              child: Text(
                game.allWords[row][i],
                style: TextStyle(
                  color: allColors[row][i] == Colors.white
                      ? Colors.black
                      : Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
