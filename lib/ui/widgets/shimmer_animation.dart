import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shimmer/shimmer.dart';

final double BASE_COLOR_OPA = 0.25;
final double HIGHLIGHT_COLOR_OPA = 0.4;
final double CONTAINER_OPA = 0.9;

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: mobileShimmerView(context),
      desktop: desktopShimmerView(context),
    );
  }

  Widget mobileShimmerView(BuildContext context) => ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 180,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.withOpacity(BASE_COLOR_OPA),
                    highlightColor:
                        Colors.white.withOpacity(HIGHLIGHT_COLOR_OPA),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        color: Colors.grey.withOpacity(CONTAINER_OPA),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 2.0,
                    left: 6.0,
                    right: 6.0,
                  ),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.withOpacity(BASE_COLOR_OPA),
                    highlightColor:
                        Colors.white.withOpacity(HIGHLIGHT_COLOR_OPA),
                    child: Container(
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        color: Colors.grey.withOpacity(CONTAINER_OPA),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 6.0,
                    right: MediaQuery.of(context).size.width / 2.8,
                    bottom: 8.0,
                    top: 5.0,
                  ),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.withOpacity(BASE_COLOR_OPA),
                    highlightColor:
                        Colors.white.withOpacity(HIGHLIGHT_COLOR_OPA),
                    child: Container(
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        color: Colors.grey.withOpacity(CONTAINER_OPA),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: 6,
      );

  Widget desktopShimmerView(BuildContext context) => ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 300,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.withOpacity(BASE_COLOR_OPA),
                    highlightColor:
                        Colors.white.withOpacity(HIGHLIGHT_COLOR_OPA),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        color: Colors.grey.withOpacity(CONTAINER_OPA),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 2.0,
                    left: 6.0,
                    right: 6.0,
                  ),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.withOpacity(BASE_COLOR_OPA),
                    highlightColor:
                        Colors.white.withOpacity(HIGHLIGHT_COLOR_OPA),
                    child: Container(
                      height: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        color: Colors.grey.withOpacity(CONTAINER_OPA),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 6.0,
                    right: MediaQuery.of(context).size.width / 8,
                    bottom: 8.0,
                    top: 5.0,
                  ),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.withOpacity(BASE_COLOR_OPA),
                    highlightColor:
                        Colors.white.withOpacity(HIGHLIGHT_COLOR_OPA),
                    child: Container(
                      height: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        color: Colors.grey.withOpacity(CONTAINER_OPA),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: 6,
      );
}
