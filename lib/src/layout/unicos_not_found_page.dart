import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class UnicosNotFoundPage extends StatelessWidget {
  final VoidCallback? onToHome;

  const UnicosNotFoundPage({super.key, this.onToHome});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: UnicosCard(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '404',
                style: TextStyle(
                  color: Color(0xFF00A990),
                  fontSize: 128,
                  fontWeight: FontWeight.w800,
                  height: 1,
                ),
              ),
              Text(
                'Page Not Found',
                style: TextStyle(
                  color: Color(0xFF1A1A1A),
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Sorry, the page you are looking for does not exist.',
                style: TextStyle(
                  color: Color(0xFF6B7280),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 32),
              UnicosButton.label(
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.w700,
                ),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                label: 'Go To Home',
                onPressed: onToHome,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
