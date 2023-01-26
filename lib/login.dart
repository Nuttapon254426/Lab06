import 'package:flutter/material.dart';
import 'package:lab06/register.dart';
import 'package:lab06/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   final GlobalKey<FormState> _formKey = GlobalKey();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              email(),
              password(),
              loginButton(),
              registerButton(),
            ],
          ),
        )),
    );
   
  }
  

 ElevatedButton registerButton() => ElevatedButton(onPressed: () {
    Navigator.push(context,

     MaterialPageRoute(

    builder:(context) => RegisterPage(),
  ),
  );
 }, child: const Text("Register"));
  
  
 ElevatedButton loginButton() {
   return ElevatedButton(onPressed: () {
              if(_formKey.currentState!.validate()){
                print("Ok");
                print(_emailController.text);
              AuthService.loginUser(_emailController.text, _passwordController.text).then((value) {
            if (value == 1) {
              Navigator.pushReplacement(context);
            }
          });
              }
            }, child: const Text("Login"));
 }
  
 TextFormField password() {
   return TextFormField(
              controller: _passwordController,
              validator: (value) {
                if(value!.isEmpty){
                  return "กรุณากรอกรหัสผ่่าน";
                }else{
                  return null;
                }
              },
            );
 }

 TextFormField email() {
   return TextFormField(
              controller: _emailController,
              validator: (value) {
                if(value!.isEmpty){
                  return "กรุณากรอกอีเมล์";
                }else{
                  return null;
                }
              },
            );
 }
}