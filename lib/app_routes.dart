import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Transition;
import 'package:go_router/go_router.dart';
import 'package:momo_go/momo/history.dart';
import 'package:momo_go/momo/home.dart';
import 'package:momo_go/momo/login.dart';
import 'package:momo_go/momo/register.dart';
import 'package:momo_go/momo/success.dart';
import 'package:momo_go/momo/tabs/scanner.dart';
import 'package:momo_go/momo/tabs/settings.dart';
import 'package:momo_go/momo/welcome.dart';

import 'layout/wrapper_scaffold.dart';
import 'master.dart';
import 'momo/payment.dart';
import 'momo/tabs/overview.dart';

class AppRoutes {
  static AppRoutes get instance => Get.find();
  final scalfoldHomekey = GlobalKey<ScaffoldState>();

  GoRouter getRouter({required GlobalKey<NavigatorState> shellKey, required GlobalKey<NavigatorState> parentKey}) {
    return GoRouter(navigatorKey: parentKey, routes: [
      GoRoute(
        path: '/welcome',
        builder: (BuildContext context, GoRouterState state) {
          return const WelcomePage();
        },
      ),      
      GoRoute(
        name: 'login',
        path: '/login',
        builder: (context, state) => const LoginPage()
      ),
      GoRoute(
        name: 'register',
        path: '/register',
        builder: (context, state) => const RegisterPage()
      ),
      GoRoute(
        // name: '/',
        path: '/',
        builder: (context, state) => const SuccessView()
      ),    
      ShellRoute(
          navigatorKey: shellKey,
          builder: ((context, state, child) {
            return MasterView(restorationId: 'scaffold-home-id', routeLocation: state.location, child: child);
          }),
          routes: [
            GoRoute(
                name: 'home',
                path: '/home',
                builder: (context, state) {
                  return const WrapperStatefullPage(
                    child: HomePage(),
                  );
                }),
            GoRoute(
                name: 'trans',
                path: '/trans',
                builder: (context, state) {
                  return const WrapperStatefullPage(
                    child: OverviewView(),
                  );
                }),
            GoRoute(
              name: 'qrcode',
              path: '/qrcode',
              builder: (context, state) {
                return const WrapperStatefullPage(
                  child: ScanView(),
                );
              }),
                        GoRoute(
              name: 'pay',
              path: '/pay',
              builder: (context, state) {
                return const WrapperStatefullPage(
                  child: Payment(),
                );
              }),
            GoRoute(
              name: 'account',
              path: '/account',
              builder: (context, state) {
                return const WrapperStatefullPage(
                  child: SettingsView(),
                );
              }),
          ]),
    ]);
  }
}
