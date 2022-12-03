import 'package:isar/isar.dart';

part 'alist.g.dart';

@collection
class AList {
  Id? id = Isar.autoIncrement;
  late String title;
  late String color;

  AList({this.id, required this.title});
}
