import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/screens/roundbutton.dart';
import 'package:firebase_project/utils/utilities.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _HomePageState();
}

class _HomePageState extends State<SignUpScreen> {
  final _formkey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordController = TextEditingController();
  final ConfirmpasswordController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("data"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailcontroller,
                      decoration: InputDecoration(
                          hintText: "Email",
                          prefixIcon: const Icon(Icons.alternate_email),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Email";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          hintText: "password",
                          prefixIcon: const Icon(Icons.password),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter password";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // TextFormField(
                    //   controller: ConfirmpasswordController,
                    //   decoration: InputDecoration(
                    //       hintText: "Confirm password",
                    //       prefixIcon: const Icon(Icons.password),
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(20))),
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return "Enter Confirm Password";
                    //     } else if (passwordController !=
                    //         ConfirmpasswordController) {
                    //       return "Password does not match";
                    //     }
                    //   },
                    // ),
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            RoundButton(
              title: 'SignUp',
              onTap: () {
                if (_formkey.currentState!.validate()) {
                  _auth
                      .createUserWithEmailAndPassword(
                          email: emailcontroller.text.toString(),
                          password: passwordController.text.toString())
                      .then((value) {})
                      .onError((error, stackTrace) {
                    print("auth erorr+++++++++++++$error");
                    utils().toastMessage(error.toString());
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
