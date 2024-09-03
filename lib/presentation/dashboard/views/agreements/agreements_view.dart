import 'package:flutter/material.dart';

class AgreementsView extends StatelessWidget {
  const AgreementsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agreements'),
      ),
      body: const Center(
        child: Text('Welcome to Agreements Page'),
      ),
    );
  }
}
