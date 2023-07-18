import 'package:hive/hive.dart';


part 'note_model.g.dart';  // the file that will generate
@HiveType(typeId: 0)
class NoteModel extends HiveObject{
  @HiveField(0)
   int color;
  @HiveField(1)
   String title;
  @HiveField(2)
  final String date;
  @HiveField(3)
   String subTitle;

  NoteModel({
    required this.title,
    required this.color,
    required this.date ,
    required this.subTitle});
}