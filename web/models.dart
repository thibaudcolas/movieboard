library movie.models;

import 'package:polymer/polymer.dart';

class Movie {
  @reflectable int id;
  @reflectable String title;
  @reflectable String posterPath;
  @reflectable String releasedDate;
  @reflectable int voteAverage;
  @reflectable int voteCount;
  @reflectable bool favorite;
  @reflectable String tag;

  Movie.sample() {
    id = 123;
    title = 'Kill Bill';
    posterPath = '../common/json/images/posters/2Aur1bxpCVzyTdWnGtxysInVlAT.jpg';
    releasedDate= '01/01/2001';
    voteAverage = 5;
    voteCount = 3;
    tag = 'banana, ananas';
  }
}