import 'package:flutter/material.dart';
import 'package:e_commerce/screens/menu.dart';
import 'package:e_commerce/screens/entry_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primary,
    ),
    child: const Column(
      children: [
        Text(
          'E commerce',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Padding(padding: EdgeInsets.all(8)),
        Text(
          "Welcome to this E commerce website",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    ),
          ),
            ListTile(
    leading: const Icon(Icons.home_outlined),
    title: const Text('Home Page'),
    // Redirection part to MyHomePage
    onTap: () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ));
    },
  ),
  ListTile(
    leading: const Icon(Icons.mood),
    title: const Text('Add Mood'),
    // Redirection part to MoodEntryFormPage
    onTap: () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => EntryFormPage(),
          ));
    },
  ),
        ],
      ),
    );
  }
}