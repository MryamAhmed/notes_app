import 'package:flutter/material.dart';
import '../constant.dart';
import '../models/note_model.dart';
import 'color_list_view.dart';
import 'custom_app_bar.dart';
import 'custom_text_field.dart';
import 'package:notesapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'edit_notes_color_list_view.dart';

class EditViewBody extends StatefulWidget {
   const EditViewBody({Key? key, required this.noteModel,}) : super(key: key);

  final NoteModel noteModel;

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {

  String? title;
  String? content;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height:50),
          CustomAppBar(
            onPressed: (){
              widget.noteModel.title= title ??  widget.noteModel.title;
              widget.noteModel.subTitle= content ??  widget.noteModel.subTitle;
              widget.noteModel.save(); // extend hive object
              Navigator.pop(context);
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            },
              title: 'Edit Note',
              icon: Icons.check,
          ),
          SizedBox(height:50),
          CustomTextField(
              hint: 'title',
            onChanged: (value){
              title = value;
            },
          ),
          SizedBox(height:15),
          CustomTextField(
              hint: 'content',
              maxline: 5,
            onChanged: (value){
                content = value;
          },),
          ColorsListEdit(note: widget.noteModel),
        ],
      ),
    );
  }
}
