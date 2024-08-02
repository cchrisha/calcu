import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Calculator(title: 'Calculator'),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key, required this.title});

  final String title;

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  double? result = 0, num1 = 0, num2 = 0;

  add() {
    setState(() {
      num1 = double.parse(controller1.text);
      num2 = double.parse(controller2.text);
      result = num1! + num2!;
    });
  }

  sub() {
    setState(() {
      num1 = double.parse(controller1.text);
      num2 = double.parse(controller2.text);
      result = num1! - num2!;
    });
  }

  mul() {
    setState(() {
      num1 = double.parse(controller1.text);
      num2 = double.parse(controller2.text);
      result = num1! * num2!;
    });
  }

  div() {
    setState(() {
      num1 = double.parse(controller1.text);
      num2 = double.parse(controller2.text);
      result = num1! / num2!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          Text(
            "RESULT: $result",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 35,
          ),
          TextField(
            controller: controller1,
            decoration: InputDecoration(
                labelText: "Enter First Number",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 30,
          ),
          TextField(
            controller: controller2,
            decoration: InputDecoration(
                labelText: "Enter Second Number",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    add();
                    controller1.clear();
                    controller2.clear();
                  },
                  child: const Text("Add")),
              ElevatedButton(
                  onPressed: () {
                    sub();
                    controller1.clear();
                    controller2.clear();
                  },
                  child: const Text("Subtract")),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    mul();
                    controller1.clear();
                    controller2.clear();
                  },
                  child: const Text("Multiply")),
              ElevatedButton(
                  onPressed: () {
                    div();
                    controller1.clear();
                    controller2.clear();
                  },
                  child: const Text("Divide")),
            ],
          )
        ]),
      ),
    );
  }
}
