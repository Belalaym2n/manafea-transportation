import 'package:flutter/material.dart';
import 'package:manafea/config/appColors.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoIconDialog extends StatelessWidget {
  final String description;
  final String location;
  final String url;

  const InfoIconDialog({
    super.key,
    required this.description,
    required this.location,
    required this.url,
  });


  void _showDetailsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Details',
            style: TextStyle(fontWeight: FontWeight.bold)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('📝 Description:\n$description',style: TextStyle(


            ),),
            const SizedBox(height: 12),
            Text('📍 Location:\n$location'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close',style: TextStyle(
              color:  AppColors.primaryColor
            ),),
          ),
          openGoogleMaps(url)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.info_outline, color: Colors.blueAccent),
      onPressed: () => _showDetailsDialog(context),
      tooltip: 'View Details',
    );
  }
}

void _openGoogleMaps(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    debugPrint('Could not launch $url');
  }
}

openGoogleMaps(String url){
  return           ElevatedButton.icon(
    style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
            AppColors.primaryColor
        )
    ),
    onPressed: (){_openGoogleMaps(url);},
    icon: const Icon(Icons.map,color:    Colors.white,),
    label: const Text('Open in Maps',style: TextStyle(
        color: Colors.white
    ),),
  );
}