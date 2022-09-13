import 'package:flutter/material.dart';

class ConfigSheet extends StatefulWidget {
  const ConfigSheet({Key? key}) : super(key: key);

  @override
  State<ConfigSheet> createState() => _ConfigSheetState();
}

class _ConfigSheetState extends State<ConfigSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
    );
  }
}
