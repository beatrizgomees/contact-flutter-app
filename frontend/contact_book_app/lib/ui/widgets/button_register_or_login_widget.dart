import 'package:flutter/material.dart';

class ButtonRegisterOrLoginWidget extends StatelessWidget {
   ButtonRegisterOrLoginWidget({
    super.key,
    required this.viewModel,
    required this.labelButton,
    required this.onTap
  });

  var viewModel;
  String labelButton;
  final Function() onTap;
  

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
      height: 60,
      width: MediaQuery.of(context).size.width ,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(50)
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(labelButton, style: const TextStyle(
              color: Colors.white,
              fontSize: 18
            ),
            ),
            const Icon(Icons.arrow_forward, color: Colors.white, size: 25)
          ],
        ),
      ),
      ),
    );
  }
}