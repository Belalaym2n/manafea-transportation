import 'package:flutter/cupertino.dart';

import '../widgets/favItem.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child:

    Column(
      children: [
        Expanded(

            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) =>  FavItem(),))
      ],
    )
   );
  }
}
