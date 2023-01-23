import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final TextEditingController controllerTask = TextEditingController();
  final TextEditingController controllerImage = TextEditingController();
  final TextEditingController controllerDifficulty = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Adicionar Tarefa"),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(12),
            width: 380,
            height: 660,
            decoration: BoxDecoration(
                color: const Color.fromARGB(115, 163, 156, 156),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 3)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  validator: (String? value) {
                    if (value != null && value.isEmpty) {
                      return 'Porfavor, informe o nome da sua Tarefa';
                    }
                    return null;
                  },
                  controller: controllerTask,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    labelText: 'Nome da Tarefa',
                    helperText: 'Aprender a andar de moto',
                    fillColor: Colors.white70,
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty ||
                        (int.parse(value) > 5) ||
                        (int.parse(value) < 1)) {
                      return 'Digite a dificuldade entre 1 e 5';
                    }
                    return null;
                  },
                  controller: controllerDifficulty,
                  maxLength: 1,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Dificuldade',
                    helperText: 'Escolha de 1 a 5',
                    fillColor: Colors.white70,
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Digite uma URL válida de uma imagem';
                    }
                    return null;
                  },
                  onChanged: ((value) {
                    setState(() {});
                  }),
                  controller: controllerImage,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.url,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    labelText: 'URL da Imagem',
                    helperText:
                        'https://www.fluttericon.com/logo_dart_192px.svg',
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                ),
                Container(
                  width: 80,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 2, color: Colors.blue),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(
                      controllerImage.text,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset('assets/images/no-photo.jpg');
                      },
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      _formKey.currentState?.validate();
                      print(controllerTask.text);
                      print(controllerDifficulty.text);
                      print(controllerImage.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Tarefa Adicionada'),
                        ),
                      );
                      Navigator.pop(context);
                    },
                    child: const Text('Adicionar')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
