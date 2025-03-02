// ignore_for_file: annotate_overrides, overridden_fields, unused_import, unused_catch_clause

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/cubit_add_note/add_note_cubit.dart';
import 'package:note_app/helper/show_snack_bar.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/custom_sheet_button.dart';
import 'package:note_app/views/widgets/custom_text_feild.dart';
import 'package:intl/intl.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, noteText;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20,
          right: 20,
          top: 30,
        ),
        child: Column(
          children: [
            CustomTextFeild(
              hint: 'Title',
              onSaved: (value) {
                title = value;
              },
            ),
            SizedBox(height: 19),
            CustomTextFeild(
              hint: 'Content',
              maxLines: 5,
              onSaved: (value) {
                noteText = value;
              },
            ),
            SizedBox(height: 20),
            BlocBuilder<AddNoteCubit, AddNoteState>(
              builder: (context, state) {
                return CustomButton(
                  isLoading: state is AddNoteLoading,
                  text: 'Add',
                  onTap: () {
                    addNoteMethod();
                  },
                );
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void addNoteMethod() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      NoteModel note = NoteModel(
        noteTitle: title!,
        noteText: noteText!,
        date: DateFormat('dd/MM/yyyy').format(DateTime.now()),
      );
      try {
        BlocProvider.of<AddNoteCubit>(context).addNote(note);
        showMessage((context), 'Adding note process succed', Colors.blue);
      } on Exception catch (e) {
        //showMessage((context), 'Adding note process faild: $e', Colors.red);
      }
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
