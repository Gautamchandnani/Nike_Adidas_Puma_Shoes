import 'package:blckdrop/src/pages/login_page.dart';
import 'package:blckdrop/src/pages/register_page.dart';
import 'package:blckdrop/utils/utils.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        showRegisterPage: () => toggleScreens(),
      );
    } else {
      return RegisterPage(
        showLoginPage: () => toggleScreens(),
      );
    }
  }
}
