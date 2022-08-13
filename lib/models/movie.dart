class Movie {
  String? title;
  String? year;
  List<String>? genre;
  String? plot;
  String? poster;
  String? imdbRating;
  String? type;

  Movie(
      {this.title,
      this.year,
      this.genre,
      this.plot,
      this.poster,
      this.imdbRating,
      this.type});

  Movie.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    year = json['Year'];
    genre = json['Genre'].cast<String>();
    plot = json['Plot'];
    poster = json['Poster'];
    imdbRating = json['imdbRating'];
    type = json['Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Title'] = title;
    data['Year'] = year;
    data['Genre'] = genre;
    data['Plot'] = plot;
    data['Poster'] = poster;
    data['imdbRating'] = imdbRating;
    data['Type'] = type;
    return data;
  }
}
