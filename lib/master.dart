import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:momo_go/configuration.dart';
import 'package:momo_go/momo/colors.dart';

import 'controller/master_controller.dart';
import 'layout/custom_icon.dart';
import 'main.dart';

class MasterView extends StatefulWidget {
  final Widget child;
  final VoidCallback? dispose;
  final VoidCallback? initState;
  final String? routeLocation;

  final String restorationId;

  const MasterView({
    required this.child,
    required this.restorationId,
    this.dispose,
    this.initState,
    this.routeLocation,
    super.key,
  });

  @override
  State<MasterView> createState() => _MasterViewState();
}

class _MasterViewState extends State<MasterView> with RestorationMixin {
  final RestorableString _index = RestorableString('home');
  final controllerScaffold = Get.find<MasterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      restorationId: 'scaffold_restoration_global_id',
      body: Stack(
        children: [
          widget.child,
          StatefulBuilder(builder: (context, state) {
            return Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 100,
                    width: context.width,
                    decoration: const BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          child: Container(
                            height: 70,
                            width: context.width,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey, //New
                                      blurRadius: 25.0,
                                      offset: Offset(0, -10))
                                ],
                                color: MomoColors.uiColor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomIcon(
                                  icon: Icons.home,
                                  backgroundColor:
                                      getColorStatus(context, 'home'),
                                  iconColor: getColorStatus(context, 'trans'),
                                  title: 'Accueil',
                                  onPressed: () => _goTo('home', state),
                                ),
                                CustomIcon(
                                  icon: Icons.history,
                                  backgroundColor:
                                      getColorStatus(context, 'trans'),
                                  iconColor: getColorStatus(context, 'trans'),
                                  title: 'Trans',
                                  onPressed: () => _goTo('trans', state),
                                ),
                                const SizedBox(
                                  width: 40,
                                ),
                                CustomIcon(
                                  icon: Icons.card_giftcard_outlined,
                                  backgroundColor:
                                      getColorStatus(context, 'pay'),
                                  iconColor: getColorStatus(context, 'pay'),
                                  title: 'payer',
                                  onPressed: () => _goTo('pay', state),
                                ),
                                CustomIcon(
                                  icon: Icons.account_circle,
                                  backgroundColor:
                                      getColorStatus(context, 'account'),
                                  iconColor: getColorStatus(context, 'account'),
                                  title: 'Compte',
                                  onPressed: () => _goTo('account', state),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: (context.width - 70) / 2,
                          child: CustomIcon(
                            image: Material(
                              shape: const CircleBorder(side: BorderSide.none),
                              elevation: 10,
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: AssetImage(Config.images.scan),
                              ),
                            ),
                            title: 'QR Code',
                            size: 70,
                            onPressed: () => _goTo('qrcode', state),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          })
        ],
      ),
    );
  }

  Color? getColorStatus(BuildContext context, String pageName) {
    return (_index.value.contains('/')
                ? _index.value
                : context.namedLocation(_index.value)) ==
            context.namedLocation(pageName)
        ? MomoColors.momoBlueColor
        : MomoColors.gray;
  }

  @override
  void dispose() {
    widget.dispose?.call();
    _index.dispose();
    super.dispose();
  }

  @override
  String? get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_index, 'bottom_navigation_index');
    if (oldBucket == null) {
      if (widget.routeLocation != null) {
        _index.value = widget.routeLocation!;
      }
    }
    if (!initialRestore) {
      setState(() {});
    }
  }

  void _goTo(String routeName, state) {
    if (_index.value == routeName) {
      return;
    }
    state((() => _index.value = routeName));
    context.goNamed(routeName);
    // Navigator.of(context).restorablePushNamed(MyApp.registerRoute);
  }
}
