import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providers/signup_provider.dart';
import 'package:untitled/screens/LoginScreen.dart';
import '../widgets/TextFieldCustom.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Icon(Icons.person_add, size: 80, color: Colors.blue),
                const SizedBox(height: 30),

                textFieldCustom('Username', Icons.person, usernameController),
                const SizedBox(height: 15),

                textFieldCustom('Password', Icons.lock, passwordController, isPassword: true),
                const SizedBox(height: 15),

                textFieldCustom('Phone', Icons.phone, phoneController),
                const SizedBox(height: 15),

                textFieldCustom('Email', Icons.email, emailController),
                const SizedBox(height: 30),

                Consumer<SignUpProvider>(
                  builder: (context, provider, _) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.person_add_alt_1),
                        label: const Text('Sign Up'),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            final message = await provider.signup(
                              passwordController.text,
                              emailController.text,
                              usernameController.text,
                              phoneController.text,
                            );

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(message.toString())),
                            );

                            if (message == 'User added successfully') {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (_) => LoginScreen()),
                              );
                            }
                          }
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => LoginScreen()),
                        );
                      },
                      child: const Text('Sign In'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
