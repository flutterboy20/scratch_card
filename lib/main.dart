import 'package:flutter/material.dart';
import 'package:scratcher/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scratch Card',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 5,
          title: Text("Scratch Card In Flutter",
              style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
        body: Container(
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.1,
              child: TextButton(
                onPressed: () {
                  showScratchCard(context);
                },
                style: TextButton.styleFrom(
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    primary: Colors.white,
                    backgroundColor: Colors.deepPurple),
                child: Text("Get Reward"),
              ),
            ),
          ),
        ),
      ),
    );
  }

  showScratchCard(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: Scratcher(
            brushSize: 100,
            threshold: 50,
            color: Colors.blue,
            onChange: (value) => print("Scratch progress: $value%"),
            onThreshold: () => print("Threshold reached"),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.32,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.18,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Image.network(
                      "https://image.flaticon.com/icons/png/512/1426/1426770.png",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "You\'ve won",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          letterSpacing: 1,
                          color: Colors.green),
                    ),
                  ),
                  Text(
                    "\$99",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: Colors.green),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
