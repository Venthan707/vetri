
class movie{
  late String image;
  late String id;

  movie(this.image,this.id);
}

List actors = model.map((m)=>movie(m['image']!,m['id']!)).toList();

var model = [
  {'image':'assets/movie/actors/rajini.jpg','id':'Rajini'},
  {'image':'assets/movie/actors/kamal.jpg','id':'Kamal'},
  {'image':'assets/movie/actors/ajith.jpg','id':'Ajith'},
  {'image':'assets/movie/actors/vijay.jpg','id':'Vijay'},
  {'image':'assets/movie/actors/vjs.jpg','id':'VJS'},
  {'image':'assets/movie/actors/sk.jpg','id':'SK'},
  {'image':'assets/movie/actors/str.jpg','id':'STR'},
  {'image':'assets/movie/actors/karthi.jpg','id':'Karthi'},
  {'image':'assets/movie/actors/surya.jpg','id':'Surya'},
];