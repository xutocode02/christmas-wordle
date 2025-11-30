import 'package:flutter/material.dart';

class LossPage extends StatelessWidget {
  const LossPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text(
          'OOOPS, YOU LOST',
          style: TextStyle(
            fontFamily: 'DMSerifDisplay',
            fontWeight: FontWeight.normal,
            fontSize: 20,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0), // Height of the border
          child: Container(
            color: Colors.grey,
            height: 1.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'HERE ARE SOME HINTS:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 120,
                      child: Image.asset(
                        'assets/images/wine.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: SizedBox(
                      height: 120,
                      child: Image.asset(
                        'assets/images/baguette.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'First of all, it\'s okay.\nEveryone makes mistakes.\nBut everyone also knows,',
                style: TextStyle(
                  // fontFamily: 'DMSerifDisplay',
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  height: 1.2,
                ),
              ),
              const Text(
                'MISTAKES ARE NEVER FOR FREE.',
                style: TextStyle(
                  // fontFamily: 'DMSerifDisplay',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: ExpansionTile(
                    title: const Text(
                      'CLICK FOR CHALLENGE',
                      style: TextStyle(
                        // fontFamily: 'DMSerifDisplay',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        child: Column(
                          children: [
                            const Text(
                              "*This is where a little challenge can go*",
                              style: TextStyle(
                                // fontFamily: 'DMSerifDisplay',
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                height: 1.3,
                              ),
                            ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, '/gamePage');
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(180, 133, 42, 36),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        'PLAY AGAIN',
                                        style: TextStyle(
                                          // fontFamily: 'DMSerifDisplay',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          height: 1.3,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
