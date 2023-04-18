import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MasterController extends GetxController {
  // Create scroll controller that will be given to scrollable widget and hidable.
  ScrollController scrollController = ScrollController();
  RxBool showBottom = true.obs;

  @override
  void onInit() {
    scrollController.addListener(() {
      // print(scrollController.offset);
      // if (scrollController.position.userScrollDirection ==
      //     ScrollDirection.reverse) {
      //   showBottom.value = false;
      // } else if (scrollController.position.userScrollDirection ==
      //     ScrollDirection.forward) {
      //   showBottom.value = true;
      // }
      
      switch (scrollController.position.userScrollDirection ) {
          case ScrollDirection.reverse:
            showBottom.value = false;
            break;
          case ScrollDirection.forward:
            showBottom.value = true;
            break;
          case ScrollDirection.idle:
            break;
        }
    });
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
