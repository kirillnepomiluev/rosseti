import '../data.dart';
import 'apiProviderTasks.dart';

class Repository {
 final  String baseUrl;

  Repository(this.baseUrl);
  final moviesApiProvider = TasksApiProvider();

  Future<List<Map<String,dynamic>>> fetchAllMovies() {


    return
    moviesApiProvider.fetchMovieList();}

}