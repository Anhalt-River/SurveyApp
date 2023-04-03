import 'package:flutter/material.dart';
import 'package:flutter_survey_app/services/authAcc.dart';
import 'package:flutter_survey_app/services/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}


class _AuthPageState extends State<AuthPage> {
  bool sign = false;

  AuthServices authServices = AuthServices();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signIn() async {
    UserModel? user = await authServices.SignIn(
        emailController.text, passwordController.text);
    return user;
  }

  signUp() async {
    UserModel? user = await authServices.SignUp(
        emailController.text, passwordController.text);
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Your Survey!",
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 30,
                  ),
                ),
                Image.asset("images/fist.png"),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                controller: emailController,
                cursorColor: Colors.teal,
                decoration: InputDecoration(
                  label: const Text(
                    "Email",
                  ),
                  labelStyle: const TextStyle(color: Colors.teal),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.teal)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.teal)),
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.tealAccent,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  cursorColor: Colors.teal,
                  decoration: InputDecoration(
                    label: const Text(
                      "Password",
                    ),
                    labelStyle: const TextStyle(color: Colors.teal),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.teal)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.teal)),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.tealAccent,
                    ),
                  ),
                ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                    ),
                    backgroundColor: MaterialStatePropertyAll(Colors.amber),
                  ),
                  onPressed: () => sign == false ? signIn() : signUp(),
                  child: sign == false
                      ? const Text("Sign In")
                      : const Text("Sign Up"),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              InkWell(
                child: sign == false
                    ? const Text("Sign Up")
                    : const Text("Sign In"),
                onTap: () {
                  setState(() {
                    sign = !sign;
                  });
                },
              ),
          ],
        ),
        
      ),
    );
  }
}