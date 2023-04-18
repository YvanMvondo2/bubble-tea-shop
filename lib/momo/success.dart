import 'package:flutter/material.dart';
import 'package:momo_go/layout/custom_text.dart';
import 'package:momo_go/momo/colors.dart';

import '../layout/custom_outline.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
     final largeur = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: MomoColors.momoBlueColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CustomOutline(
                  strokeWidth: 4,
                      radius: 80,
                      padding: const EdgeInsets.all(4),
                      width: 170,
                      height: 170,
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
                        alignment: Alignment.center,
                        image: AssetImage(
                            MomoImages.check),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: CustomText(
                  text: 'Good Job!',
                  size: 30,
                  color: Colors.white,
                  align: TextAlign.center,
                  maxLines: 2,
                )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: CustomText(
                  text: 'The entered Bike ID confine a Bike of Mr. NFOR CARLTON MBUNWE.',
                  size: 22,
                  color: Colors.white,
                  align: TextAlign.center,
                  maxLines: 4,
                )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: InkWell(
                  onTap: () {},
                  child: CustomOutline(
                    strokeWidth: 3,
                    radius: 5,
                    padding: const EdgeInsets.all(3),
                    width: largeur,
                    height: 50,
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        MomoColors.primaryButtonColor,
                        Colors.white
                      ],
                    ),
                    child: Center(
                      child: CustomText(
                        text: 'Retour'.toUpperCase(),
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}