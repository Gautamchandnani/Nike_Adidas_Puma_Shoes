import 'package:blckdrop/src/pages/view_page.dart';
import 'package:blckdrop/src/services/appmethods.dart';
import 'package:blckdrop/utils/utils.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatefulWidget {
  CustomAppBar({
    super.key,
    required this.scaffoldkey,
  });
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  // @override
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 90,
      elevation: 0,
      backgroundColor: Colors.grey[200],
      centerTitle: false,
      automaticallyImplyLeading: false,
      actions: [
        //profile
        Padding(
          padding: EdgeInsets.symmetric(vertical: 21.5),
          child: ElevatedButton(
            onPressed: () {
              widget.scaffoldkey.currentState!.openDrawer();
            },
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              backgroundColor: Colors.white,
              elevation: 8,
              tapTargetSize: MaterialTapTargetSize.padded,
            ),
            child: Image.asset(
              'assets/images/profileicon.png',
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(
            top: 15,
          ),
          child: Container(
            margin: EdgeInsets.only(left: 60),
            child: Image.asset(
              "assets/images/BlackDrop_Logo-Transparent.png",
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
        Expanded(child: Container())
      ],
    );
  }
}
