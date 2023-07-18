import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/cubits/notes_cubit/notes_cubit.dart';

import '../widges/add_note_bottomsheet.dart';
import '../widges/notes_viwe_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NotesView extends StatelessWidget {
  const NotesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
            isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              context: context, builder: (context){
            return AddNoteBottomSheet();
          });
        },
        child: const Icon(
            Icons.add),
      ),
      body: const NotesViewBody(),
    );
  }
}


