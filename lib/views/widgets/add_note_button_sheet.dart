// ignore_for_file: annotate_overrides, overridden_fields

import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/custom_sheet_button.dart';
import 'package:note_app/views/widgets/custom_text_feild.dart';

class AddNoteButtonSheet extends StatelessWidget {
  const AddNoteButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 20,
        right: 20,
        top: 30,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextFeild(hint: 'Title'),
            SizedBox(height: 19),
            CustomTextFeild(hint: 'Content', maxLines: 5),
            SizedBox(height: 20),
            CustomButton(text: 'Add', onTap: () {}),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
