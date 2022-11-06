import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static Future<bool> launch(String url) async {
    Uri finalUri = Uri.parse(url);
    return launchUrl(finalUri);
  }
}
