import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var msg = "";
  var bgcolor = Colors.indigo.shade200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "BMI Calculator",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

      body: Container(
        color: bgcolor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "BMI",
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 21,
                ),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text("Enter your Weight (in kgs)"),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text("Enter your Height (in feet)"),
                    prefixIcon: Icon(Icons.height_outlined),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text("Enter your Height (in inches)"),
                    prefixIcon: Icon(Icons.height_outlined),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 18,
                ),
                ElevatedButton(
                  onPressed: () {
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inController.text.toString();

                    if (wt != "" && ft != "" && inch != "") {
                      var iwt = int.parse(wt);
                      var ift = int.parse(ft);
                      var iinch = int.parse(inch);

                      var tinch = (ift * 12) + iinch;
                      var tcm = tinch * 2.54;
                      var tm = tcm / 100;
                      var bmi = iwt / (tm * tm);
                      var msg = "";

                      if (bmi > 25) {
                        msg = "You are Overweight.";
                        bgcolor = Colors.red.shade200;
                      } else if (bmi > 18) {
                        msg = "You are Underweight.";
                        bgcolor = Colors.yellow.shade200;
                      } else {
                        msg = "You are fit.";
                        bgcolor = Colors.green.shade200;
                      }

                      setState(() {
                        result =
                            "$msg \n  Your BMI is ${bmi.toStringAsFixed(2)}";
                      });
                    } else {
                      setState(() {
                        result = "Please Fill all the required Details.";
                      });
                    }
                  },
                  child: Text(
                    "Calculate",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  result,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
