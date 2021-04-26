import 'package:flutter/material.dart';
import 'package:try_retrofit/model/data.dart';
import 'package:try_retrofit/model/user_responses.dart';
import 'package:try_retrofit/network/api_service.dart';

class UserProvider extends ChangeNotifier {
  final _apiService = ApiService.create();

  UserProvider() {
    getListUser();
  }

  ConnectionState _state;

  ConnectionState get state => _state;

  List<Data> _listUser;

  List<Data> get listUser => _listUser;

  Future<void> getListUser() async {
    _state = ConnectionState.waiting;
    notifyListeners();

    final _response = await _apiService.getListUser();

    if (_response.isSuccessful) {
      _state = ConnectionState.done;
      notifyListeners();

      final _body = _response.body;
      final _userResponse = UserResponses.fromJson(_body);
      _listUser = _userResponse.data;
    } else {
      _state = ConnectionState.none;
      notifyListeners();
    }
  }
}
