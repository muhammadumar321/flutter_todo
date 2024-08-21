import 'package:flutter/material.dart';
import 'package:todo_teal/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback cancelCallBack;
  VoidCallback saveCallBack;

  DialogBox({
    super.key,
    required this.controller,
    required this.cancelCallBack,
    required this.saveCallBack,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFFF5F5F5),
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFF5F5F5),
                  ),
                ),
                hintText: "Add new task...",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                    text: "Save",
                    onPressed: () {
                      saveCallBack();
                    }),
                const SizedBox(
                  width: 8,
                ),
                MyButton(
                    text: "Cancel",
                    onPressed: () {
                      cancelCallBack();
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
