

import 'package:flutter/material.dart';

import '../constant.dart';
import '../models/note_model.dart';
import 'color_list_view.dart';

class ColorsListEdit extends StatefulWidget {
  const ColorsListEdit({Key? key, required this.note}) : super(key: key);

  final NoteModel note;
  @override
  State<ColorsListEdit> createState() => _ColorsListEditState();
}

class _ColorsListEditState extends State<ColorsListEdit> {
  late int currentIndex=0;

  @override
  void initState(){
    currentIndex = kColorList.indexOf(Color(widget.note.color)); //to get the index of note color befor edit
    super.initState();
  }
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
                  widget.note.color = kColorList[index].value;
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
