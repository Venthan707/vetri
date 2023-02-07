//banner class
class banner {
  late String? bannerImagePath;

  banner({this.bannerImagePath});

  factory banner.formap(Map<String, dynamic> B) {
    return banner(bannerImagePath: B['bannerImagePath'].toString());
  }
}

//videodetails class

class videodetails {
  late int? videoId, agerestriction;
  late String? title, imagePath, description, releasedYear, duration, type;

  videodetails(
      {this.videoId,
      this.title,
      this.imagePath,
      this.agerestriction,
      this.description,
      this.duration,
      this.releasedYear,
      this.type});

  factory videodetails.formap(Map<String, dynamic> V) {
    return videodetails(
      videoId: int.parse(V['videoId'].toString()),
      agerestriction: int.parse(V['agerestriction'].toString()),
      title: V['title'].toString(),
      imagePath: V['imagePath'].toString(),
      description: V['description'].toString(),
      releasedYear: V['releasedYear'].toString(),
      duration: V['duration'].toString(),
      type: V['type'].toString(),
    );
  }
}

//star class
class star {
  late String? name,imagepath;
  late int?starid;

  star({this.starid,this.name,this.imagepath});

  factory star.formap(Map<String, dynamic> S) {
    return star(starid: int.parse(S['starid'].toString()),
      name: S['name'].toString(),
      imagepath: S['imagepath'].toString(),);
  }
}


