import 'package:flutter/material.dart';

class DocumentPreviewView extends StatelessWidget {
  const DocumentPreviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DocumentPreviewView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DocumentPreviewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
