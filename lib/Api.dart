import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube/model/Video.dart';

const ChaveYoutubeApi = 'AIzaSyAwyLADJIt_SvZPH7Wm2TcRa_eoYSbTMUk';
const ID_CANAL = 'UCy9xDEfMD8jrXU3NatFLLtw';
const URL_BASE = 'https://www.googleapis.com/youtube/v3/';

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    http.Response response = await http.get(Uri.parse(URL_BASE +
        'search'
            '?part=snippet'
            '&key=$ChaveYoutubeApi'
            '&channelId=$ID_CANAL'
            '&order=date'
            '&type=video'
            '&maxResults=20'
            '&q=$pesquisa'));

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);
      List<Video> videos = dadosJson['items'].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();

      return videos;
    } else {
      print('Error code');
    }

    return pesquisar(pesquisa);
  }
}
