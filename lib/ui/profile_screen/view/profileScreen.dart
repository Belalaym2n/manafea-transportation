import 'package:flutter/cupertino.dart';

import '../widgets/profileScreenItem.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({
    super.key,
    required this.name,
    required this.phoneNumber,
  });

  String? phoneNumber;
  String? name;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ProfileScreenItem(
        name: widget.name, phoneNumber: widget.phoneNumber);
  }
}
