import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'verification_input_code_controller.dart';

class VerificationInputCodeWidget extends StatefulWidget {
  const VerificationInputCodeWidget({super.key,  required this.controller});
  
final VerificationCodeInputController controller;
  @override
  State<VerificationInputCodeWidget> createState() =>
      _VerificationInputCodeWidgetState();
}

class _VerificationInputCodeWidgetState
    extends State<VerificationInputCodeWidget> {
   


 

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(widget.controller.controllers.length, (index) {
          return SizedBox(
            width: 50.0,
            height: 50.0,
            child: Center(
              child: TextField(
                controller: widget.controller.controllers[index],
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                focusNode: widget.controller.focusNodes[index],
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9/]')),
                  LengthLimitingTextInputFormatter(1),
                ],
                onChanged: (String value) {
                  if (value.length == 1) {
                    widget.controller.focusNodes[index].unfocus();
                    if (index < widget.controller.controllers.length - 1) {
                      FocusScope.of(context).requestFocus(
                          widget.controller.focusNodes[index + 1]);
                    }
                  }
                },
              ),
            ),
          );
        }));
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }
}
