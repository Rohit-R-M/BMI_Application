import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BMIHomeScreen extends StatefulWidget {
  const BMIHomeScreen({super.key});

  @override
  State<BMIHomeScreen> createState() => _BMIHomeScreenState();
}

class _BMIHomeScreenState extends State<BMIHomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  String _bmiResult = "";

  void calculateBMI() {
    if (_formKey.currentState!.validate()) {
      double height = double.parse(_heightController.text) / 100;
      double weight = double.parse(_weightController.text);

      double bmi = weight / (height * height);

      setState(() {
        _bmiResult = "Height: ${_heightController.text} cm\n"
            "Weight: ${_weightController.text} kg\n"
            "BMI: ${bmi.toStringAsFixed(2)} kg/m²";
      });
    } else {
      setState(() {
        _bmiResult = "Please enter valid height and weight.";
      });
    }
    _heightController.clear();
    _weightController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          centerTitle: true,
          flexibleSpace: Container(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Bmi Calculator",
                  style: GoogleFonts.qwitcherGrypen(
                    textStyle: const TextStyle(fontSize: 50, fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFfbc2eb), Color(0xFFa6c1ee)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25))
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                const SizedBox(height: 20),
        
                // Height input field
                TextFormField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Enter your height (cm)",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your height.";
                    }
                    return null;
                  },
                ),
        
                const SizedBox(height: 10),
        
                // Weight input field
                TextFormField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Enter your weight (kg)",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your weight.";
                    }
                    return null;
                  },
                ),
        
                const SizedBox(height: 20),
        
                // Calculate BMI button
                ElevatedButton(
                  onPressed: calculateBMI,
                  child: const Text("Calculate BMI"),
                ),
        
                const SizedBox(height: 20),
        
                // Display BMI result
                Text(
                  _bmiResult,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
        
                const SizedBox(height: 20),
        
                const SizedBox(height: 10),
                Table(
                  border: TableBorder.all(),
                  columnWidths: const {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(3),
                  },
                  children: const [
                    TableRow(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Category",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "BMI Range",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Underweight"),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("< 18.5"),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Normal weight"),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("18.5 – 24.9"),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Overweight"),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("25.0 – 29.9"),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Obesity (1st Class)"),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("30.0 - 34.9"),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Obesity (2nd Class)"),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("35.0 - 39.9"),
                        )
                      ]
                    ),
                    TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Obesity (3rd Class)"),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(">40"),
                          )
                        ]
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
