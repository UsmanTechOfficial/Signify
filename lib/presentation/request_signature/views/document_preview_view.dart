import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DocumentPreviewView extends GetView {
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
