class AllCharacters {
  String? name;
  int? id;
  String? status;
  String? species;
  String? type;
  String? gender;
  String? image;
  List<String>? episode;

  AllCharacters.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    status = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    image = json['image'];
    episode = json['episode'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['status'] = this.status;
    data['species'] = this.species;
    data['type'] = this.type;
    data['gender'] = this.gender;
    data['image'] = this.image;
    data['episode'] = this.episode;
    return data;
  }
}
