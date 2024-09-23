import 'package:bookmybeauty/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class KToggleButton extends StatefulWidget {
  const KToggleButton({super.key});

  @override
  State<KToggleButton> createState() => _KToggleButtonState();

}

class _KToggleButtonState extends State<KToggleButton> {
  var selectedType ="Walk-In";
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration:  const BoxDecoration(
        color: dimGreyColor,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Flexible(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedType = "Walk-In";
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: selectedType == "Walk-In"
                      ? kPrimaryGradient
                      : null,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                      ),
                ),
                child: Padding(
                  padding:  EdgeInsets.only(
                      left: Get.width*0.07, right: Get.width*0.07, top: 8, bottom: 8),
                  child: Text(
                    'Walk-In',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: selectedType == "Walk-In"
                          ? Colors.white
                          : dimBlackColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedType = "Home-Visit";
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: selectedType == "Home-Visit"
                      ? kPrimaryGradient
                      :null,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)
                      ),
                ),
                child: Padding(
                  padding:  EdgeInsets.only(
                      left: Get.width*0.07, right:Get.width*0.07, top: 8, bottom: 8),
                  child: Text(
                    'Home-Visit',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: selectedType == "Home-Visit"
                          ? Colors.white
                          : dimBlackColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
