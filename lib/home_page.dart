import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller.dart';
import 'package:todo_app/todoTile.dart';

import 'nevigation_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  MainController mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: const NevigationBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "on.time",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 150,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert,
                      size: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              // first search box------------------------------------------
              Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: const Color.fromARGB(255, 3, 3, 3), width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(50))),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 44),
                      child: const TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Search"),
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.search))
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(() => SizedBox(
                    height: Get.height * 0.81,
                    width: Get.width,
                    child: ListView.builder(
                      itemBuilder: (context, index) => TodoTile(
                          todo: mainController.todoList[index], index: index),
                      itemCount: mainController.todoList.length,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
