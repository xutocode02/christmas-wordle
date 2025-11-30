import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class WinPage extends StatefulWidget {
  const WinPage({super.key});

  @override
  State<WinPage> createState() => _WinPageState();
}

class _WinPageState extends State<WinPage> {
  bool isPlaying = false;
  final controller = ConfettiController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print('hello');

    controller.play();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/paris.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    // Colors.black,
                    Color.fromARGB(255, 133, 42, 36),
                    Color.fromARGB(100, 133, 42, 36),
                    // Colors.black.withOpacity(0.5),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(
                        height: 150,
                        width: 150,
                        child: Image.asset(
                          'assets/images/smilingDog.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'WE ARE GOING TO...',
                          style: TextStyle(
                            fontFamily: 'DMSerifDisplay',
                            fontWeight: FontWeight.normal,
                            fontSize: 30,
                            color: Color.fromARGB(255, 240, 179, 175),
                            height: .5,
                          ),
                        ),
                        Text(
                          'PARIS',
                          style: TextStyle(
                            height: 1,
                            fontFamily: 'DMSerifDisplay',
                            fontWeight: FontWeight.normal,
                            fontSize: 80,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'FOR NEW YEAR\'S!',
                          style: TextStyle(
                            height: .9,
                            fontFamily: 'DMSerifDisplay',
                            fontWeight: FontWeight.normal,
                            fontSize: 40,
                            color: Color.fromARGB(255, 240, 179, 175),
                          ),
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: controller,
            shouldLoop: true,
            blastDirectionality: BlastDirectionality.explosive,
            colors: const [
              Colors.red,
              Colors.blue,
              Colors.green,
              Colors.yellow,
              Colors.pink,
              Colors.lightBlue,
              Colors.white,
              Colors.black,
            ],
          ),
        ),
      ],
    );
  }
}
