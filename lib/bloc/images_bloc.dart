import 'package:bloc_pattern/service_handler/service_handler.dart';
import 'package:bloc_pattern/utils/gloabl.dart';
import 'package:flutter/cupertino.dart';

class ImagesBloc extends ChangeNotifier {
  
  ViewState _state = ViewState.Idle;
  ServiceHandler serviceHandler = ServiceHandler();

  _setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  Future<List> getImages() async {
    _setState(ViewState.Busy);
    try {
      var response = await serviceHandler.fetchData();
       _setState(ViewState.Idle);
       return response;
    } catch (e) {
      _setState(ViewState.Idle);
      print(e);
    }
  }
}

final imagesBloc = ImagesBloc();
