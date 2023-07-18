import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_app_bar.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({Key? key}) : super(key: key);

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}
class _NotesViewBodyState extends State<NotesViewBody> {

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children:[
          SizedBox(height:50),
          CustomAppBar(icon: Icons.search,title: 'Notes'),
          Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}


