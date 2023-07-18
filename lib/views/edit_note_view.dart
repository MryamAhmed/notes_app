import 'package:flutter/material.dart';

import '../models/note_model.dart';
import '../widges/edit_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({Key? key,required this.noteModel}) : super(key: key);

  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditViewBody(noteModel: noteModel),
    );
  }
}
