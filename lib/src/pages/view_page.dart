// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field

import 'package:blckdrop/src/services/appmethods.dart';
import 'package:blckdrop/utils/utils.dart';
import 'package:blckdrop/utils/pages.dart';
import 'package:blckdrop/utils/widget.dart';
import 'package:provider/provider.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  PageController _pageController = PageController();

  int _selectedIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    CartPage(),
    FavPage(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void openDrawer() {
    Scaffold.of(context).openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      drawer: CustomDrawer(),
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: Container(
        color: Constants.primaryColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 17),
          child: GNav(
            iconSize: 26,
            backgroundColor: Constants.primaryColor,
            color: Constants.secondaryColor,
            activeColor: Constants.primaryColor,
            tabBackgroundColor: Constants.featuresColor,
            haptic: true,
            padding: EdgeInsets.all(16),
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            curve: Curves.bounceInOut,
            tabBorderRadius: 25,
            tabs: [
              GButton(icon: Icons.home_outlined),
              GButton(icon: Icons.shopping_bag_outlined),
              GButton(icon: Icons.favorite_outline_rounded),
            ],
            onTabChange: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
