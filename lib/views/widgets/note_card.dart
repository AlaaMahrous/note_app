import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(20),
        ),
        constraints: BoxConstraints(minHeight: 175),
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 32,
            top: 20,
            right: 20,
            left: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Flutter tips',
                    style: TextStyle(fontSize: 27, color: Colors.black),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(Icons.delete, size: 28, color: Colors.black),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Build your career with Alaa Mahrous make your life different',
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color.fromARGB(144, 0, 0, 0),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'May 21,2025',
                  style: TextStyle(
                    fontSize: 15,
                    color: const Color.fromARGB(172, 0, 0, 0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
