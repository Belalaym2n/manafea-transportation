import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LanguageSwitchTile extends StatelessWidget {
  final String languageName;
  final bool isSelected;
  final VoidCallback onTap;

  const LanguageSwitchTile({
    required this.languageName,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              languageName,
              style: TextStyle(
                fontSize: 18,
                color: isSelected ? Colors.deepOrange : Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: 50,
              height: 28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: isSelected ? Colors.deepOrange : Colors.grey[300],
              ),
              child: AnimatedAlign(
                duration: Duration(milliseconds: 300),
                alignment: isSelected ? Alignment.centerRight : Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
