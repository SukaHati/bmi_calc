import 'dart:math';

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
      title: 'BMI Calculator',
      theme: ThemeData(

      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _heightSliderValue = 170;
  double _weightSliderValue = 50;
  var _bmi = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI Calculator"), backgroundColor: Colors.red,),
      body: Center(
        child: Column(
          children: [
            Text("BMI Calculator", style: TextStyle(fontSize: 40, color: Colors.black)),
            SizedBox(height: 8,),
            Image.network("https://www.cdc.gov/healthyweight/images/assessing/bmi-adult-fb-600x315.jpg"),
            SizedBox(height: 8,),
            Text("We care about your health", style: TextStyle(fontSize: 32, color: Colors.grey),),
            SizedBox(height: 8,),
            Text("Height: ${_heightSliderValue.round()} cm", style: TextStyle(fontSize: 20, color: Colors.green)),
            SizedBox(height: 8,),
            Slider(
              value: _heightSliderValue,
              max: 200,
              onChanged: (double value) {
                setState(() {
                  _heightSliderValue = value;
                });
              },
            ),
            SizedBox(height: 8,),
            Text("Weight: ${_weightSliderValue.round()} kg", style: TextStyle(fontSize: 20, color: Colors.green),),
            SizedBox(height: 8,),
            Slider(
              value: _weightSliderValue,
              max: 200,
              onChanged: (double value) {
                setState(() {
                  _weightSliderValue = value;
                });
              },
            ),
            Text("Your bmi is $_bmi"),
            SizedBox(height: 8,),
            TextButton.icon(onPressed: (){
              // Formula BMI = berat (kg) / (tinggi (m))^2
              // local variable
              var bmi = _weightSliderValue / pow((_heightSliderValue / 100), 2);
              print(bmi);
              // Masukkan value bmi.round ke dalam _bmi
              // _bmi = bmi.round();
              // Masukkan value bmi.round ke dalam _bmi DAN kemaskini UI (line 73)
              setState(() {
                _bmi = bmi.round();
              });
            }, icon: Icon(Icons.favorite), label:Text("Calculate BMI")),
          ],
        ),
      )

    );
  }
}
