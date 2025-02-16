import 'package:hive/hive.dart';
import 'package:oruphones/constants/constants.dart';
import 'package:oruphones/model/auth/user.dart';

class HiveService {
  late Box<User> _box;
  HiveService() {
    _box = Hive.box<User>(hiveBoxUserData);
  }
  //save
  Future<void> save(User data) async {
    await _box.put(0, data);
  }

  //fetch
  User get user {
    return _box.getAt(0)!;
  }

//clear()
  Future<void> clear() async {
    _box.deleteAt(0);
  }

  //close
  Future<void> close() async {
    _box.close();
  }
}
