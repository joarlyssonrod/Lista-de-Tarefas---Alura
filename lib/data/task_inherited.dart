import 'package:flutter/material.dart';
import '/Components/tasks.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Tasks> taskList = [
    const Tasks(
        "Aprender Flutter",
        "https://storage.googleapis.com/cms-storage-bucket/780e0e64d323aad2cdd5.png",
        3),
    const Tasks(
        "Andar de bike",
        "https://aventurasnabike.com.br/wp-content/uploads/2022/05/bicicleta-emagrece.jpg",
        2),
    const Tasks(
        "Ler",
        "https://metodosupera.com.br/wp-content/uploads/2021/10/Dia-da-leitura-o-que-acontece-no-seu-cerebro-quando-voce-le-um-livro_SUPERA-Ginastica-para-o-cerebro-1.jpg",
        4),
    const Tasks(
        "Meditar",
        "https://www.eusemfronteiras.com.br/wp-content/uploads/2016/09/bigstock-Silhouette-young-woman-practic-47533234-810x540.jpg",
        1),
    const Tasks(
        "Jogar",
        "https://classic.exame.com/wp-content/uploads/2020/10/jogar_videogame_geladeira.jpg?quality=70&strip=info&w=631",
        5)
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(Tasks(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
