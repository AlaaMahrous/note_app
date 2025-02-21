import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/add_note_button_sheet.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return AddNoteButtonSheet();
          },
        );
      },
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: Icon(Icons.add),
    );
  }
}
