import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_signup_signin/views/firebaseAuthServices.dart';
import 'package:firebase_signup_signin/views/home_screen.dart';
import 'package:firebase_signup_signin/views/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Signin_Screen extends StatefulWidget {
  const Signin_Screen({super.key});

  @override
  State<Signin_Screen> createState() => _Signin_ScreenState();
}

class _Signin_ScreenState extends State<Signin_Screen> {
  // -------------------------------------------------------------------------------
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  bool isSignIn = false;

  final FirebaseAuthService _auth = FirebaseAuthService();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signIn() async {
    setState(() {
      isSignIn = true;
    });

    String email = emailController.text;
    String password = passwordController.text;

    User? user = await _auth.signInDSP(email, password);

    setState(() {
      isSignIn = false;
    });

    if (user != null) {
      print("User is successfully signedIn");

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => Home_Screen()),
          (Route<dynamic> route) => false);
    } else {
      print("Some error happend");
    }
  }

  // ===============================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30.0, left: 20, right: 20, bottom: 10),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Container - 1
                Column(
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/images/casual-t-shirt-.png",
                        height: 50,
                        width: 70,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Email Address";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Email Address",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Password";
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Password",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (_formkey.currentState!.validate()) {
                      print("Validation is done");
                      signIn();
                    }
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: isSignIn
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "Sign in",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  wordSpacing: 2),
                            ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Forgot Password?",
                  style: TextStyle(fontSize: 18, letterSpacing: 1),
                ),
                const SizedBox(
                  height: 25,
                ),
                Column(
                  children: [
                    const Text(
                      "or login with",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/images/google.png",
                            height: 40,
                            width: 40,
                          ),
                          Image.asset(
                            "assets/images/apple-logo.png",
                            height: 40,
                            width: 40,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Signup_Screen()));
                          },
                          child: const Text(
                            " SignUp",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
