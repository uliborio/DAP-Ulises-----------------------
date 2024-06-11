import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';


void main() {
  runApp( LoginScreen());
}

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
  TextEditingController passController = TextEditingController() ;
  TextEditingController userController = TextEditingController() ;

  

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: Column (mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            
             TextField(
              controller: userController,
              decoration: const InputDecoration(
                hintText: 'Username',
                icon: Icon(Icons.person_2_outlined),
             ),
            ),

             TextField(
              controller: passController,
              decoration: const InputDecoration(
                hintText: 'Password',
                icon: Icon(Icons.lock_clock_outlined),
              ),
              obscureText: true,
            ),

             ElevatedButton(
              onPressed: (){
                if ((userController.text == "Lean") && (passController.text == "BorioyLean") ){
                  print("Inicio de sesión exitoso");
                  context.go('/home');
                }
                else{
                  print("Inicio de sesión fallido");
                }
                }, 
              
              child: const Text('Login'), 

            ),

            
        
        
        ],),
      ),
    );
  }
}