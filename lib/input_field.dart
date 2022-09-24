import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noteme/theme.dart';

class Field extends StatelessWidget {
  const Field({Key? key, required this.title, required this.hint, required this.myIcon, this.controller}) : super(key: key);
  final String title;
  final String hint;
  final Widget? myIcon ;
  final TextEditingController ? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title , style: titleStyle, ),
          SizedBox(height: 3,),
          Container(
            height: 52,
            child: Expanded(
              child: TextFormField(
                controller: controller,
                decoration:InputDecoration(
                  hintText: hint,
                  suffixIcon: myIcon,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
                  ),
                ) ,
              ),
            ),
          )
        ],
      ),
    );

  }
}