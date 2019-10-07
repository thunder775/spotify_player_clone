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
  int i = 0;
  int count = 1;
  Icon play = Icon(Icons.play_circle_filled);
  bool isPlaying;

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
                image: NetworkImage(allSongs[i].imageUrl),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 5),
            child: Container(
              width: double.infinity,
              child: Text(
                allSongs[i].name,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w800),
              ),
            ),
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
                allSongs[i].artistName,
                style: TextStyle(color: Colors.grey),
              ),
            )),
          ),
          flex: 5,
        ),
        Expanded(
          flex: 20,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: IconButton(
                    iconSize: 28,
                    color: Colors.white,
                    icon: Icon(Icons.thumb_up),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.skip_previous),
                    onPressed: () {
                      setState(() {
                        if (i > 0) {
                          audioPlugin.pause();
                          i -= 1;
                          audioPlugin.play(allSongs[i].playUrl);
                        } else {
                          setState(() {
                            audioPlugin.pause();
                            i = (allSongs.length - 1);
                            audioPlugin.play(allSongs[i].playUrl);
                          });
                        }
                      });
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    iconSize: 50,
                    color: Colors.white,
                    icon: play,
                    onPressed: () {
                      count += 1;
                      if (count % 2 == 0) {
                        setState(() {
                          audioPlugin.play(allSongs[i].playUrl);
                          play = Icon(Icons.play_circle_filled);
                        });
                      } else {
                        setState(() {
                          play = Icon(Icons.pause_circle_filled);

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
                    onPressed: () {
                      if (i < allSongs.length) {
                        setState(() {
                          audioPlugin.pause();
                          i += 1;
                          audioPlugin.play(allSongs[i].playUrl);
                        });
                      } else {
                        setState(() {
                          audioPlugin.pause();
                          i = 0;
                          audioPlugin.play(allSongs[i].playUrl);
                        });
                      }
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    iconSize: 28,
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
