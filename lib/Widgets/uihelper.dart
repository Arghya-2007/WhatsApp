import 'package:flutter/material.dart';

class UiHelper {
  static Widget customButton({
    required VoidCallback callback,
    required String buttonName,
  }) {
    return SizedBox(
      height: 45,
      width: 300,
      child: ElevatedButton(
        onPressed: () {
          callback();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Text(
          buttonName,
          style: const TextStyle(fontSize: 14, color: Colors.white),
        ),
      ),
    );
  }

  static Widget customText({
    required String text,
    required double size,
    Color? color,
    FontWeight fontWeight = FontWeight.bold,
    TextAlign textAlign = TextAlign.center,
    TextOverflow textOverflow = TextOverflow.ellipsis,
    int? maxLines,
    double? height,
    double? width,
  }) {
    return SizedBox(
      height: height,
      width: width,
      child: Text(
        text,
        textAlign: textAlign,
        overflow: textOverflow,
        maxLines: maxLines,
        style: TextStyle(
          fontSize: size,
          fontWeight: fontWeight,
          color: color ?? Colors.black,
        ),
      ),
    );
  }

  static customContainer (TextEditingController controller) {
    return Container(
      height: 45,
      width: 50,
      decoration: BoxDecoration(
        color: Color(0XFFD9D9D9),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2.5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 18),
        child: TextField(
          controller: controller,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
