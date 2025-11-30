import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 133, 42, 36),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '*Gf & Bf* Forever',
              style: TextStyle(
                fontFamily: 'DMSerifDisplay',
                fontWeight: FontWeight.normal,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 40,
        ),
        // width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 133, 42, 36),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Merry\nChristmas\nTo *Girlfriend*',
              style: TextStyle(
                fontFamily: 'DMSerifDisplay',
                fontWeight: FontWeight.normal,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: SizedBox(
                height: 200,
                width: 200,
                child: Image.asset(
                  'assets/images/airplane.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 80),
            const Text(
              'GUESS WHERE WE ARE GOING ',
              style: TextStyle(
                fontFamily: 'DMSerifDisplay',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/gamePage');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                  backgroundColor: const Color.fromARGB(9, 216, 136, 131),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  '✈️  Tap To Start Guessing  ✈️',
                  style: TextStyle(
                    fontFamily: 'DMSerifDisplay',
                    fontWeight: FontWeight.normal,
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
