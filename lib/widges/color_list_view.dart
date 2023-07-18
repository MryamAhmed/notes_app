
import 'package:flutter/material.dart';
import 'package:notesapp/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constant.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({Key? key,required this.isActive, required this.color}) : super(key: key);

  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isActive ? CircleAvatar(
      radius: 38,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 34,
        backgroundColor: color,
      ),
    )
    :
      CircleAvatar(
      radius: 38,
      backgroundColor: color,
    );
  }
}

class ColorListView extends StatefulWidget {
  const ColorListView({Key? key}) : super(key: key);

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38*2,
      child: ListView.builder(
          itemCount: kColorList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GestureDetector(
                onTap: (){
                  currentIndex = index;  // getb index of color click
                  BlocProvider.of<AddNoteCubit>(context).color = kColorList[index];
                  setState(() {

                  });
                },
                child: ColorItem(
                  color: kColorList[index],
                  isActive: currentIndex == index,  // القيمة الي انا ضغطت عليها  هي الي هتستقبل قيمة ترو
                ),
              ),
            );
          }
      ),
    );
  }
}

