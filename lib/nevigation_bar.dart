import 'package:flutter/material.dart';
import 'package:todo_app/additem.dart';

class NevigationBar extends StatelessWidget {
  const NevigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      // shape: Border(bottom: BorderSide.none),
      elevation: 10,
      hoverColor: Colors.blueAccent,
      backgroundColor: const Color.fromARGB(139, 0, 13, 197),
      child: const Icon(Icons.add, size: 40),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => const AddWeightAlert(),
        );
      },
    );
  }
}
