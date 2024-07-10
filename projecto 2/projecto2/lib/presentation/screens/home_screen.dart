import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  final String usuario;
  const HomeScreen({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    List<String> campeones = ["Messi", "Otamendi", "Tagliafico", "De Paul"];
    List<String> descripcion = ["Club actual: Inter de Miami", "Club actual: Benfica", "Club actual: Lyon", "Club actual: Atletico de Madrid"];
    
      return Scaffold(
        /*body: ListView.builder(itemCount: campeones.length, itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(campeones[index],),
                    subtitle: Text(descripcion[index]),)
                );
              },),*/
        
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hola $usuario",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
                ),
              ElevatedButton(
                onPressed: (){
                  context.go('/login');
                }, 
                child: const Text("Logout")
              ),
              SizedBox(height: 20), // Espacio deseado antes del ListView
              SizedBox(
                height: campeones.length * 100, // Define una altura adecuada
                child: ListView.builder(
                  itemCount: campeones.length,
                  itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(campeones[index]),
                      subtitle: Text(descripcion[index]),
                    ),
                  );
                },
              ),
              ),
            ],
          )
        )
    );
  }
}