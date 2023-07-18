import 'package:flutter/material.dart';

import '../cubits/add_note_cubit/add_note_cubit.dart';
import '../cubits/notes_cubit/notes_cubit.dart';
import 'add_note_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            if(state is AddNoteSuccess){
              Navigator.pop(context);
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            }
            if(state is AddNoteFailure){
              print('fall');
            }
            },
          builder: (BuildContext context, Object? state) {
            return AbsorbPointer(
              absorbing: state is AddNoteLoading ? true : false,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 16,
                  right: 16,
                  left: 16,
                  bottom:MediaQuery.of(context).viewInsets.bottom.toDouble() ),
                child: SingleChildScrollView(
                    child: AddNoteForm()),
              ),
            );
          }),
    );
  }
}



