import 'package:get/get.dart';
import 'package:momo_go/momo/colors.dart';

class Config {
  static final MomoColors colors = Get.find();
  static final MomoImages images = Get.find();
  static final MomoIcons momoIcons = Get.find();

  final String appName = 'MoMo Go';
}