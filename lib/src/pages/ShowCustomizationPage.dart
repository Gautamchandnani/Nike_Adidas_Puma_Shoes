import 'package:flutter/material.dart';

class ShowCustomizationPage extends StatelessWidget {
  const ShowCustomizationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Show Customization"),
        backgroundColor: Colors.blue, // Customize app bar background color
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CustomizePage(),
              ),
            );
          },
          child: Text('Customize'),
        ),
      ),
    );
  }
}

class CustomizePage extends StatelessWidget {
  const CustomizePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customize'),
        backgroundColor: Colors.blue, // Customize app bar background color
      ),
      body: Center(
        child: Text('Customization Page'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ShowCustomizationPage(),
  ));
}
