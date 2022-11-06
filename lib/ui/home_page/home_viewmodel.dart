import 'package:flutter/widgets.dart';
import 'package:news_app_mvvm/service/api_endpoints.dart';
import 'package:stacked/stacked.dart';
import '../../model/news_model.dart';
import '../../service/api_service.dart';

class HomeViewModel extends BaseViewModel {
  List<Datum> newsList = [];
  bool? progressVisible;

  // Tabs
  List<String> list = ["All", "Sports", "Politics", "Business", "Science"];
  int selectedTabIndex = 0;

  void initialise() {
    requestNews(false, ApiEndpoints.getAllNews);
  }

  void requestNews(bool refreshState, String newsType) async {
    debugPrint("Request news data start");
    if (refreshState) {
      _refreshState();
    }

    // Call api
    var news = await ApiService().getNews(newsType);
    if (news != null) {
      var dataList = news.data;
      if (dataList.isNotEmpty) {
        newsList.addAll(dataList);
      }
    }

    progressVisible = false;
    notifyListeners();
    debugPrint("Request news data end");
  }

  Datum getNews(int index) {
    if (newsList.isNotEmpty) {
      return newsList[index];
    }
    return Datum(
      author: "",
      content: "",
      id: "",
      imageUrl: "",
      time: "",
      title: "",
      url: "",
    );
  }

  void refreshState() {
    selectTab(0);
  }

  void selectTab(int index) {
    selectedTabIndex = index;
    notifyListeners();

    final itemName = list[index];
    switch (itemName) {
      case "All":
        {
          requestNews(true, ApiEndpoints.getAllNews);
          break;
        }
      case "Sports":
        {
          requestNews(true, ApiEndpoints.getSportsNews);
          break;
        }
      case "Politics":
        {
          requestNews(true, ApiEndpoints.getPoliticsNews);
          break;
        }
      case "Business":
        {
          requestNews(true, ApiEndpoints.getBusinessNews);
          break;
        }
      case "Science":
        {
          requestNews(true, ApiEndpoints.getScienceNews);
          break;
        }
      default:
        {
          requestNews(true, ApiEndpoints.getAllNews);
          break;
        }
    }
  }

  void _refreshState() {
    debugPrint("Refresh state");
    _clearList();
    progressVisible = true;
    notifyListeners();
  }

  void _clearList() {
    if (newsList.isNotEmpty) {
      newsList.clear();
    }
  }
}
