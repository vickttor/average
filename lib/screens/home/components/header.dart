import 'package:average/constants.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(grey), Color(grey), Color(white)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            "Average".toUpperCase(),
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: Color(black),
              fontFamily: "Poppins",
              fontWeight: FontWeight.w900,
              fontSize: 24,
              letterSpacing: 2.0,
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: Image.asset(
                  "assets/author.png",
                  width: 120,
                  height: 120,
                ),
              ),
              const SizedBox(width: 12.0),
              const Expanded(
                child: Column(children: [
                  AuthorInfo(
                    label: 'Autor:',
                    text: "Victor Hugo da Silva",
                  ),
                  SizedBox(height: 12.0),
                  AuthorInfo(
                    label: 'RA:',
                    text: "1431432312001",
                  ),
                ]),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class AuthorInfo extends StatelessWidget {
  const AuthorInfo({
    super.key,
    required this.label,
    required this.text,
  });

  final String label;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16.0,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w700,
            color: Color(black),
          ),
        ),
        const SizedBox(height: 6.0, width: 6.0),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14.0,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w400,
            color: Color(black),
          ),
        ),
      ],
    );
  }
}
