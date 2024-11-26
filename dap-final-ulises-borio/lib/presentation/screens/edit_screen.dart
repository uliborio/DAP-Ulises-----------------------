import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/providers/List_provider.dart';
import 'package:myapp/entities/Post.dart';

class EditScreen extends ConsumerWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listAsync = ref.watch(listProvider);
    final pressed = ref.watch(pressedProvider);
    String title;
    String imagesrc;
    late TextEditingController title_controller;
    late TextEditingController description_controller;
    late TextEditingController text_controller;
    late TextEditingController imgsrc_controller;

    title = '';
    imagesrc = '';

    if (pressed == -1) {
      title = 'Nuevo Post';
      title_controller = TextEditingController();
      description_controller = TextEditingController();
      text_controller = TextEditingController();
      imgsrc_controller = TextEditingController();
      imagesrc =
          'data:image/jpeg;base64,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';
    } else {
      listAsync.when(
        data: (list) {
          title = list[pressed].title;
          title_controller = TextEditingController(text: list[pressed].title);
          description_controller =
              TextEditingController(text: list[pressed].description);
          text_controller = TextEditingController(text: list[pressed].text);
          imgsrc_controller =
              TextEditingController(text: list[pressed].imagesrc);
          imagesrc = list[pressed].imagesrc;
        },
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) => Text('Error: $error'),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  imagesrc,
                  width: 100,
                  height: 100,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: title_controller,
                  decoration: const InputDecoration(
                    labelText: "Titulo",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: description_controller,
                  decoration: const InputDecoration(
                    labelText: "Descripcion",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: text_controller,
                  maxLines: null,
                  decoration: const InputDecoration(
                    labelText: "Texto",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: imgsrc_controller,
                  decoration: const InputDecoration(
                    labelText: "Direccion de la Imagen",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      listAsync.when(
                        data: (list) {
                          if (pressed != -1) {
                            list[pressed].title = title_controller.text;
                            list[pressed].description =
                                description_controller.text;
                            list[pressed].text = text_controller.text;
                            list[pressed].imagesrc = imgsrc_controller.text;
                            ref.read(listaddProvider).addMovie(list);
                            context.go('/home');
                          } else {
                            if (title_controller.text == '' ||
                                description_controller.text == '' ||
                                text_controller.text == '' ||
                                imgsrc_controller.text == '') {
                              SnackBar snackBar = const SnackBar(
                                content:
                                    Text("Todos los campos son obligatorios"),
                                duration: Duration(seconds: 3),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              list.add(Post(
                                  title: title_controller.text,
                                  description: description_controller.text,
                                  text: text_controller.text,
                                  imagesrc: imgsrc_controller.text));
                              ref.read(listaddProvider).addMovie(list);
                              context.push('/home');
                            }
                          }
                        },
                        loading: () => const CircularProgressIndicator(),
                        error: (error, stackTrace) => Text('Error: $error'),
                      );
                    },
                    child: const Text("Guardar")),
                    
              ],
            ),
          ),
        ));
  }
}
