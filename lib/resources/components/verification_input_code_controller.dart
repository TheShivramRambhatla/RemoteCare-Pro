import 'package:flutter/material.dart';

class VerificationCodeInputController {
  final List<TextEditingController> controllers = [];
  final List<FocusNode> focusNodes = [];

  VerificationCodeInputController(int count) {
    for (int i = 0; i < count; i++) {
      controllers.add(TextEditingController());
      focusNodes.add(FocusNode());
    }
  }

  String getVerificationCode() {
    return controllers.map((controller) => controller.text).join();
  }

  void clear() {
    for (var controller in controllers) {
      controller.clear();
    }
  }

  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
  }
}

