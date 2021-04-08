import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';

import '../../constants.dart';

class Option extends StatelessWidget {
  const Option({
    Key key,
    @required this.text,
    @required this.index,
    @required this.press,
  }) : super(key: key);

  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          Color getColorForAns() {
            if (qnController.isAnswered) {
              if (index == qnController.correctAns) {
                return kGreenColor;
              } else if (index == qnController.selectedAns &&
                  qnController.selectedAns != qnController.correctAns) {
                return kRedColor;
              }
            }
            return kGrayColor;
          }

          return InkWell(
            onTap: press,
            child: Container(
              margin: EdgeInsets.only(top: kDefaultPadding),
              padding: EdgeInsets.all(kDefaultPadding),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: getColorForAns()),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${index + 1}. $text",
                    style: TextStyle(
                      color: getColorForAns(),
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      color: getColorForAns() == kGrayColor
                          ? Colors.transparent
                          : getColorForAns(),
                      border: Border.all(color: getColorForAns()),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      qnController.correctAns == index
                          ? Icons.done
                          : Icons.close,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
