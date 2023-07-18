import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_icone.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key,required this.title,required this.icon,this.onPressed}) : super(key: key);

  final void Function()? onPressed;
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return  Row(
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 28
            ),),
          Spacer(),
          CustomIcon(
            onPressed: onPressed,
            icon: icon,
          )
        ],
      );
  }
}


