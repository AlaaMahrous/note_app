import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/constants/hive_boxes.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/note_app.dart';
import 'package:note_app/simple_bloc_observer.dart';
import 'package:hive_flutter/hive_flutter.dart';
//await Hive.deleteBoxFromDisk(HiveBoxes.notesBox);

void main() async {
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(HiveBoxes.notesBox);

  runApp(const NoteApp());
}
