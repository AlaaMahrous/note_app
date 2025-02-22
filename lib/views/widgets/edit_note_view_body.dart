import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/custom_sheet_button.dart';
import 'package:note_app/views/widgets/custom_text_feild.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextFeild(hint: 'Title'),
            SizedBox(height: 19),
            CustomTextFeild(hint: 'Content', maxLines: 5),
            SizedBox(height: 20),
            CustomButton(text: 'Edit', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
