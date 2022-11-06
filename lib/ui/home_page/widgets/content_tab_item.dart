part of 'content_tab.dart';

class ContentTabItem extends ViewModelWidget<HomeViewModel> {
  final String tabTitle;
  final Color borderColor;
  final int itemIndex;

  const ContentTabItem({
    super.key,
    required this.tabTitle,
    required this.borderColor,
    required this.itemIndex,
  });

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return _customContainer(
      viewModel,
      context,
      tabTitle,
      borderColor,
      itemIndex,
    );
  }

  Widget _customContainer(
    HomeViewModel viewModel,
    BuildContext context,
    String heading,
    Color borderColor,
    int itemIndex,
  ) =>
      InkWell(
        onTap: () {
          viewModel.selectTab(itemIndex);
        },
        child: Container(
          padding: const EdgeInsets.all(6.0),
          margin: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            top: 5.0,
            bottom: 5.0,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            border: Border.all(
              color: borderColor,
            ),
          ),
          child: Center(
            child: Text(
              heading,
              style: const TextStyle(
                color: Colors.white70,
              ),
            ),
          ),
        ),
      );
}
