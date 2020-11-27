import 'package:rxdart/rxdart.dart';
import 'package:rosseti/resources/RepositoryTasks.dart';
import 'package:rosseti/resources/apiProviderTasks.dart';

import 'data.dart';



class TasksBloc {
  var _repository = TasksApiProvider();
  final _moviesFetcher = PublishSubject<List<Map<String, dynamic>>>();
  TasksBloc(String url) {
    this._repository = TasksApiProvider(baseUrl: url);
  }
  Stream<List<Map<String, dynamic>>> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    _isDisposed = false;
    _moviesFetcher.addStream(getRandomValues());

  }
  Stream<List<Map<String, dynamic>>> getRandomValues() async* {

    while (!_isDisposed) {
      yield await _repository.fetchMovieList();
      if (_isDisposed) {
        break;
      }
      await Future.delayed(Duration(seconds: 1));
    }
    _moviesFetcher.close();
  }

  bool _isDisposed = false;
  void dispose() {
    _isDisposed = true;
  }

}



