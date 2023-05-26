import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(12),
          child: Column(
            children: [
              const Text(
                'Hello 1 - Montserrat with 400 ',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.normal),
              ),
              const Text(
                'Hello 2 - Open Sans with 700 weight',
                style: TextStyle(fontSize: 20, fontFamily: 'Open Sans', fontWeight: FontWeight.bold),
              ),
              const Text(
                'Hello 3 - Regular with 400 weight',
                style: TextStyle(fontSize: 20,),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Enter first name'),
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Enter last name'),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    print('button pressed');
                  },
                  child: const Text('Submit '))
            ],
          ),
        ),
      ),
    );
  }
}
