
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../layout/custom_text.dart';
import 'custom_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = ['3.png', '2.png', '1.png'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/' + images[index]),
                  fit: BoxFit.cover)),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Bienvenue chez',
                        ),
                        CustomText(
                          text: 'MoMo Go',
                          size: 30,
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 250,
                          child: CustomText(
                            text:
                              'MoMo pour votre transport',
                            color: Colors.white,
                            size: 14,
                          ),
                        ),
                        const SizedBox(height: 40),
                        CustomButton(
                          width: 120,
                          onClicked: (){
                             context.goNamed('login');
                          },
                        )
                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexDots) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: index == indexDots ? 25 : 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index == indexDots ? const Color(0xFFFFFFFF) : const Color(0xFFFFFFFF).withOpacity(0.7)
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
