
import 'package:books_store/core/presentation/widgets/custom_snakbar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl(context, String? url) async {
  if (url !=null) {
  Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
    customsnakbar(context,'Success',  Colors.green);
  } else {
    customsnakbar(context,'Could not launch $url', Colors.red);
  }
}
}