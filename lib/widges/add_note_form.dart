import 'package:flutter/material.dart';
import 'package:notesapp/models/note_model.dart';

import '../cubits/add_note_cubit/add_note_cubit.dart';
import 'color_list_view.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


class AddNoteForm extends StatefulWidget {
  AddNoteForm({Key? key}) : super(key: key);

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}
class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title , subTitle ;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextField(
            hint: 'title',
            onSaved: (value){
              title = value;
            },
          ),
          const SizedBox(
              height:15
          ),
          CustomTextField(
            hint: 'content',
            maxline: 5,
            onSaved: (value){
              subTitle = value;
            },
          ),
          const SizedBox(
              height:32
          ),
          ColorListView(),
          const SizedBox(
              height:32
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                  isLoading: state is AddNoteLoading ?true : false,
                  onTap:(){
                    if(formKey.currentState!.validate()){
                      formKey.currentState!.save();
                      var currentDate=DateTime.now();
                      var formatedCurrentDate = DateFormat().add_yMd().format(currentDate);
                      var noteModel = NoteModel(title: title!, color: Colors.blue.value, date: formatedCurrentDate, subTitle: subTitle!);
                      BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                    }else{
                      autovalidateMode= AutovalidateMode.always;
                      setState(() {
                      });
                    }
                  }
              );
            },
          )
        ],
      ),
    );
  }
}
