import 'package:flutter/material.dart';
import '../services/auth_user.dart';
import '../services/services.dart';
import '../materials/client.dart';


class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final AuthServices authService = AuthServices();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  signIn() async {
    UserModel? user = await authService.signIn(
        _emailController.text, _passwordController.text);
    {
      return user;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // InteractiveViewer(
            //   panEnabled: false,
            //   scaleEnabled: false,
            //   boundaryMargin: const EdgeInsets.all(0),
            //   minScale: 0.5,
            //   maxScale: 1,
            //   child: Image.asset(
            //     'images/fist.png',
            //     width: 100,
            //     height: 100,
            //     fit: BoxFit.cover
            //   ),
            // ),
            const Text('MySurvey',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextField(
                controller: _emailController,
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    label: const Text("Email"),
                    labelStyle: const TextStyle(color: Colors.blueGrey),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(75),
                      borderSide: const BorderSide(color: Colors.purple),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.deepPurple)),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.indigo,
                    )),
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextField(
                controller: _passwordController,
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    label: const Text("Password"),
                    labelStyle: const TextStyle(color: Colors.blueGrey),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(75),
                      borderSide: const BorderSide(color: Colors.purple),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.deepPurple)),
                    prefixIcon: const Icon(
                      Icons.password_outlined,
                      color: Colors.indigo,
                    )),
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: ElevatedButton(
                  onPressed: () {
                    authClient.email = _emailController.text;
                    signIn();
                  },
                  style: const ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)))),
                      backgroundColor: MaterialStatePropertyAll(Colors.indigo)),
                  child: const Text('Sign In')),
            ),

            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.02,
            // ),

            // SizedBox(
            //   width: MediaQuery.of(context).size.width * 0.5,
            //   child: InkWell(

            //     onTap: () {
            //       if(true){
            //         Navigator.popAndPushNamed(context, '/home');
            //       }
            //     },
            //     borderRadius: const BorderRadius.all(Radius.circular(30)),
            //     child: const Center(
            //       child: Text('Sign In',
            //         style: TextStyle(color: Colors.indigo)
            //         ),
            //       )
            //   )
            // ),
          ],
        ),
      ),
    ));
  }
}
