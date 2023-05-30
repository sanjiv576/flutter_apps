import 'package:flutter/material.dart';
import 'package:shared_pr/model/user.dart';

import '../shared_preferences/shared_pref.dart';

class SharedPreferencesView extends StatefulWidget {
  const SharedPreferencesView({super.key});

  @override
  State<SharedPreferencesView> createState() => _SharedPreferencesViewState();
}

class _SharedPreferencesViewState extends State<SharedPreferencesView> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  User? user;

  @override
  void dispose() {
    super.dispose();

    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    SharedPref sharedPref = SharedPref();

                    User user = User(
                      username: _usernameController.text.trim(),
                      password: _passwordController.text.trim(),
                    );

                    // add the user to the preference
                    sharedPref.addUser(user: user);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('User added !'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                  child: const Text('Add user'),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    SharedPref sharedPref = SharedPref();
                    // store the fetched data asynchronously
                    user = await sharedPref.getUser();

                    // change  the state and rebuild
                    setState(() {});
                  },
                  child: const Text('Get data'),
                ),
              ),
              const SizedBox(height: 15),
              if (user != null)
                Text(
                    'Username : ${user!.username} Password: ${user!.password}'),
            ],
          ),
        ),
      )),
    );
  }
}
