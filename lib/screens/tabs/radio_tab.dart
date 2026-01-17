import 'package:flutter/material.dart';
import 'package:islami/screens/tabs/widgets/reciter_card_widget.dart';
import 'package:islami/utils/app_colors.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _tabs(),
        const SizedBox(height: 20),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: const [
              ReciterCard(name: "Ibrahim Al-Akdar"),
              ReciterCard(name: "Akram Alalaqmi"),
              ReciterCard(name: "Majed Al-Enezi"),
              ReciterCard(name: "Malik Shaibat Alhamed"),
            ],
          ),
        ),
      ],
    );
  }


  Widget _tabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _tab("Radio", false),
          const SizedBox(width: 10),
          _tab("Reciters", true),
        ],
      ),
    );
  }

  Widget _tab(String text, bool active) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: active ? AppColors.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: active ? Colors.black : Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}



