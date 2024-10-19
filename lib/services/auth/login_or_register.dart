import 'package:flutter/material.dart';
import 'package:foodapp/pages/login_page.dart';
import 'package:foodapp/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});
  @override
  State<LoginOrRegister> createState()=> _LoginOrRegister();
}

 class _LoginOrRegister extends State<LoginOrRegister>{
  bool showLoginPage=true;

    void toggglePages(){
      setState(() {
        showLoginPage=!showLoginPage;
      });
    }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(onTap: toggglePages);
    }else{
      return RegisterPage(onTap: toggglePages);
    }
  }
 }