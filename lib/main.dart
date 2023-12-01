import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Button Widget Types'),
        ),
        body: ButtonGrid(),
      ),
    );
  }
}

class ButtonGrid extends StatelessWidget {
  final List<String> buttonNames = [
    'Flat Button',
    'Raised Button',
    'Floating Button',
    'Drop Down Button',
    'Icon Button',
    'Inkwell Button',
    'Popup Menu Button',
    'Outline Button'
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: buttonNames.length,
      itemBuilder: (context, index) {
        return MyButton(buttonName: buttonNames[index]);
      },
    );
  }
}

class MyButton extends StatelessWidget {
  final String buttonName;

  MyButton({required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: getButtonByName(context),
    );
  }

  Widget getButtonByName(BuildContext context) {
    switch (buttonName) {
      case 'Flat Button':
        return Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.teal, // Adjust the color here
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: TextButton(
            onPressed: () => _showAlert(context, buttonName),
            child: Text(buttonName, style: TextStyle(color: Colors.white)),
          ),
        );
      case 'Raised Button':
        return Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.orange, // Adjust the color here
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ElevatedButton(
            onPressed: () => _showAlert(context, buttonName),
            child: Text(buttonName),
          ),
        );
      case 'Floating Button':
        return FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () => _showAlert(context, buttonName),
          child: Icon(Icons.add),
        );
      case 'Drop Down Button':
        return Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.yellow, // Keep the color here
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: DropdownButton<String>(
            items: ['Option 1', 'Option 2', 'Option 3']
                .map((String value) => DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            ))
                .toList(),
            onChanged: (String? value) => _showAlert(context, '$buttonName: $value'),
          ),
        );
      case 'Icon Button':
        return Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.orange, // Adjust the color here
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: InkWell(
            onTap: () => _showAlert(context, buttonName),
            child: Icon(Icons.star, size: 24, color: Colors.white),
          ),
        );
      case 'Inkwell Button':
        return Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.purple, // Adjust the color here
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: InkWell(
            onTap: () => _showAlert(context, buttonName),
            child: Icon(Icons.volume_up, color: Colors.white),
          ),
        );
      case 'Popup Menu Button':
        return Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.indigo, // Keep the color here
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: PopupMenuButton<String>(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'Option 1',
                child: Text('Option 1'),
              ),
              PopupMenuItem(
                value: 'Option 2',
                child: Text('Option 2'),
              ),
              PopupMenuItem(
                value: 'Option 3',
                child: Text('Option 3'),
              ),
            ],
            onSelected: (value) => _showAlert(context, '$buttonName: $value'),
          ),
        );
      case 'Outline Button':
        return Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: OutlinedButton(
            onPressed: () => _showAlert(context, buttonName),
            child: Text(buttonName, style: TextStyle(color: Colors.blue)),
          ),
        );
      default:
        return Container();
    }
  }

  void _showAlert(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Button Clicked'),
          content: Text('You clicked the $message'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
