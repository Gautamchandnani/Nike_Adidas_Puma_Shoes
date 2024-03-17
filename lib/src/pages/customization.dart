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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.yellow.withOpacity(0.7),
              Colors.pink.withOpacity(0.7),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCustomizationOption(
                  context,
                  "Colour Customization",
                  "assets/images/nike/rgb.png",
                  "assets/images/nike/red.png",
                  "assets/images/nike/purple.png",
                ),
                _buildCustomizationOption(
                  context,
                  "Logo Customization",
                  "assets/images/nike/badges.jpg",
                  "assets/images/nike/blossom.jpg",
                  "assets/images/nike/fire.jpg",
                ),
                _buildCustomizationOption(
                  context,
                  "Name Customization",
                  "assets/images/nike/name.png",
                  "assets/images/nike/image3.png",
                  "assets/images/nike/ashley.png",
                ),
                _buildCustomizationOption(
                  context,
                  "Laces Customization",
                  "assets/images/nike/laces.png",
                  "assets/images/nike/ogiy.jpg",
                  "assets/images/nike/echo.png",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomizationOption(
    BuildContext context,
    String brand,
    String logoPath,
    String image1Path,
    String image2Path,
  ) {
    return GestureDetector(
      onTap: () {
        CustomizationFunctions.customizeItem(
          context,
          brand,
          image1Path,
          image2Path,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Image.asset(
                    logoPath,
                    height: 40,
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      brand,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomizePage extends StatelessWidget {
  final String brandName;
  final String image1Path;
  final String image2Path;

  const CustomizePage({
    Key? key,
    required this.brandName,
    required this.image1Path,
    required this.image2Path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customize $brandName'),
        backgroundColor: Colors.blue, // Customize app bar background color
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.yellow.withOpacity(0.7),
                Colors.pink.withOpacity(0.7),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCustomizationSection(image1Path),
                _buildCustomizationSection(image2Path),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomizationSection(String imagePath) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imagePath),
        ],
      ),
    );
  }
}

class CustomizationFunctions {
  static void customizeItem(
    BuildContext context,
    String brand,
    String image1Path,
    String image2Path,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CustomizePage(
          brandName: brand,
          image1Path: image1Path,
          image2Path: image2Path,
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ShowCustomizationPage(),
  ));
}
