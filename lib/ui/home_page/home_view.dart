import 'package:flutter/material.dart';
import 'package:news_app_mvvm/ui/home_page/home_viewmodel.dart';
import 'package:news_app_mvvm/ui/home_page/widgets/desktop_news_widgets.dart';
import 'package:news_app_mvvm/ui/widgets/news_not_found.dart';
import 'package:news_app_mvvm/ui/widgets/shimmer_animation.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../widgets/app_bar.dart';
import '../widgets/rounded_progress.dart';
import '../widgets/sizebox.dart';
import 'widgets/content_tab.dart';
import 'widgets/mobile_news_widgets.dart';

part 'home_mobile_view.dart';
part 'home_desktop_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) {
        return ScreenTypeLayout(
          mobile: _HomeMobileView(),
          desktop: _HomeDesktopView(),
        );
      },
    );
  }
}
