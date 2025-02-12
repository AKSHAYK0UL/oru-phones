import 'package:fluttertoast/fluttertoast.dart';
import 'package:oruphones/core/theme/hexcolor.dart';

Future<void> showToast(String message) async {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: blackColor,
    textColor: greyColor01,
    fontSize: 16.0,
  );
}
