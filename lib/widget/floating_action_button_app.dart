import 'package:flutter/material.dart';

class floatingActionButtonApp extends StatelessWidget {
  const floatingActionButtonApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, right: 2),
      child: FloatingActionButton.small(
        onPressed: () {},
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: const Color(0xFFFF7029),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
