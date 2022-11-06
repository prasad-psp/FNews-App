part of 'news_detail_view.dart';

class _NewsDetailMobileView extends ViewModelWidget<NewsDetailViewModel> {
  @override
  Widget build(BuildContext context, NewsDetailViewModel viewModel) {
    var model = viewModel.getNews;

    return Scaffold(
      appBar: MyAppBar(visibleNewsLogoWithTitle: false),
      body: _mobileBody(model),
    );
  }

  Widget _mobileBody(Datum model) => SafeArea(
        child: Container(
          color: Colors.black,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Hero(
                  tag: model.id,
                  child: Image.network(
                    model.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.title,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          const Text("Author : ", style: TextStyle(color: Colors.white38, fontSize: 13.0),),
                          Text(model.author, style: const TextStyle(color: Colors.white38, fontSize: 13.0),),
                        ],
                      ),
                      Row(
                        children: [
                          Text(model.date != null ? model.date.toString() : "", style: const TextStyle(color: Colors.white38, fontSize: 12.0),),
                          Text(" | ${model.time.toString()}", style: const TextStyle(color: Colors.white38, fontSize: 12.0),),
                        ],
                      ),
                      const SizedBox(
                        height: 22.0,
                      ),
                      Text(
                        model.content,
                        style: const TextStyle(
                          color: Colors.white54,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      InkWell(
                        onTap: () => UrlLauncher.launch(model.readMoreUrl ?? ""),
                        child: const LinkWidget(
                          msg: "Click here to read more...",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
