class Video {
  String id;
  String titulo;
  String descricao;
  String imagem;
  String canal;

  // Video({this.id, this.titulo, this.descricao, this.imagem, this.canal});
  Video(
      {required this.id,
      required this.titulo,
      required this.descricao,
      required this.imagem,
      required this.canal});

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
        id: json['id']['videoId'],
        titulo: json['snippet']['title'],
        descricao: json['snippet']['description'],
        imagem: json['snippet']['thumbnails']['high']['url'],
        canal: json['snippet']['channelTitle']);
  }
  // static converterJson(Map<String, dynamic> json) {
  //   return Video(
  //       id: json['id']['videoId'],
  //       titulo: json['snippet']['title'],
  //       descricao: json['snippet']['description'],
  //       imagem: json['snippet']['thumbnails']['high']['url'],
  //       canal: json['snippet']['channelId']);
  // }
}
