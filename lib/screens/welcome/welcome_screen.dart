import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:websafe_svg/websafe_svg.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebsafeSvg.asset(
            "assets/icons/bg.svg",
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 2),
                  Text(
                    "Let's Play Quiz",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text("Enter your information below:"),
                  Spacer(),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      hintText: "Full Name...",
                      fillColor: Color(0xFF1C231),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () => {},
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * .75),
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Let's Start Quiz!",
                        style: Theme.of(context).textTheme.button.copyWith(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                      ),
                    ),
                  ),
                  Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
