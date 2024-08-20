import 'package:contact_book_app/utils/themes/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class TextFormFieldComponent extends StatefulWidget {
  TextFormFieldComponent(
      {super.key,
      this.isObscureText,
      required this.label,
      required this.keyboardType,
      required this.controllerText,
       this.icon,
      required this.value});
  String label;
  Icon? icon;
  TextInputType keyboardType;
  String value;
  TextEditingController controllerText;
  Key? keyValue;
  bool? isObscureText;

  @override
  State<TextFormFieldComponent> createState() => _TextFormFieldComponentState();
}

class _TextFormFieldComponentState extends State<TextFormFieldComponent> {
  bool? visibilityPassowrd = false;
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: visibilityPassowrd! == false  && widget.label == "Password" ? widget.isObscureText = true : false,
      key: widget.keyValue,
      textInputAction:TextInputAction.next,
      controller: widget.controllerText,
      keyboardType: widget.keyboardType,
      onChanged: (value) {
        widget.value = value;
      },
      
      decoration: InputDecoration(
        icon: widget.icon,
        iconColor: AppTheme.detailsColor,
        filled: true,
        fillColor: Colors.white,
        hintText: widget.label,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.4)),
          gapPadding: 20,
          borderRadius: BorderRadius.circular(10),
        ),
          focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),  // Cor do contorno quando está focado
          gapPadding: 50,
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: widget.isObscureText == true ?
        GestureDetector(
          onTap: () {
            setState(() {
              visibilityPassowrd = !visibilityPassowrd!;
              print(visibilityPassowrd);
            });
          },
          child: visibilityPassowrd! == false 
          ? const Icon(Icons.visibility_off)
          : const Icon(Icons.visibility),
        )
        : widget.label == "Email Address" ? const Icon(Icons.email) 
        : widget.label == "Phone" ? const Icon(Icons.phone) 
        : widget.label == "Name" ? const Icon(Icons.abc)
        : const Icon(Icons.account_balance)
      ),
    );
  }
}



