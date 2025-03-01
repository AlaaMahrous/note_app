// ignore_for_file: annotate_overrides, overridden_fields

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/cubit_add_note/add_note_cubit.dart';
import 'package:note_app/views/widgets/add_note_form.dart';

class AddNoteButtonSheet extends StatefulWidget {
  const AddNoteButtonSheet({super.key});

  @override
  State<AddNoteButtonSheet> createState() => _AddNoteButtonSheetState();
}

class _AddNoteButtonSheetState extends State<AddNoteButtonSheet> {
  bool isLoaging = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteSuccess) {
          Navigator.pop(context);
        } else if (state is AddNoteFaild) {
          log('Add Note Faild: ${state.errorMessage}');
        }
      },
      child: SingleChildScrollView(child: AddNoteForm()),
    );
  }
}
