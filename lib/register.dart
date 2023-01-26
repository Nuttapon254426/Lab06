import 'package:flutter/material.dart';
import 'package:lab06/services/auth_service.dart';
 class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
   final GlobalKey<FormState> _formKey = GlobalKey();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
       appBar: AppBar(
        title: const Text("Register"),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              email(),
              password(),
              registerButton(),
            ],
          ),
        )),
    );

  }
  ElevatedButton registerButton() => ElevatedButton(onPressed: () {
    if(_formKey.currentState!.validate()){
                print("Ok");
                print(_emailController.text);
               AuthService.registerUser(_emailController.text, _passwordController.text).then((value) {
            if (value == 1) {
              Navigator.pop(context);
            }
          });
               
              }
  }, child: const Text("Register"));

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