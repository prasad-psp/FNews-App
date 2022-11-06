import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:news_app_mvvm/model/news_model.dart';
import 'package:news_app_mvvm/ui/news_detail_page/news_detail_viewmodel.dart';
import 'package:news_app_mvvm/utils/url_launcher.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../widgets/app_bar.dart';
import '../widgets/link_widget.dart';
import '../widgets/sizebox.dart';
part 'news_detail_mobile_view.dart';
part 'news_detail_desktop_view.dart';

class NewsDetailView extends StatelessWidget {
  final Datum news;
  const NewsDetailView({required this.news, super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewsDetailViewModel>.reactive(
      viewModelBuilder: () => NewsDetailViewModel(),
      onModelReady: (model) => model.initialise(news),
      builder: (context, model, child) {
        return ScreenTypeLayout(
          mobile: _NewsDetailMobileView(),
          desktop: _NewsDetailDesktopView(),
        );
      },
    );
  }
}
