import 'package:flutter/cupertino.dart';

import '../widgets/addActivityAitem.dart';

class AddActivity extends StatefulWidget {
  const AddActivity({super.key});

  @override
  State<AddActivity> createState() => _AddActivityState();
}

class _AddActivityState extends State<AddActivity> {
  @override
  Widget build(BuildContext context) {
    return AddActivityItem();
  }
}
