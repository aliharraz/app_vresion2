// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Display a background image on the first page
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(
          '../assets/images/img5.jpg',
          fit: BoxFit.cover,
        ),
      ),
      // Add a floating action button to navigate to the second page
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondPage()),
          );
        },
      ),
    );
  }
}

class DynamicWidget extends StatefulWidget {
  final TextEditingController controller;

  DynamicWidget({super.key, required this.controller});

  @override
  // Create the state for the dynamic widget
  _DynamicWidgetState createState() => _DynamicWidgetState();
}

class _DynamicWidgetState extends State<DynamicWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        controller: widget.controller,
        decoration: const InputDecoration(
          labelText: 'Enter Text',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  // Check if the text field is empty
  bool isTextFieldEmpty() {
    return widget.controller.text.isEmpty;
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  // Create the state for the second page
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<TextEditingController> controllers = [];

  void addDynamic() {
    if (controllers.isNotEmpty && controllers.last.text.isEmpty) {
      // Print a message if the last text field is empty
      print('Last text field is empty');
    } else {
      // Add a new text field controller to the list
      TextEditingController newController = TextEditingController();
      controllers.add(newController);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My First App'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: controllers.length,
              itemBuilder: (context, index) {
                return DynamicWidget(controller: controllers[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 27),
            child: TextButton(
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'Add TextField',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              onPressed: addDynamic,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
