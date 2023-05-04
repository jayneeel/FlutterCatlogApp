import 'package:flutter/material.dart';
import 'package:flutter_catlog/utils/routes.dart';

// ignore_for_file: prefer_const_constructors

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name ="";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()){
    setState(() {
      changeButton = true;
    });
    await Future.delayed(Duration(seconds: 1));
    await Navigator.pushNamed(context, MyRoutes.homeRoute);
    setState(() {
      changeButton = false;
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
            Image.asset("assets/images/hey.png",fit: BoxFit.cover),
            Text("Welcome $name",textAlign: TextAlign.center,style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(decoration: const InputDecoration(
                    hintText: "Enter Username",
                    labelText: "Username"),
                  validator: (value){
                    if (value!.isEmpty){
                        return "Username cannot be empty";
                    }
                    return null;
                  },
                  onChanged: (value){
                    name = value;
                    setState(() {});
                  },),
                  TextFormField(decoration: const InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                  ),
                      validator: (value){
                        if (value!.isEmpty){
                          return "Password cannot be empty";
                        }else if(value.length < 6){
                          return "Password length must be greater than 6";
                        }
                        return null;
                      },
                  obscureText: true),
                  const SizedBox(
                    height: 40,
                  ),
                  Material(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(changeButton ? 50 : 8),

                    child: InkWell(
                    onTap: () => moveToHome(context),
                    child: AnimatedContainer(
                      width: changeButton? 50 :150,
                      height: 50,
                      alignment: Alignment.center,
                      duration: Duration(seconds: 1),
                      child: changeButton ? Icon(Icons.done,color: Colors.white,) : Text("Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                    ),
                  )
                  )


                ],
              ),
            )
          ],
      ),
        ),
      )
    );
  }
}


