import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;

  void decrement() {
    setState(
      () {
        counter--;
        print(counter);
      },
    );
  }

  void increment() {
    setState(
      () {
        counter++;
        print(counter);
      },
    );
  }

  bool get isEmpty => counter == 0;

  bool get isFull => counter == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/summer-ani.gif"),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isEmpty ? "Vazio!" : isFull ? "Lotado!" : "Pode entrar!",
              style: TextStyle(
                fontSize: 40,
                color: isFull ? Colors.red : Colors.white,
                letterSpacing: 6,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Text(
                "$counter",
                style: TextStyle(
                    fontSize: 55, color: isFull ? Colors.red : Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isEmpty ? null : decrement,
                  style: TextButton.styleFrom(
                      backgroundColor: isEmpty
                          ? Colors.white.withOpacity(0.2)
                          : Colors.white,
                      fixedSize: const Size(120, 50),
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19)),
                      padding: const EdgeInsets.only(
                          left: 32, right: 32, top: 16, bottom: 16)),
                  child: const Text(
                    "Saiu",
                    style: TextStyle(
                        letterSpacing: 2, fontSize: 13.5, color: Colors.black),
                  ),
                ),
                const SizedBox(width: 50),
                TextButton(
                  onPressed: isFull ? null : increment,
                  style: TextButton.styleFrom(
                      backgroundColor:
                          isFull ? Colors.white.withOpacity(0.2) : Colors.white,
                      fixedSize: const Size(120, 50),
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19)),
                      padding: const EdgeInsets.only(
                          left: 32, right: 32, top: 16, bottom: 16)),
                  child: const Text(
                    "Entrou",
                    style: TextStyle(
                      letterSpacing: 2,
                      fontSize: 13.5,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
