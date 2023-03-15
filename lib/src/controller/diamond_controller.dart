import 'package:get/get.dart';

class DiamondController extends GetxController {
  late RxList<String> diamons;
  late RxInt diamondIndex;

  @override
  void onInit() {
    diamondIndex = 0.obs;
    diamons = [
      'assets/images/1.svg',
      'assets/images/2.svg',
      'assets/images/3.svg',
      'assets/images/4.svg',
    ].obs;
    super.onInit();
  }

  @override
  void onClose() {
    diamondIndex.close();
    diamons.close();
    super.onClose();
  }

  void setIndex(int newIndex) {
    diamondIndex = newIndex.obs;
    update();
  }
}
