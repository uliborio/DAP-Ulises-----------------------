import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

TextEditingController userController = TextEditingController();
TextEditingController passController = TextEditingController();
List<String> users = ["Borio", "Lean", "Feli", "Fideo", "Carbo"];
List<String> passwords = ["comu1", "comu2", "comu3", "comu4", "comu5"];

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Logueo",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
                ),
              TextField(
                controller: userController,
                decoration: const InputDecoration(
                  hintText: 'Usuario',
                  icon: Icon(Icons.person)
                  ),
              ),
              TextField(
                controller: passController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Contraseña',
                  icon: Icon(Icons.key)
                  ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: (){
                  var indexUser = users.indexOf(userController.text);
                  var indexPass = passwords.indexOf(passController.text);
                  if(indexUser == indexPass && indexUser != -1){
                    context.go('/home/${userController.text}');
                  }
                  else if(userController.text == '' && passController.text == ''){
                    SnackBar snackBar = const SnackBar(
                      content: Text("Usuario y Contraseña Vacios"),
                      duration: Duration(seconds: 3),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  else if(userController.text == ''){
                    SnackBar snackBar = const SnackBar(
                      content: Text("Usuario Vacio"),
                      duration: Duration(seconds: 3),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  else if(passController.text == ''){
                    SnackBar snackBar = const SnackBar(
                      content: Text("Contraseña Vacia"),
                      duration: Duration(seconds: 3),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  else{
                    SnackBar snackBar = const SnackBar(
                      content: Text("Usuario o Contraseña Incorrecto"),
                      duration: Duration(seconds: 3),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                }, 
                child: const Text("Login")
              ),
            ],
          )
        )
    );
  }
}