import 'package:crewin_intern_project/widget/cwSizedBox.dart';
import 'package:flutter/material.dart';

class CwInputBox extends StatefulWidget {
  final void Function(String)? onChange;
  final TextInputType keyboardType;
  final String header;
  const CwInputBox(
      {Key? key,
      required this.onChange,
      required this.keyboardType,
      required this.header})
      : super(key: key);

  @override
  State<CwInputBox> createState() => _CwInputBoxState();
}

class _CwInputBoxState extends State<CwInputBox> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Align(alignment: Alignment.centerLeft, child: Text(widget.header)),
        CwSizedBox(
          h: 0.015,
        ),
        Container(
          height: height * 0.07,
          width: width * 0.5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey.withOpacity(0.5))),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                child: TextFormField(
                  keyboardType: widget.keyboardType,
                  validator: (value) {
                    if (!(value!.contains("@") &&
                        (value.contains(".com") || value.contains(".co")))) {
                      return "Invalid Email!";
                    }
                  },
                  onChanged: widget.onChange,
                  decoration: InputDecoration(
                      isCollapsed: true, border: InputBorder.none),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
