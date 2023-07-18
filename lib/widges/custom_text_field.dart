import 'package:flutter/material.dart';

import '../constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key,required this.hint, this.maxline = 1, this.onSaved,this.onChanged}) : super(key: key);

  final void Function(String)? onChanged;
  final int maxline;
  final String hint;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,  //
      validator: (value){
        if(value?.isEmpty ?? true){
          return 'Field is required';
        }else{
          return null ;
        }
      },
      cursorColor: kPrimaryColor,
      maxLines: maxline,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: kPrimaryColor,
        ),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: color ?? Colors.white,
        )
      );
  }
}
