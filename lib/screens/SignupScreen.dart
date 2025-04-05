import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providers/signup_provider.dart';
import 'package:untitled/screens/LoginScreen.dart';

import '../widgets/TextFieldCustom.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var formKey =GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
         centerTitle: true,
      ),
      body:  Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [


            textFieldCustom('username' , Icons.person , usernameController),
            textFieldCustom('password' , Icons.password , passwordController),
            textFieldCustom('phone' , Icons.phone , phoneController),
            textFieldCustom('email' , Icons.email , emailController),


            Consumer<SignUpProvider>(
                builder: ( context,  value,  child) {
                  return TextButton(
                      onPressed: () async {

                        if(formKey.currentState!.validate())
                        {
                          var message = await value.signup(passwordController.text, emailController.text, usernameController.text,
                              phoneController.text);
                          if( message == 'User added successfully' )
                            {
                              ScaffoldMessenger.of(context).showSnackBar(  SnackBar(content: Text(message.toString())));
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>  LoginScreen(),));
                            }
                          else
                          {
                            ScaffoldMessenger.of(context).showSnackBar(  SnackBar(content: Text(message.toString())));
                          }

                        }

                      }, child: const Text('Sign Up'));
                }


            ),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  LoginScreen(),));
            }, child: const Text('Go To Sign In '))

          ],

        ),
      ),
    );
  }
}
