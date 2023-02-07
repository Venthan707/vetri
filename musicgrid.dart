
class movie{
  late String image;
  late String id;

  movie(this.image,this.id);
}

List music = model.map((m)=>movie(m['image']!,m['id']!)).toList();

var model = [
  {'image':'assets/Songs/music/u1.jpg','id':'U1'},
  {'image':'assets/Songs/music/hht.jpg','id':'HHT'},
  {'image':'assets/Songs/music/gvp.jpg','id':'GVP'},
  {'image':'assets/Songs/music/ani.jpg','id':'ANI'},
  {'image':'assets/Songs/music/arr.jpg','id':'ARR'},
  {'image':'assets/Songs/music/di.jpg','id':'IMAN'},
];