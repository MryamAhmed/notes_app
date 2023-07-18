import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../constant.dart';
import '../../models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>?notesList;
  fetchAllNotes() async{
    await Hive.openBox<NoteModel>(kNotesBox);
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notesList =  notesBox.values.toList();
   emit(NotesSuccess());
  }
}