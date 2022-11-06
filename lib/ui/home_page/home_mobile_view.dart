part of 'home_view.dart';

class _HomeMobileView extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      appBar: MyAppBar(title: "FNews app"),
      body: _mobileBody(viewModel),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          viewModel.refreshState();
        },
        child: const Icon(
          Icons.refresh,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _mobileBody(HomeViewModel viewModel) => SafeArea(
        child: Container(
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const ContentTab(),
              sizeBox12(),
              Expanded(
                child: Container(
                  child: viewModel.progressVisible != null
                      ? viewModel.progressVisible!
                          ? const LoadingShimmer()
                          : viewModel.newsList.isNotEmpty
                              ? ListView.builder(
                                  itemBuilder: (context, index) {
                                    return MobileNewsWidgets(
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
