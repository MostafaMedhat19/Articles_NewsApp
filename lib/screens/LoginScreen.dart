import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providers/login_provider.dart';
import 'package:untitled/screens/HomeScreen.dart';
import 'package:untitled/screens/SignupScreen.dart';

import '../widgets/TextFieldCustom.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
  TextEditingController passwordController = TextEditingController();
   TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var formKey =GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body:  Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

               SizedBox(
                  width: double.infinity,
                  child:  CircleAvatar(
                    radius: 10.5,
                    child: Image.asset(''),
                  ),
                ),
            textFieldCustom('email' , Icons.email ,emailController ),

            textFieldCustom('password' , Icons.password , passwordController),

            Consumer<LoginProvider>(
              builder: ( context,  value,  child)  {

                return TextButton(
                    onPressed: ()async  {

                  if(formKey.currentState!.validate() )
                    {
                      var result = await value.login(passwordController.text, emailController.text);
                      if(result == true)
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomeScreen(),));
                        }
                      else
                      {
                        ScaffoldMessenger.of(context).showSnackBar(  SnackBar(content: Text(result.toString())));
                      }
                    }

                }, child: const Text('Login'));
              }


            ) ,
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  SignupScreen(),));
            }, child: const Text('Go To Sign up '))
          ],

        ),
      ),
    );
  }
}
