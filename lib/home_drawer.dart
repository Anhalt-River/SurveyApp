import 'package:flutter/material.dart';
import '../services/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    AuthServices services = AuthServices();
    FirebaseAuth auth = FirebaseAuth.instance;
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              // decoration: BoxDecoration(
              // ),
              child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Colors.indigo),
            currentAccountPicture: Container(
              alignment: Alignment.topLeft,
              child: const CircleAvatar(
                backgroundColor: Colors.red,
                backgroundImage: NetworkImage(
                    "https://www.citypng.com/public/uploads/preview/png-profile-user-round-gray-icon-symbol-11639594342slkdqxcgi6.png"),
              ),
            ),
            accountName: const Text('name',
                  style: TextStyle(color: Colors.white),),
            accountEmail: Text(auth.currentUser!.email.toString(),
                  style: const TextStyle(color: Colors.white),),
            otherAccountsPictures: [
              IconButton(
                  onPressed: () {
                    services.logOut();
                  },
                  icon: const Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ))
            ],
          )),
          ListTile(
            title: const Text('Главная'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.popAndPushNamed(context, '/home');
            },
          ),
          ListTile(
            title: const Text('Мои опросы'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/mysurveys');
            },
          ),
          ListTile(
            title: const Text('Прошедшие опросы'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/lsurveys');
            },
          ),
        ],
      ),
    );
  }
}
