import 'package:changnotifier_audiop/secound.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';

import 'modal.dart';

class home_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    modal m = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("ChangeNotifier_Provider"),
        backgroundColor: Colors.red,
      ),
      body: FutureBuilder(
        future: m.get_song(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            m.songs = snapshot.data as List<SongModel>;

            return ListView.builder(
              shrinkWrap: true,
              itemCount: m.songs.length,
              itemBuilder: (context, index) {
                SongModel s = m.songs[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return secound(index, m.songs);
                      },
                    ));
                  },
                  child: Card(
                    elevation: 10,
                    child: ListTile(
                      title: Text("${s.title}"),
                      subtitle: Text(m.printDuration(
                          Duration(milliseconds: s.duration!.toInt()))),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
