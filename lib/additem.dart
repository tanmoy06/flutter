import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller.dart';

class AddWeightAlert extends StatefulWidget {
  const AddWeightAlert({Key? key}) : super(key: key);

  @override
  State<AddWeightAlert> createState() => _AddWeightAlertState();
}

class _AddWeightAlertState extends State<AddWeightAlert> {
  MainController mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25))),
      insetAnimationCurve: Curves.fastLinearToSlowEaseIn,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.all(20),
          height: 280,
          width: 580,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Enter your Todo",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Colors.pink,
                ),
              ),
              Column(
                children: [
                  Container(
                      height: 50,
                      width: 400,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Expanded(
                          child: TextFormField(
                            controller: mainController.todoController,
                            decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Enter your todo"),
                          ),
                        ),
                      )),
                ],
              ),
              InkWell(
                onTap: () {
                  if (mainController.todoController.text.length == 0) {
                    Get.showSnackbar(const GetSnackBar(
                      message: "Write Something",
                      duration: Duration(seconds: 1),
                    ));
                  } else {
                    mainController.addTodo(mainController.todoController.text);
                    mainController.todoController.text = "";
                    Navigator.pop(context, false);
                  }
                },
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: Text(
                      "Submit".tr,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
