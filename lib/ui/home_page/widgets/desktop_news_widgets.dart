import 'package:flutter/material.dart';
import 'package:news_app_mvvm/core/routes/app_routes.dart';
import 'package:news_app_mvvm/ui/home_page/home_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:get/get.dart';

class DesktopNewsWidgets extends ViewModelWidget<HomeViewModel> {
  final int index;

  const DesktopNewsWidgets({Key? key, required this.index})
      : super(key: key, reactive: false);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    var model = viewModel.getNews(index);

    return Container(
      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: InkWell(
        onTap: () {
          Get.toNamed(AppRoutes.newsDetailRoute, arguments: model);
        },
        child: Card(
          color: Colors.black,
          // shape: const RoundedRectangleBorder(
          //   side: BorderSide(color: Colors.grey),
          // ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: model.id,
                child: Image.network(
                  model.imageUrl,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              // const SizedBox(
              //   height: 5.0,
              // ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 2.0, left: 5.0, right: 5.0),
                child: Text(
                  model.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      model.author,
                      style: const TextStyle(
                        fontSize: 15.0,
                        color: Colors.white54,
                      ),
                    ),
                    spacer(),
                    const Icon(
                      Icons.circle,
                      color: Colors.white54,
                      size: 8.0,
                    ),
                    spacer(),
                    Text(
                      model.date ?? "",
                      style: const TextStyle(
                        fontSize: 13.0,
                        color: Colors.white54,
                      ),
                    ),
                    spacer(),
                    const Icon(
                      Icons.circle,
                      color: Colors.white54,
                      size: 8.0,
                    ),
                    spacer(),
                    Text(
                      model.time,
                      style: const TextStyle(
                        fontSize: 13.0,
                        color: Colors.white54,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget spacer() => const SizedBox(
    width: 8.0,
  );
}
