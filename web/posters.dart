library movie.posters;

import 'package:polymer/polymer.dart';
import 'dart:html';
import 'dart:async';

import 'models.dart';
import 'services.dart';
import 'utils.dart';


@CustomTag('movie-posters')
class Posters extends PolymerElement {

  @observable List<Movie> movies;
  @observable String searchTerm = '';
  @observable String searchFilter = '';
  @observable String sortField = 'default';
  @observable bool sortAscending = true;

  bool get applyAuthorStyles => true;

  Posters.created() : super.created() {
    moviesService.getAllMovies().then((List ms) => movies = ms);
  }

  Timer _searchTimer;
  searchTermChanged(String oldValue) {
    if (_searchTimer != null) _searchTimer.cancel();
    _searchTimer = new Timer(new Duration(milliseconds: 400), () => searchFilter = searchTerm);
  }

  filter(String term) {
    term = term.toLowerCase();
    return (List<Movie> movies) => term.isEmpty ? movies : movies.where((Movie m) => m.matches(term)).toList();
  }

  sort(Event e, var detail, Element target) {
    var field = target.dataset['field'];
    sortAscending = field == sortField ? !sortAscending : true;
    sortField = field;
    applySelected(target, 'gb');
  }

  sortBy(String field, bool asc) => (Iterable<Movie> ms) {
    List result = ms.toList()..sort(Movie.getComparator(field));
    return asc ? result : result.reversed;
  };
}