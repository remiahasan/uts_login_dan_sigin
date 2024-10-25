import 'package:flutter/material.dart';

final Map<String, Map<String, String>> users = {
  'remiahasan@gmail.com': {'password': 'aos12345', 'name': 'Hasan'}
};

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool passToggle = true;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.person, size: 100, color: Colors.blueAccent),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Format email tidak valid';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      suffix: InkWell(
                        onTap: () {
                          setState(() {
                            passToggle = !passToggle;
                          });
                        },
                        child: Icon(
                          passToggle ? Icons.visibility : Icons.visibility_off,
                        ),
                      )),
                  obscureText: passToggle,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password tidak boleh kosong';
                    }
                    return null;
                  }),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _login(context);
                  }
                },
                child: const Text('Login'),
              ),
              if (errorMessage != null)
                Text(errorMessage!, style: const TextStyle(color: Colors.red)),
              const SizedBox(height: 20,),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text('Belum Punya akun ? Daftar'))
            ],
            ),
          ),
        ));
  }
  void _login(BuildContext context) {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (users.containsKey(email)) {
      if (users[email]!['password'] == password) {
        String userName = users[email]!['name']!;
        Navigator.pushNamed(
          context,
          '/branda',
          arguments: userName,
        );
      } else {
        setState(() {
          errorMessage = 'Password salah!';
        });
      }
    } else {
      setState(() {
        errorMessage = 'Email belum terdaftar!';
      });
    }
  }
}
