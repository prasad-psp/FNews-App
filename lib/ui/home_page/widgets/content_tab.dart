import 'package:flutter/material.dart';
import 'package:news_app_mvvm/ui/home_page/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

part 'content_tab_item.dart';

class ContentTab extends ViewModelWidget<HomeViewModel> {
  const ContentTab({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0, top: 10.0),
      height: 40.0,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ContentTabItem(
            tabTitle: viewModel.list[index].toString(),
            borderColor: getSelectedTabColor(index, viewModel.selectedTabIndex),
            itemIndex: index,
          );
        },
        itemCount: viewModel.list.length.toInt(),
      ),
    );
  }

  Color getSelectedTabColor(int index, int selectedIndex) {
    if (selectedIndex == index) {
      return Colors.amber;
    }
    return Colors.grey;
  }
}
