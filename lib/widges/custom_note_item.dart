import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({Key? key, required this.noteModel}) : super(key: key);

  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return  EditNoteView(noteModel: noteModel,);
        }));
      },
      child: Container(
          decoration: BoxDecoration(
            color: Color(noteModel.color),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 24,bottom: 24, left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  title: Text(
                    noteModel.title,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 26),),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 16,bottom: 16),
                    child: Text(
                        noteModel.subTitle,
                        style: TextStyle(
                            color: Colors.black.withOpacity(.5),
                            fontSize: 18)
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      noteModel.delete();
                      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    },
                    icon: Icon(Icons.delete,color: Colors.black,size: 24,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Text(
                    noteModel.date,
                    style: TextStyle(
                        color: Colors.black.withOpacity(.4),
                        fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
