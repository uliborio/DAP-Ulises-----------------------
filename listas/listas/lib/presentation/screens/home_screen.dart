import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:projecto2/core/app/entities/Post.dart';

class HomeScreen extends StatelessWidget {
  final String usuario;
  const HomeScreen({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    List<Post> posts = [
     Post(title: "Lionel Messi", description: "Campeon del mundo", imagesrc: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Lionel-Messi-Argentina-2022-FIFA-World-Cup_%28cropped%29.jpg/330px-Lionel-Messi-Argentina-2022-FIFA-World-Cup_%28cropped%29.jpg", text: "Lionel Messi es un futbolista argentino, ampliamente considerado uno de los mejores jugadores de todos los tiempos. Nacido el 24 de junio de 1987 en Rosario, Argentina, ha ganado múltiples títulos con el FC Barcelona, incluyendo varias Ligas de Campeones de la UEFA y Balones de Oro. En 2021, se unió al Paris Saint-Germain (PSG) y ha continuado destacándose tanto a nivel de clubes como con la selección argentina, con la que ganó la Copa América en 2021 y la Copa del Mundo en 2022. Actualmente se encuentra en el Inter de Miami, el cual se incorporo en 2023"),
      Post(title: "Otamendi", description: "Campeon del mundo", imagesrc: "https://upload.wikimedia.org/wikipedia/commons/3/3e/Arg_vs_mexico_otamendi_%28cropped%29.jpg", text: "Nicolás Otamendi es un futbolista argentino que juega como defensor central. Nacido el 12 de febrero de 1988 en Buenos Aires, ha jugado para varios clubes destacados como el Valencia CF, el Manchester City y el Benfica. Es conocido por su solidez defensiva y su capacidad en el juego aéreo. También ha sido un jugador regular en la selección argentina, participando en varias Copas América y la Copa del Mundo."),
      Post(title: "Tagliafico", description: "Campeon del mundo", imagesrc: "https://upload.wikimedia.org/wikipedia/commons/4/4d/Argentina_team_in_St._Petersburg_%28cropped%29.jpg", text: "Nicolás Tagliafico es un futbolista argentino que juega como lateral izquierdo. Nacido el 31 de agosto de 1992 en Buenos Aires, ha jugado para clubes como Independiente, Ajax y Olympique de Lyon. Es conocido por su tenacidad, capacidad defensiva y contribuciones ofensivas desde el lateral. Ha sido una figura regular en la selección argentina, participando en torneos importantes como la Copa América y la Copa del Mundo."),
      Post(title: "De Paul", description: "Campeon del mundo", imagesrc: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/25th_Laureus_World_Sports_Awards_-_Red_Carpet_-_Rodrigo_de_Paul_-_240422_192702_%28cropped%29.jpg/375px-25th_Laureus_World_Sports_Awards_-_Red_Carpet_-_Rodrigo_de_Paul_-_240422_192702_%28cropped%29.jpg", text: "Rodrigo De Paul es un futbolista argentino que juega como centrocampista. Nacido el 24 de mayo de 1994 en Sarandí, Argentina, ha jugado para clubes como Racing Club, Valencia CF, Udinese y Atlético de Madrid. Es conocido por su versatilidad, habilidad para distribuir el balón y capacidad para recuperar la posesión. De Paul ha sido una pieza clave en la selección argentina, ayudando al equipo a ganar la Copa América en 2021 y la Copa del Mundo en 2022."),
    ];

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hola $usuario",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/login');
              },
              child: const Text("Logout"),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: posts.length * 100,
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return Card(
                    child: ListTile(
                      title: Text(post.title),
                      subtitle: Text(post.description),
                      onTap: () {
                        context.push(
                          '/card',
                          extra: {
                            'list': posts,
                            'pressed': index,
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}