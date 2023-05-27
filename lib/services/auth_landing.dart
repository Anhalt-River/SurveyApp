import 'package:flutter/material.dart';
import '../auth.dart';
import '../home.dart';
import 'package:provider/provider.dart';
import 'auth_user.dart';

class LandingPage extends StatelessWidget{
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context){
    final UserModel? userModel = Provider.of<UserModel?>(context);
    final bool checkUser = userModel != null;
    return checkUser ? const HomePage() : const AuthPage();
    // if(checkUser){
    //   return const HomePage();
    // }
    // else{
    //   return const AuthPage();
    // }
  }
}