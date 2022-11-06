import 'package:stacked/stacked.dart';

import '../../model/news_model.dart';

class NewsDetailViewModel extends BaseViewModel {
  late Datum model;

  Datum get getNews => model;

  void initialise(Datum model) {
    this.model = model;
    notifyListeners();
  }
}
