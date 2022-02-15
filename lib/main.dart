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
  int counter = 0, counter2 = 20;
  bool flag = false;

  void increment() {
    setState(
      () {
        if(!flag) {
          counter2--;
          counter++;
          print(counter);
        }
      },
    );
  }

  void switchFlag(){
    setState(() {
      resetDonut(counter);
    },);
  }

  void resetDonut(int? number){
    setState(() {
      if(number != null && number == 0){
        resetNumbers();
      }
    },
    );
  }

  void resetNumbers(){
    setState(() {
      flag = !flag;
      print(flag);
      counter2 = 20;
      counter = counter;
      flag = !flag;
      print(counter);
      print(flag);
    },);
  }



  bool get isEmpty => counter2 >= 0;

  bool get isFull => counter == 20;

  bool get isFlag => flag == false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: isFull
                ? const AssetImage(("assets/images/donutisland.gif"))
                : const AssetImage("assets/images/donut.gif"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Buy a donut!",
              style: TextStyle(
                  fontSize: 50, color: Colors.white, letterSpacing: 6),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
            ),
            const Text(
              "Quantity",
              style: TextStyle(
                  fontSize: 40, color: Colors.white, letterSpacing: 6),
            ),
            Text(
              "$counter2",
              style: const TextStyle(fontSize: 30, color: Colors.white),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            ),
            Text(
              isEmpty
                  ? "Donuts u have:"
                  : isFull
                      ? "U bought them all"
                      : "U still can buy",
              style: TextStyle(
                fontSize: 30,
                color: !isFlag ? Colors.red : Colors.white,
                letterSpacing: 6,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
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
                  onPressed: isFull && isFlag ? () { resetDonut(counter2);} : null,
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isFull && isFlag ? Colors.white : Colors.white.withOpacity(0.2),
                    fixedSize: const Size(150, 50),
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                    ),
                    padding: const EdgeInsets.only(
                        left: 32, right: 32, top: 16, bottom: 16),
                  ),
                  child: const Text(
                    "Buy more",
                    style: TextStyle(
                        letterSpacing: 2, fontSize: 13.5, color: Colors.black),
                  ),
                ),
                const SizedBox(width: 50),
                TextButton(
                  // TODO Fix the isFlag problem
                  onPressed: isFlag && isEmpty ? increment : null,
                  style: TextButton.styleFrom(
                    backgroundColor:
                        !isFull && isFlag && isEmpty ? Colors.white : Colors.white.withOpacity(0.2),
                    fixedSize: const Size(120, 50),
                    primary: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                    ),
                    padding: const EdgeInsets.only(
                        left: 32, right: 32, top: 16, bottom: 16),
                  ),
                  child: const Text(
                    "Buy",
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
