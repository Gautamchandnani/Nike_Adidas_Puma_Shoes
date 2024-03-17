import 'package:blckdrop/src/services/user_authentication.dart';
// ignore: unused_import
import 'package:blckdrop/utils/pages.dart';
import 'package:blckdrop/utils/utils.dart';
import 'package:flutter/services.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/LandingPageWallpaper.png",
              ),
              fit: BoxFit.cover,
              opacity: 20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //logo
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/BlackDrop_Logo-Transparent.png",
                  ),
                  invertColors: true,
                  opacity: 10,
                ),
              ),
            ),
            //text
            Text(
              "BLCKDROP",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            //text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "GREATNESS HAS NO ",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                Text(
                  "PEAK",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            //Divider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150.0),
              child: Divider(
                height: 15,
                color: Constants.featuresColor,
                thickness: 3,
              ),
            ),
            SizedBox(
              height: 20,
            ),

            //shop Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black.withOpacity(0.28),
                  padding: EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
                onPressed: () async {
                  HapticFeedback.lightImpact();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          createAuthStateChangeStreamBuilder(),
                    ),
                  );
                },
                child: Center(
                  child: Text(
                    "SHOP",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 120,
            ),
          ],
        ),
      ),
    );
  }
}
