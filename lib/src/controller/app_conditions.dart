import 'package:battery_info/battery_info_plugin.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class AppConditions {
  static builder() async {
    try {
      String str = await remote();
      bool batteryLvl = await checkBatteryLevel();
      // bool isVpnActive = await CheckVpnConnection.isVpnActive();

      if (str.isEmpty || batteryLvl) {
        return '';
      } else {
        return str;
      }
    } catch (ex) {
      throw Exception(ex);
    }
  }

  static Future<bool> checkBatteryLevel() async {
    final batteryLevel =
        (await BatteryInfoPlugin().androidBatteryInfo)?.batteryLevel;

    if (batteryLevel == 100) {
      return true;
    } else {
      return false;
    }
  }

  static Future<String> remote() async {
    final RemoteConfig remoteConfig = RemoteConfig.instance;
    await remoteConfig.fetch();
    await remoteConfig.activate();
    return remoteConfig.getString('url');
  }
}
