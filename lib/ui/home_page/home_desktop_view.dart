part of 'home_view.dart';

class _HomeDesktopView extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    var width = MediaQuery.of(context).size.width / 2.2;

    return Scaffold(
      appBar: MyAppBar(title: "FNews app", visibleNewsLogoWithTitle: true),
      body: _desktopBody(viewModel, width),
    );
  }

  Widget _desktopBody(HomeViewModel viewModel, var width) => SafeArea(
        child: Container(
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  const Expanded(child: ContentTab()),
                  SizedBox(
                    width: 100.0,
                    child: Center(
                      child: InkWell(
                        onTap: () => viewModel.refreshState(),
                        child: const Icon(
                          Icons.refresh,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              sizeBox12(),
              Expanded(
                child: SizedBox(
                  width: width,
                  child: viewModel.progressVisible != null
                      ? viewModel.progressVisible!
                          ? const LoadingShimmer()
                          : viewModel.newsList.isNotEmpty
                              ? ListView.builder(
                                  itemBuilder: (context, index) {
                                    return DesktopNewsWidgets(
                                      index: index,
                                    );
                                  },
                                  itemCount: viewModel.newsList.length,
                                )
                              : const NewsNotFound()
                      : const LoadingShimmer(),
                ),
              ),
            ],
          ),
        ),
      );
}
