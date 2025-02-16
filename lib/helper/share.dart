import 'package:url_launcher/url_launcher.dart';

class ShareOnSocialMedia {
  static String text =
      "I'd like to introduce you to Oru Phones, a user-friendly and convenient platform designed for buying and selling refurbished smartphones. With just three simple steps, you can easily sell your phones at competitive prices or purchase high-quality refurbished phones that look and work like new";

  static Future<void> shareOnX() async {
    final encodedText = Uri.encodeComponent(text);
    final twitterUrl = Uri.parse('twitter://post?message=$encodedText');
    final fallbackUrl =
        Uri.parse('https://twitter.com/intent/tweet?text=$encodedText');

    if (await canLaunchUrl(twitterUrl)) {
      await launchUrl(twitterUrl, mode: LaunchMode.externalApplication);
    } else if (await canLaunchUrl(fallbackUrl)) {
      await launchUrl(fallbackUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch Twitter';
    }
  }

  static Future<void> telegram() async {
    final encodedText = Uri.encodeComponent(text);
    final telegramUrl = Uri.parse('tg://msg?text=$encodedText');
    final fallbackUrl = Uri.parse('https://t.me/share/url?text=$encodedText');

    if (await canLaunchUrl(telegramUrl)) {
      await launchUrl(telegramUrl, mode: LaunchMode.externalApplication);
    } else if (await canLaunchUrl(fallbackUrl)) {
      await launchUrl(fallbackUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch Telegram';
    }
  }

  static Future<void> whatsApp() async {
    final encodedText = Uri.encodeComponent(text);
    final whatsappUrl = Uri.parse('whatsapp://send?text=$encodedText');
    final fallbackUrl = Uri.parse('https://wa.me/?text=$encodedText');

    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    } else if (await canLaunchUrl(fallbackUrl)) {
      await launchUrl(fallbackUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch WhatsApp';
    }
  }

  static Future<void> instagram() async {
    final instagramUrl = Uri.parse('instagram://app');
    if (await canLaunchUrl(instagramUrl)) {
      await launchUrl(instagramUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch Instagram';
    }
  }
}
