import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/models/Questions.dart';
import 'package:quiz_app/quiz/components/question_card.dart';
import 'package:websafe_svg/websafe_svg.dart';

import 'progress_bar.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final QuestionController controller = Get.put(QuestionController());
    return Stack(
      children: [
        WebsafeSvg.asset(
          "assets/icons/bg.svg",
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                ),
                child: ProgressBar(),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                ),
                child: Obx(
                  () => Text.rich(
                    TextSpan(
                      text: "Question ${controller.questionNumber.value}",
                      style: Theme.of(context).textTheme.headline4.copyWith(
                            color: kSecondaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                      children: [
                        TextSpan(
                          text: "/${controller.questions.length}",
                          style: Theme.of(context).textTheme.headline5.copyWith(
                                color: kSecondaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 1.5,
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Expanded(
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: controller.pageController,
                  itemCount: controller.questions.length,
                  onPageChanged: controller.updateTheQnNum,
                  itemBuilder: (context, index) => QuestionCard(
                    question: controller.questions[index],
                  ),
                ),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
            ],
          ),
        )
      ],
    );
  }
}
