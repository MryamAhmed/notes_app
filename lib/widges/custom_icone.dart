import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key, required this.icon,this.onPressed}) : super(key: key);

  final void Function()? onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child:IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 28,),
      )
    );
  }
}