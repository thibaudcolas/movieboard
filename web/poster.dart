library movie.poster;

import 'package:polymer/polymer.dart';
import 'models.dart';

@CustomTag('movie-poster')
class Poster extends PolymerElement {

  @observable Movie _movie = new Movie.sample();

  Poster.created() : super.created();

  bool get applyAuthorStyles => true;

  asStars(int nb) => new List.generate(nb, (_) => "\u2605").join();

  complementTo(int comp) => (nb) => comp - nb;
}