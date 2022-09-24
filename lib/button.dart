import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:noteme/add_note_page.dart';

class AddButton extends StatefulWidget {
  const AddButton({Key? key}) : super(key: key);

  @override
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){Get.to(Notes());},
      child: Container(
        alignment: Alignment.center,
        width: 100,
        height:45,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color:Colors.deepPurpleAccent,
        ),
        child: const Text("+ ADD TASK" , style: TextStyle(
            color: Colors.white,
            fontSize: 12
        ),
          textAlign: TextAlign.center,),
      ),
    );
  }
}
