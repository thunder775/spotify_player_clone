import 'package:flutter/material.dart';
import 'package:spotify_player_clone/song.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    backgroundColor: Colors.black,
    appBar: AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Text(
        'Best of Hindi',
      ),
    ),
    body: SpotifyPlayer(),
  )));
}

class SpotifyPlayer extends StatefulWidget {
  @override
  _SpotifyPlayerState createState() => _SpotifyPlayerState();
}

class _SpotifyPlayerState extends State<SpotifyPlayer> {
  AudioPlayer audioPlugin = AudioPlayer();
  int count = 1;

  Song dummySong = Song(
      'Duniyaa',
      'https://p.scdn.co/mp3-preview/4efd033217aa13f4625d37f95efa676fb02d4778?cid=774b29d4f13844c495f206cafdad9c86',
      'https://i.scdn.co/image/f218335b215402cc2fb3b8d92652ebad48458805',
      'Luka Chuppi');
  List<Song> allSongs =
      SongData().songs; // You are given a list of songs here for Stretch

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 60,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 35, left: 24.0, right: 24),
              child: Image(
                fit: BoxFit.fill,
                image: NetworkImage(dummySong.imageUrl),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 300, left: 24),
            child: Container(
                child: Center(
                    child: Text(
              dummySong.name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w800),
            ))),
          ),
          flex: 5,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              right: 320.0,
              left: 24,
            ),
            child: Container(
                child: Center(
              child: Text(
                dummySong.artistName,
                style: TextStyle(color: Colors.grey),
              ),
            )),
          ),
          flex: 5,
        ),
        Expanded(
          flex: 20,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: IconButton(
                    iconSize: 32,
                    color: Colors.white,
                    icon: Icon(Icons.thumb_up),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.skip_previous),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: IconButton(
                    iconSize: 50,
                    color: Colors.white,
                    icon: Icon(Icons.play_circle_filled),
                    onPressed: () {
                      count += 1;
                      if (count % 2 == 0) {
                        setState(() {
                          audioPlugin.play(dummySong.playUrl);
                        });
                      }else{
                        setState(() {
                          audioPlugin.pause();
                        });
                      }
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.skip_next),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: IconButton(
                    iconSize: 32,
                    color: Colors.white,
                    icon: Icon(Icons.thumb_down),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
