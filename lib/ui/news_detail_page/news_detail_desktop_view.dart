part of 'news_detail_view.dart';

class _NewsDetailDesktopView extends ViewModelWidget<NewsDetailViewModel> {
  @override
  Widget build(BuildContext context, NewsDetailViewModel viewModel) {
    var model = viewModel.getNews;

    return Scaffold(
      // appBar: MyAppBar(title: ""),
      body: _desktopBody(model, context),
    );
  }

  Widget _desktopBody(Datum model, BuildContext context) => SafeArea(
          child: Container(
        color: Colors.black,
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.only(
          left: 160.0,
          right: 160.0,
          top: 120.0,
          bottom: 120.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Hero(
                  tag: model.id,
                  child: Image.network(
                    model.imageUrl,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          model.title,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                          ),
                        ),
                        sizeBox15(),
                        Row(
                          children: [
                            const AutoSizeText(
                              "Author : ",
                              style: TextStyle(
                                color: Colors.white38,
                                fontWeight: FontWeight.w500,
                                fontSize: 20.0,
                              ),
                            ),
                            AutoSizeText(
                              model.author,
                              style: const TextStyle(
                                color: Colors.white38,
                                fontWeight: FontWeight.w500,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            AutoSizeText(
                              model.date != null ? model.date.toString() : "",
                              style: const TextStyle(
                                color: Colors.white38,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            AutoSizeText(
                              " | ${model.time.toString()}",
                              style: const TextStyle(
                                color: Colors.white38,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 22.0,
                        ),
                        AutoSizeText(
                          model.content,
                          style: const TextStyle(
                            color: Colors.white54,
                            fontWeight: FontWeight.w500,
                            fontSize: 22.0,
                          ),
                        ),
                        InkWell(
                          onTap: () =>
                              UrlLauncher.launch(model.readMoreUrl ?? ""),
                          child: const LinkWidget(
                            msg: "Click here to read more...",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ));
}
