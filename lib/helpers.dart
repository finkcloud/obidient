import 'package:url_launcher/url_launcher.dart';

Future<void> launchIntent(Uri uri) async {
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $uri';
  }
}