import 'dart:ui';

import 'package:average/constants.dart';
import 'package:flutter/material.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({super.key, required this.average});

  final double average;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5,
          sigmaY: 5,
        ),
        child: Container(
          padding: const EdgeInsets.only(
            top: 12.0,
            left: 16.0,
            right: 16.0,
            bottom: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Média:",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      color: Color(black),
                      fontSize: 24.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    average.toStringAsFixed(2),
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      color: Color(black),
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              // const SizedBox(height: 16.0),
              // TextButton(
              //   style: const ButtonStyle(
              //     backgroundColor: MaterialStatePropertyAll(Color(black)),
              //     padding: MaterialStatePropertyAll(
              //       EdgeInsets.symmetric(vertical: 12.0),
              //     ),
              //     shape: MaterialStatePropertyAll(
              //       RoundedRectangleBorder(
              //         borderRadius: BorderRadius.all(Radius.circular(4.0)),
              //       ),
              //     ),
              //   ),
              //   onPressed: () {},
              //   child: Text(
              //     "Gerar Média".toUpperCase(),
              //     style: const TextStyle(
              //       color: Color(white),
              //       fontSize: 14.0,
              //       fontFamily: "Balsamiq_Sans",
              //       fontWeight: FontWeight.w400,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
