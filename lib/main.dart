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
      title: 'BMI apk',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.deepPurple.shade400),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var textColor = Colors.white;
  var bgColor = Colors.amber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: textColor, fontSize: 35),
        ),
        backgroundColor: bgColor,
        centerTitle: true,
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: SizedBox(
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'BMI',
                  style: TextStyle(
                    fontSize: 35,
                    color: textColor,
                  ),
                ),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text(
                      "Enter your Weight (in Kg)",
                      style: TextStyle(color: textColor),
                    ),
                    prefixIcon: Icon(Icons.line_weight, color: textColor),
                  ),
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: textColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text(
                      "Enter your Height (in feet)",
                      style: TextStyle(color: textColor),
                    ),
                    prefixIcon: Icon(Icons.height, color: textColor),
                  ),
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: textColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text(
                      "Enter your Height (in inches)",
                      style: TextStyle(color: textColor),
                    ),
                    prefixIcon: Icon(Icons.height, color: textColor),
                  ),
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: textColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    
                  ),
                  
                  onPressed: () {
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inController.text.toString();

                    if (wt != "" && ft != "" && inch != "") {
                      var iWt = int.parse(wt);
                      var iFt = int.parse(ft);
                      var iInch = int.parse(inch);

                      var totalInches = (iFt * 12) + iInch;
                      var totalCm = totalInches * 2.54;
                      var totalM = totalCm / 100;

                      var bmi = iWt / (totalM * totalM);

                      var msg = "";

                      if (bmi > 25) {
                        msg = "You're Overweight!";
                        bgColor = Colors.red;
                      } else if (bmi < 18) {
                        msg = "You're Underweight!";
                        bgColor = Colors.red;
                      } else {
                        msg = "You're Healthy";
                        bgColor = Colors.green;
                      }

                      setState(() {
                        result =
                            "$msg \nYour BMI is : ${bmi.toStringAsFixed(3)}";
                      });
                    } else {
                      setState(() {
                        result = "Please fill all the required blanks!";
                      });
                    }
                  },
                  child: Text('Calculate', 
                  style: TextStyle(color: textColor)
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  result,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
