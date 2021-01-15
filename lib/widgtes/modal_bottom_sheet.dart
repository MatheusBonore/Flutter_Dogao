import 'package:flutter/material.dart';

class ModalBottomSheet {
  mainBottomSheet(BuildContext context, Widget widget) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  width: 45,
                  height: 4,
                ),
                widget,
              ],
            ),
          );
        });
  }
}
