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

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
          Image.asset("assets/images/login_image.png",fit: BoxFit.cover),
          Text("Welcome $name",textAlign: TextAlign.center,style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
            child: Column(
              children: [
                TextFormField(decoration: const InputDecoration(
                  hintText: "Enter Username",
                  labelText: "Username"),
                onChanged: (value){
                  name = value;
                  setState(() {});
                },),
                TextFormField(decoration: const InputDecoration(
                    hintText: "Enter Password",
                    labelText: "Password"
                ),
                obscureText: true),
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () async{
                    setState(() {
                      changeButton = true;
                    });
                    await Future.delayed(Duration(seconds: 1));
                    Navigator.pushNamed(context, MyRoutes.homeRoute);
                  },
                  child: AnimatedContainer(
                    width: changeButton? 50 :150,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      // shape: changeButton ? BoxShape.circle : BoxShape.rectangle
                      borderRadius: BorderRadius.circular(changeButton ? 50 : 8)
                    ),
                    duration: Duration(seconds: 1),
                    child: changeButton ? Icon(Icons.done,color: Colors.white,) : Text("Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                )



                // ElevatedButton(onPressed: (){
                //   Navigator.pushNamed(context, MyRoutes.homeRoute);
                // }, child: const Text("Login",style: TextStyle(color: Colors.white),),
                // style: TextButton.styleFrom(
                //   minimumSize: Size(150,40)
                // ),)

              ],
            ),
          )
        ],
      ),
      )
    );
  }
}


