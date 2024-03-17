import 'package:blckdrop/src/pages/view_page.dart';
import 'package:blckdrop/src/services/login_or_register.dart';
import 'package:blckdrop/utils/utils.dart';
import 'package:blckdrop/src/services/auth.dart';

Widget createAuthStateChangeStreamBuilder() {
  return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // User is signed in, return HomePage
          return ViewPage();
        } else {
          // User is not signed in, return LoginPage
          return LoginOrRegister();
        }
      });
}
