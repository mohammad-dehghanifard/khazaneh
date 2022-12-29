import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class CreatorController extends GetxController{
  lunchUrl({required String url}) async {
    final uri = Uri.parse(url);
    if(await canLaunchUrl(uri)){
      await launchUrl(uri,mode: LaunchMode.externalApplication);
    }else{
      debugPrint('false');
    }
  }
}