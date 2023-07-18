import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notesapp/simple_bloc_observer.dart';
import 'package:notesapp/views/notes_view.dart';
import 'constant.dart';
import 'models/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/notes_cubit/notes_cubit.dart';

void main() async{
  await Hive.initFlutter();
  Bloc.observer=SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());   //tell hive that she will deal with NoteModelAdapter
  Hive.openBox<NoteModel>(kNotesBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> NotesCubit(),
      child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                brightness: Brightness.dark,
                fontFamily: 'Poppins',
              ),
              home: const NotesView(),
      ),
    );
  }
}

