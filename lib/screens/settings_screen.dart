import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final double calories;

  const SettingsScreen({super.key, required this.calories});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = widget.calories.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.number,
            controller: controller,
            decoration: InputDecoration(
              labelText: 'Entry calories per day',
              border: OutlineInputBorder(),
              suffix: Text("kcal"),
            ),
          ),
          ElevatedButton(onPressed: () {}, child: Text("Save")),
        ],
      ),
    );
  }
}
