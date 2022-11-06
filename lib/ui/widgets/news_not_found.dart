import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NewsNotFound extends StatelessWidget {
  const NewsNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _mobileView(),
      desktop: _desktopView(),
    );
  }

  Widget _mobileView() => Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/newspaper.png",
                width: 50.0,
                height: 50.0,
              ),
              const SizedBox(
                height: 5.0,
              ),
              const Text(
                "Not found",
                style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      );

  Widget _desktopView() => Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/news_logo.png",
                width: 80.0,
                height: 80.0,
              ),
              const SizedBox(
                height: 5.0,
              ),
              const Text(
                "Not found",
                style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),
              )
            ],
          ),
        ),
      );
}
