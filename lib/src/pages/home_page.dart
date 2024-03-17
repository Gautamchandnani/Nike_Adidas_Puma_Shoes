import 'package:flutter/material.dart';
import 'package:blckdrop/src/widgets/custom_appbar_widget.dart';
import 'package:blckdrop/utils/widget.dart';
import 'package:blckdrop/utils/utils.dart';
import 'package:blckdrop/src/pages/customization.dart'; // Import the customization.dart file

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> globalKey = GlobalKey();
  TextEditingController _controllerSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      drawer: CustomDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: CustomAppBar(scaffoldkey: globalKey),
      ),
      backgroundColor: Colors.grey[200],
      body: ListView(
        physics: BouncingScrollPhysics(
          decelerationRate: ScrollDecelerationRate.normal,
        ),
        children: [
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              //searchbar
              SearchWidget(
                controllerSearch: _controllerSearch,
                hintText: "Search product",
                icon: Icons.search_rounded,
              ),
              SizedBox(
                height: 25,
              ),
              //brands
              BrandSelector(),
              SizedBox(
                height: 25,
              ),
              // Button to navigate to ShowCustomizationPage
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowCustomizationPage(),
                    ),
                  );
                },
                child: Text('Customize Page'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
