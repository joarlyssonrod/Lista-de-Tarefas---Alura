import 'package:flutter/material.dart';
import 'package:todo_list/Components/tasks.dart';
import 'package:todo_list/Screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tarefas",
        ),
        leading: const SizedBox(),
      ),
      body: ListView(
        children: const [
          Tasks("Aprender Flutter", "assets/images/dash.png", 3),
          Tasks("Andar de bike", "assets/images/bike.webp", 2),
          Tasks("Ler", "assets/images/livro.jpg", 4),
          Tasks("Meditar", "assets/images/meditar.jpeg", 1),
          Tasks("Jogar", "assets/images/jogar.jpg", 5),
          SizedBox(
            height: 80,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FormScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
