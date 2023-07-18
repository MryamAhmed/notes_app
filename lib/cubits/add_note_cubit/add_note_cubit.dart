import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import '../../constant.dart';
import '../../models/note_model.dart';
part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  var noteBox;
Color color = Color(0xFFEE6055);

  addNote(NoteModel note) async{
    note.color = color.value ;
    emit(AddNoteLoading());
    try{
        noteBox = await Hive.box<NoteModel>(kNotesBox);
      await noteBox.add(note);
      emit(AddNoteSuccess());
    }catch(e){
      emit(AddNoteFailure(errorMessages: 'there is error => ${e.toString()}'));
    }
  }
}
