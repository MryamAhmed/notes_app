import 'package:flutter/material.dart';
import 'package:notesapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/note_model.dart';
import 'custom_note_item.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  @override
  void initState(){
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes =BlocProvider.of<NotesCubit>(context).notesList ?? [] ;
        print(notes.length);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            itemCount: notes.length,
              padding:EdgeInsets.zero,  // because it has padding in top by defaault
              itemBuilder:(context ,index){
                return  Padding(
                  padding: EdgeInsets.symmetric(vertical:8),
                  child: NoteItem(noteModel: notes[index]),
                );
              }),
        );
      },
    );
  }
}