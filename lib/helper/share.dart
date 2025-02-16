import 'package:oruphones/core/ui_component/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class ShareOnSocialMedia {
  static const String text =
      "I'd like to introduce you to Oru Phones, a user-friendly and convenient platform designed for buying and selling refurbished smartphones. With just three simple steps, you can easily sell your phones at competitive prices or purchase high-quality refurbished phones that look and work like new";

  Future<void> shareToWhatsApp() async {
    final Uri whatsappUrl =
        Uri.parse("whatsapp://send?text=${Uri.encodeComponent(text)}");
    try {
      if (await canLaunchUrl(whatsappUrl)) {
        await launchUrl(whatsappUrl, mode: LaunchMode.platformDefault);
      } else {
        showToast('Could not open WhatsApp link');
      }
    } catch (e) {
      showToast("WhatsApp sharing failed");
    }
  }

  Future<void> shareToInstagram() async {
    final Uri instagramUrl =
        Uri.parse("https://www.instagram.com/oruphones/?hl=en");
    try {
      if (await canLaunchUrl(instagramUrl)) {
        await launchUrl(instagramUrl, mode: LaunchMode.platformDefault);
      } else {
        showToast('Could not open Instagram link');
      }
    } catch (e) {
      showToast("Instagram sharing failed");
    }
  }

  Future<void> shareToX() async {
    final Uri twitterUrl = Uri.parse(
        "https://twitter.com/intent/tweet?text=${Uri.encodeComponent(text)}");
    try {
      if (await canLaunchUrl(twitterUrl)) {
        await launchUrl(twitterUrl, mode: LaunchMode.platformDefault);
      } else {
        showToast('Could not open X link');
      }
    } catch (e) {
      showToast("X sharing failed");
    }
  }

  Future<void> shareToTelegram() async {
    final Uri telegramUrl = Uri.parse(
        "https://t.me/share/url?url=&text=${Uri.encodeComponent(text)}");
    try {
      if (await canLaunchUrl(telegramUrl)) {
        await launchUrl(telegramUrl, mode: LaunchMode.platformDefault);
      } else {
        showToast('Could not open Telegram link');
      }
    } catch (e) {
      showToast("Telegram sharing failed");
    }
  }
}
