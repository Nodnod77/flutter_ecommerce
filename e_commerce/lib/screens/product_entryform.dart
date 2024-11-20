import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/screens/menu.dart';
import 'dart:convert';

class ProductEntryFormPage extends StatefulWidget {
  const ProductEntryFormPage({super.key});

  @override
  State<ProductEntryFormPage> createState() => _ProductEntryFormPageState();
}

class _ProductEntryFormPageState extends State<ProductEntryFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
	String _description = "";
	int _price = 0;
  @override
  Widget build(BuildContext context) {

    final request = context.watch<CookieRequest>();

    return Scaffold(
  appBar: AppBar(
    title: const Center(
      child: Text(
        'Add  a new brand product !',
      ),
    ),
    backgroundColor: Theme.of(context).colorScheme.primary,
    foregroundColor: Colors.white,
  ),
  // TODO: Add the created drawer here
  body: Form(
    key: _formKey,
    child: SingleChildScrollView(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Name",
              labelText: "Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            onChanged: (String? value) {
              setState(() {
                _name = value!;
              });
            },
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "The name cannot be empty!";
              }
              return null;
            },
          ),
        ),
        Padding(
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    decoration: InputDecoration(
      hintText: "Description",
      labelText: "Description",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    onChanged: (String? value) {
      setState(() {
        _description = value!;
      });
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "The description cannot be empty!";
      }
      return null;
    },
  ),
),
Padding(
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    decoration: InputDecoration(
      hintText: "Price",
      labelText: "Price",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    onChanged: (String? value) {
      setState(() {
        _price = int.tryParse(value!) ?? 0;
      });
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "The price cannot be empty!";
      }
      if (int.tryParse(value) == null) {
        return "The price must be a number!";
      }
      return null;
    },
  ),
),
Align(
  alignment: Alignment.bottomCenter,
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(
        Theme.of(context).colorScheme.primary),
  ),
  onPressed: () async {
    if (_formKey.currentState!.validate()) {
        // Send request to Django and wait for the response
        // TODO: Change the URL to your Django app's URL. Don't forget to add the trailing slash (/) if needed.
        final response = await request.postJson(
            "http://127.0.0.1:8000/create-flutter/",
            jsonEncode(<String, String>{
                'name': _name,
                'price': _price.toString(),
                'description': _description,
            // TODO: Adjust the fields with your project
            }),
        );
        if (context.mounted) {
            if (response['status'] == 'success') {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(
                content: Text("New product has saved successfully!"),
                ));
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                );
            } else {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(
                    content:
                        Text("Something went wrong, please try again."),
                ));
            }
        }
    }
},
  child: const Text(
    "Save",
    style: TextStyle(color: Colors.white),
  ),
),
  ),
),
      ],
    ),
    
    ),
      
  ),
);
  }
}