import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providers/login_provider.dart';
import 'package:untitled/screens/HomeScreen.dart';
import 'package:untitled/screens/SignupScreen.dart';
import '../widgets/TextFieldCustom.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Color primaryColor = Colors.blueAccent;
    final Color backgroundColor = Colors.grey[100]!;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(' Login'),
        centerTitle: true,
        elevation: 2,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Form(
            key: formKey,
            child: Column(
              children: [



                const SizedBox(height: 30),

                textFieldCustom(
                  'Email',
                  Icons.email_outlined,
                  emailController,

                ),
                const SizedBox(height: 20),

                textFieldCustom(
                  'Password',
                  Icons.lock_outline,
                  passwordController,
                  isPassword: true,

                ),
                const SizedBox(height: 30),

                Consumer<LoginProvider>(
                  builder: (context, provider, _) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.login, size: 20),
                        label: const Text(
                          'Login',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: primaryColor,
                        ),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            var result = await provider.login(
                              passwordController.text,
                              emailController.text,
                            );
                            if (result == true) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (_) => HomeScreen()),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(result.toString()),
                                  backgroundColor: Colors.redAccent,
                                ),
                              );
                            }
                          }
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?", style: TextStyle(color: Colors.black87)),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => SignupScreen()),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
