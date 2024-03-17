import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:blckdrop/src/services/auth.dart';
import 'package:blckdrop/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:blckdrop/utils/widget.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? errorMessage = '';

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerRePassword = TextEditingController();

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  // //creating a user
  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch (e) {
      errorMessage = e.message;
      SignupValidation(errorMessage);
    }
  }

  //SignUp validation

  void SignupValidation(String? _errormessageforvalidation) {
    if (_controllerEmail.text == '' ||
        _controllerPassword.text == '' ||
        _controllerRePassword.text == '') {
      CustomSnackBarWidget.ShowError(
          context,
          "Sign Up Failure: Invalid Fields!!!",
          'Oh Snap!',
          ContentType.failure);
    } else if (_errormessageforvalidation != '') {
      CustomSnackBarWidget.ShowError(
          context,
          "Sign Up Failure: $_errormessageforvalidation",
          'Oh Snap!',
          ContentType.failure);
    } else if (_controllerPassword.text != _controllerRePassword.text) {
      CustomSnackBarWidget.ShowError(
          context,
          "Sign Up Failure: Make sure your PASSWORDS match",
          'Oh Snap!',
          ContentType.failure);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/Login&RegisterWallpaper.png",
              ),
              fit: BoxFit.cover,
              alignment: Alignment.center,
              opacity: 30),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign Up",
                  style: GoogleFonts.poppins(
                      color: Colors.grey[100],
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w900,
                      fontSize: 34),
                ),
                SizedBox(
                  height: 30,
                ),
                //Email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: _controllerEmail,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Constants.featuresColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Email',
                      fillColor: Colors.grey[300],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //Password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    obscureText: true,
                    controller: _controllerPassword,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2,
                            color: const Color.fromARGB(255, 219, 95, 17)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Password',
                      fillColor: Colors.grey[300],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                //Re Enter Password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    obscureText: true,
                    controller: _controllerRePassword,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2,
                            color: const Color.fromARGB(255, 219, 95, 17)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Re-enter Password',
                      fillColor: Colors.grey[300],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                //Sign Up
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () => createUserWithEmailAndPassword(),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFFa35846),
                      ),
                      child: Center(
                        child: Text('Sign Up',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),

                //Already a member?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Have and accout already?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                    GestureDetector(
                      onTap: () => widget.showLoginPage(),
                      child: Text(
                        ' Log In',
                        style: TextStyle(
                            color: Constants.featuresColor,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
