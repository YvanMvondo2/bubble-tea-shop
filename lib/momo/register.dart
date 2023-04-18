import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../layout/custom_input_field.dart';
import '../layout/custom_outline.dart';
import '../layout/custom_text.dart';
import 'colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with RestorationMixin {
  final RestorableTextEditingController _phoneController =
      RestorableTextEditingController();
  final RestorableTextEditingController _usernameController =
      RestorableTextEditingController();

  @override
  String get restorationId => 'register_page';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_phoneController, restorationId);
    registerForRestoration(_usernameController, restorationId);
  }

  void _register(BuildContext context) {
    
  }

  @override
  Widget build(BuildContext context) {
    final largeur = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: MomoColors.momoBlueColor,
        extendBody: true,
        body: SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Image.asset(
              //   'assets/images/bg.png',
              //   fit: BoxFit.cover,
              // ),
              SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      CustomOutline(
                        strokeWidth: 4,
                        radius: 80,
                        padding: const EdgeInsets.all(4),
                        width: 160,
                        height: 160,
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                               MomoColors.primaryBackground,
                              MomoColors.primaryBackground.withOpacity(0.1),
                              MomoColors.momoDarkColor.withOpacity(0.1),
                              MomoColors.momoDarkColor,
                            ],
                            stops: const [
                              0.2,
                              0.4,
                              0.6,
                              1
                            ]),
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              alignment: Alignment.bottomLeft,
                              image: AssetImage('assets/images/logo.png'),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: largeur,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          //color: Colors.blue,
                        ),
                        child: Column(
                          children: [
                            CustomText(
                              text: 'Register MoMo Go'.toUpperCase(),
                              color: MomoColors.uiColor,
                              size: 20,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            BInputField(
                              height: 60,
                              type: BInputType.text,
                              // controller: phoneController,
                              borderRadius: 5,
                              onSelected: ((value) => {}),
                              label: 'UserName',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            BInputField(
                              height: 60,
                              type: BInputType.phone,
                              // controller: phoneController,
                              borderRadius: 5,
                              onSelected: ((value) => {}),
                              label: 'Phone Number',
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            GestureDetector(
                              onTap: () =>  context.goNamed('home'),
                              child: CustomOutline(
                                strokeWidth: 3,
                                radius: 5,
                                padding: const EdgeInsets.all(3),
                                width: largeur,
                                height: 50,
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    MomoColors.primaryBackground,
                                    Colors.white
                                  ],
                                ),
                                child: Center(
                                  child: CustomText(
                                    text: 'sign up'.toUpperCase(),
                                    color: Colors.black,
                                    size: 14,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                            InkWell(
                              onTap: () {
                                if (context.canPop()) {
                                  context.pop();
                                } else {
                                  context.goNamed('login');
                                }
                              },
                              child: SizedBox(
                                child: Text.rich(
                                  TextSpan(
                                      text: 'Already account ?',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                            color: MomoColors.uiColor.withOpacity(0.5),
                                            fontSize: 12,
                                          ),
                                      children: const [
                                        TextSpan(
                                            text: '     sign in',
                                            style: TextStyle(
                                              color: MomoColors.uiColor,
                                            ))
                                      ]),
                                  style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _usernameController.dispose();
    super.dispose();
  }
}

class _MainView extends StatelessWidget {
  const _MainView({
    this.phoneController,
    this.usernameController,
  });

  final TextEditingController? phoneController;
  final TextEditingController? usernameController;

  void _login(BuildContext context) {
    
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> listViewChildren;

    listViewChildren = [
      const _SmallLogo(),
      // const SizedBox(height: 34),
      Text(
        'Register'.toUpperCase(),
        style: const TextStyle(color: Colors.yellow),
      ),
      const SizedBox(height: 20),
      _UsernameInput(
        usernameController: usernameController,
      ),
      const SizedBox(height: 12),
      _PhoneInput(
        phoneController: phoneController,
      ),
      const SizedBox(height: 12),
      // _PasswordInput(
      //   passwordController: passwordController,
      // ),
      _ThumbButton(
        onTap: () {
          _login(context);
        },
      ),
      const SizedBox(height: 12),
      InkWell(
        onTap: () => Navigator.pop(context),
        child: SizedBox(
          child: Text.rich(
            TextSpan(
                text: 'Deja un compte ?',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.white.withOpacity(0.4),
                      fontSize: 12,
                    ),
                children: [
                  TextSpan(
                      text: '     Connectez-vous',
                      style: TextStyle(
                        color: Colors.yellow.withOpacity(0.4),
                      ))
                ]),
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
          ),
        ),
      )
    ];

    return Column(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.topCenter,
            child: ListView(
              restorationId: 'login_list_view',
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: listViewChildren,
            ),
          ),
        ),
      ],
    );
  }
}

class _SmallLogo extends StatelessWidget {
  const _SmallLogo();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Center(
        child: CustomOutline(
          strokeWidth: 4,
          radius: 80,
          padding: const EdgeInsets.all(4),
          width: 200,
          height: 200,
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.yellow,
                Colors.yellow.withOpacity(0),
                Colors.blue.withOpacity(0.1),
                Colors.blue
              ],
              stops: const [
                0.2,
                0.4,
                0.6,
                1
              ]),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomLeft,
                image: AssetImage(
                  'assets/images/logo.png',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PhoneInput extends StatelessWidget {
  const _PhoneInput({
    this.maxWidth,
    this.phoneController,
  });

  final double? maxWidth;
  final TextEditingController? phoneController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth ?? double.infinity),
        child: TextField(
          autofillHints: const [AutofillHints.telephoneNumber],
          textInputAction: TextInputAction.next,
          controller: phoneController,
          decoration: const InputDecoration(
            labelText: 'Telephone utilisateur',
          ),
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  const _UsernameInput({
    this.maxWidth,
    this.usernameController,
  });

  final double? maxWidth;
  final TextEditingController? usernameController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth ?? double.infinity),
        child: TextField(
          controller: usernameController,
          autofillHints: const [AutofillHints.givenName],
          decoration: const InputDecoration(
            labelText: 'Nom utilisateur',
          ),
        ),
      ),
    );
  }
}

class _ThumbButton extends StatefulWidget {
  const _ThumbButton({
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  _ThumbButtonState createState() => _ThumbButtonState();
}

class _ThumbButtonState extends State<_ThumbButton> {
  BoxDecoration? borderDecoration;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      enabled: true,
      label: 'Login',
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.onTap,
          child: Focus(
            onKey: (node, event) {
              if (event is RawKeyDownEvent) {
                if (event.logicalKey == LogicalKeyboardKey.enter ||
                    event.logicalKey == LogicalKeyboardKey.space) {
                  widget.onTap();
                  return KeyEventResult.handled;
                }
              }
              return KeyEventResult.ignored;
            },
            onFocusChange: (hasFocus) {
              if (hasFocus) {
                setState(() {
                  borderDecoration = BoxDecoration(
                    border: Border.all(
                      color: Colors.white.withOpacity(0.5),
                      width: 2,
                    ),
                  );
                });
              } else {
                setState(() {
                  borderDecoration = null;
                });
              }
            },
            child: Container(
              decoration: borderDecoration,
              height: 120,
              child: ExcludeSemantics(
                child: Image.asset(
                  'assets/images/logo.png',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    required this.onTap,
    this.maxWidth,
  });

  final double? maxWidth;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth ?? double.infinity),
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Row(
          children: [
            const Icon(Icons.check_circle_outline,
                color: MomoColors.buttonColor),
            const SizedBox(width: 12),
            const Text('se souvenir'),
            const Expanded(child: SizedBox.shrink()),
            _FilledButton(
              text: 'Login',
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}

class _BorderButton extends StatelessWidget {
  const _BorderButton({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: MomoColors.buttonColor),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: () {
        
      },
      child: Text(text),
    );
  }
}

class _FilledButton extends StatelessWidget {
  const _FilledButton({required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: MomoColors.buttonColor,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onTap,
      child: Row(
        children: [
          const Icon(Icons.lock),
          const SizedBox(width: 6),
          Text(text),
        ],
      ),
    );
  }
}
