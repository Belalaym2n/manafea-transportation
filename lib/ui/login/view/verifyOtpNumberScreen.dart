// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:manafea/ui/login/viewModel/loginViewModel.dart';
// import 'package:manafea/ui/login/widgets/verifyScreen.dart';
// import 'package:provider/provider.dart';
//
// class VerifyOTPNumberScreen extends StatefulWidget {
//   const VerifyOTPNumberScreen({super.key});
//
//   @override
//   State<VerifyOTPNumberScreen> createState() => _VerifyOTPNumberScreenState();
// }
//
// class _VerifyOTPNumberScreenState extends State<VerifyOTPNumberScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       builder: (context, child) => LoginViewModel(_otpRepo),
//       create: (context) => Scaffold(
//       body: Stack(
//         children: [
//           VerifyScreen(verifyNumber: v)
//         ],
//       ),
//     ),);
//   }
// }
