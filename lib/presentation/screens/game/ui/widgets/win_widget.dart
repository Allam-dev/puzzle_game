import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:hack_puzzle/core/helpers/constants/app_colors.dart';

class WinWidget extends StatefulWidget {
  const WinWidget({Key? key}) : super(key: key);

  @override
  State<WinWidget> createState() => _WinWidgetState();
}

class _WinWidgetState extends State<WinWidget> {
  late ConfettiController confettiController;
  @override
  void initState() {
    confettiController =
        ConfettiController(duration: const Duration(seconds: 2));
    confettiController.play();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: confettiController,
            colors: [
              AppColors.gray,
              AppColors.black,
            ],
          ),
        ),
        Dialog(
          child: Column(
            children: [
              const Text("مبروووووك !"),
              Row(
                children: [
                  MaterialButton(onPressed: (){},child: const Text("1"),),
                  MaterialButton(onPressed: (){},child: const Text("2"),)
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
