import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final double height;
  final double width;
  final TextEditingController? controller;
  final TextEditingController? passController;
  final String? label;
  final bool? isPassword;
  final bool? isConfirmPassword;
  final GlobalKey<FormState>? formKey;

  const TextFieldWidget(
      {Key? key,
      required this.height,
      required this.width,
      this.controller,
      required this.label,
      this.isPassword = false,
      this.isConfirmPassword = false,
      this.passController,
       this.formKey})
      : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.06,
      width: widget.width,
      child: TextFormField(
        onChanged: (value) {
          widget.formKey!.currentState!.validate();
        },
        controller: widget.controller,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: widget.label!,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Required';
          } else if ((widget.isPassword! || widget.isConfirmPassword!) &&
              value.length < 8) {
            return 'password must be more than 8';
          } else if (widget.isConfirmPassword!) {
            if ((widget.isPassword! || widget.isConfirmPassword!) &&
                value != widget.passController!.text) {
              return 'do not match';
            }
          } else {
            return null;
          }
        },
      ),
    );
  }
}
