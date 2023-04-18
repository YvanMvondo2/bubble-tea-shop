import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:momo_go/configuration.dart';
import 'package:momo_go/layout/custom_icon.dart';
import 'package:momo_go/layout/custom_text.dart';
import 'package:momo_go/momo/colors.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var largeur = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: MomoColors.gray,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: MomoColors.momoBlueColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomIcon(
              icon: Icons.account_circle,
              backgroundColor: MomoColors.uiColor,
              iconColor: MomoColors.uiColor,
              title: 'Compte',
              onPressed:  () {}
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: CustomIcon(
                image: Image.asset(Config.images.logobg),
                backgroundColor: MomoColors.uiColor,
                iconColor: MomoColors.uiColor,
                title: '',
                size: 60,
                onPressed:  () {}
              ),
            ),
            // Image.asset(Config.images.logoBlue),
            CustomIcon(
              icon: Icons.alarm,
              backgroundColor: MomoColors.uiColor,
              iconColor: MomoColors.uiColor,
              title: 'Validations',
              onPressed:  () {}
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 200,
              width: largeur,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      width: largeur,
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            MomoColors.momoBlueColor,
                            MomoColors.momoLightColor
                          ],
                        )
                      ),
                      child: SizedBox(
                        // height: 50,
                        width: largeur,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomText(
                              text: '012345',
                              size: 15,
                              color: Colors.white,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomText(
                                  align: TextAlign.end,
                                  text: '2023-04-18',
                                  overFlow: TextOverflow.ellipsis,
                                  size: 22,
                                  color: Colors.white,
                                ),
                                CustomText(
                                  align: TextAlign.end,
                                  text: '16h 58',
                                  overFlow: TextOverflow.ellipsis,
                                  size: 15,
                                  color: Colors.white,
                                ),
                                const Icon(Icons.remove_red_eye, size: 25, color: MomoColors.primaryButtonColor,)
                              ],
                            ),
                          ],
                        ),
                      )
                    ),
                    Container(
                      height: 100,
                      width: largeur,
                      decoration: const BoxDecoration(
                        color: MomoColors.momoBlueColor,
                        borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)
                        ),
                       boxShadow: [
                          BoxShadow(
                              color: MomoColors.momoDarkColor, //New
                              blurRadius: 2.0,
                              offset: Offset(0, -2))
                        ],
                      ),
                      child: SizedBox(
                        // height: 50,
                        width: largeur,
                        child: CustomIcon(
                          icon: Icons.sync_alt,
                          title: 'Historique de transactions',
                          backgroundColor: MomoColors.uiColor,
                          fontSize: 15,
                        )
                      ),
                    )
                  ],
                ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 100,
            width: largeur,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CustomIcon(
                    image: SvgPicture.asset(
                      Config.momoIcons.deposit,
                      semanticsLabel: 'Scan'
                    ),
                    backgroundColor: Colors.black,
                    iconColor: Colors.black,
                    title: 'Scan',
                    onPressed: () {},
                  ),
                ),
                Container(alignment: Alignment.center, color: MomoColors.gray, width: 1, height: 80,),
                Expanded(
                  flex: 1,
                  child: CustomIcon(
                    image: SvgPicture.asset(
                      Config.momoIcons.facilitate,
                      semanticsLabel: 'Transactions'
                    ),
                    backgroundColor: Colors.black,
                    iconColor: Colors.black,
                    title: 'Transactions',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 100,
            width: largeur,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: CustomIcon(
                image: SvgPicture.asset(
                  Config.momoIcons.earn,
                  semanticsLabel: 'pay'
                ),
                backgroundColor: Colors.black,
                iconColor: Colors.black,
                title: 'Pay Via MoMo',
                onPressed: () {},
              ),
            ),
          )
        ],
      )
    );
  }
}