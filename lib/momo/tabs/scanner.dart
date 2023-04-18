import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../layout/qr_scanner_overlay.dart';
import 'bills.dart';
 
class ScanView extends StatefulWidget {
  const ScanView({super.key});

  @override
  State<ScanView> createState() => _ScanViewState();
}

class _ScanViewState extends State<ScanView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  MobileScannerController cameraController =
      MobileScannerController(detectionSpeed: DetectionSpeed.normal);
  bool flash = false;

  bool screenOpened = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <
            Widget>[
          IconButton(
            color: Colors.black,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.torchState,
              builder: (context, state, child) {
                switch (state) {
                  case TorchState.off:
                    return const Icon(Icons.bolt, color: Colors.white);
                  case TorchState.on:
                    return const Icon(Icons.bolt, color: Colors.red);
                }
              },
            ),
            //iconSize: 32.0,
            onPressed: () => cameraController.toggleTorch(),
          ),
          IconButton(
            color: Colors.black,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.cameraFacingState,
              builder: (context, state, child) {
                switch (state) {
                  case CameraFacing.front:
                    return const Icon(Icons.cameraswitch, color: Colors.white);
                  case CameraFacing.back:
                    return const Icon(Icons.cameraswitch, color: Colors.red);
                }
              },
            ),
            //iconSize: 32.0,
            onPressed: () => cameraController.switchCamera(),
          ),
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.done_all),
            //iconSize: 32.0,
            onPressed: () {}
          ),
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.error),
            //iconSize: 32.0,
            onPressed: () {}
          ),
          const Padding(
            padding: EdgeInsets.all(32.0),
          ),
        ]),
        // title: const Loader(),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Expanded(
              //   child: MobileScanner(
              //     onDetect: (capture) {
              //       final List<Barcode> barcodes = capture.barcodes;
              //       final Uint8List? image = capture.image;
              //       for (final barcode in barcodes) {
              //         debugPrint('Barcode found! ${barcode.rawValue}');
              //       }
              //     },
              //     //fit: BoxFit.cover,
              //     // allowDuplicates: true,
              //     controller: cameraController,
              //   ),
              // ),
            ],
          )),
          QRScannerOverlay(
            overlayColor: Colors.black.withOpacity(0.5),
          ),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // context.goNamed('scan');
        },
        backgroundColor: Colors.transparent,
        child: OpenContainer(
          transitionDuration: const Duration(milliseconds: 350),
          transitionType: ContainerTransitionType.fade,
          openBuilder: (context, openContainer) =>
              const BillsView(),
          openColor: Colors.blue,
          closedColor: Colors.yellow,
          closedElevation: 1,
          closedBuilder: (context, openContainer) {
            return const Icon(Icons.keyboard_arrow_right_outlined, size: 40,);
          },
        ),
      ),
    );
  }

  void screenWasClosed() {
    screenOpened = false;
  }

  foundBarcode(Barcode barcode, MobileScannerArguments? args) async {
    /// open screen
    try {
      if (!screenOpened) {
        final String code = barcode.rawValue ?? "---";
        print('Barcode found! $code');
        screenOpened = false;
      }
    } catch (e) {
      // print(e.toString());
    }
  }
}
