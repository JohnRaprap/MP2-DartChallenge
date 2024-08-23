import 'dart:math';

class Song {
  String title;
  String artist;
  Duration duration;

  Song(this.title, this.artist, this.duration);

  String getDetails() {
    return '$title by $artist (${duration.inMinutes.toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')})';
  }
}

class Playlist {
  String name;
  List<Song> songs;

  Playlist(this.name) : songs = [];

  void addSong(Song song) {
    songs.add(song);
  }

  Duration getTotalDuration() {
    Duration total = Duration();
    for (var song in songs) {
      total += song.duration;
    }
    return total;
  }

  String getRandomSong() {
    var random = Random();
    var randomSong = songs[random.nextInt(songs.length)];
    return randomSong.getDetails();
  }

  List<String> getSortedByArtist() {
    songs.sort((a, b) => a.artist.compareTo(b.artist));
    return songs.map((song) => song.getDetails()).toList();
  }
}

class MusicFestival {
  String name;
  List<Playlist> stages;

  MusicFestival(this.name) : stages = [];

  void addStage(Playlist playlist) {
    stages.add(playlist);
  }

  Duration getTotalFestivalDuration() {
    Duration total = Duration();
    for (var stage in stages) {
      total += stage.getTotalDuration();
    }
    return total;
  }

  void getFestivalDetails() {
    print('Music Festival: $name\n');

    var totalDuration = getTotalFestivalDuration();
    print('Total Festival Duration: ${totalDuration.inSeconds} seconds\n');

    for (var i = 0; i < stages.length; i++) {
      var stage = stages[i];
      print('Stage ${i + 1}: ${stage.name}');
      print('  Random Song: ${stage.getRandomSong()}');
      print('  Playlist sorted by artist:');
      for (var songDetail in stage.getSortedByArtist()) {
        print('  $songDetail');
      }
      print('');
    }
  }
}

void main() {
  var song1 = Song('Born to Win', 'BINI', Duration(minutes: 3, seconds: 30));
  var song2 = Song('Feel Good', 'BINI', Duration(minutes: 3, seconds: 5));
  var song3 = Song('Here With You', 'BINI', Duration(minutes: 4, seconds: 30));
  var song4 = Song('Golden Arrow', 'BINI', Duration(minutes: 3, seconds: 15));
  var song5 = Song('Na Na Na', 'BINI', Duration(minutes: 3, seconds: 45));
  var song6 = Song('Kapit', 'BINI', Duration(minutes: 3, seconds: 0));
  var song7 = Song('Lagi', 'BINI', Duration(minutes: 3, seconds: 20));
  var song8 = Song('Pantropiko', 'BINI', Duration(minutes: 4, seconds: 10));
  var song9 = Song('Cherry on Top', 'BINI', Duration(minutes: 3, seconds: 50));
  var song10 = Song('Salamin Salamin', 'BINI', Duration(minutes: 3, seconds: 25));

  var playlist1 = Playlist('Main Stage');
  playlist1.addSong(song1);
  playlist1.addSong(song4);
  playlist1.addSong(song5);
  playlist1.addSong(song6);
  playlist1.addSong(song7);

  var playlist2 = Playlist('Indie Stage');
  playlist2.addSong(song2);
  playlist2.addSong(song8);
  playlist2.addSong(song9);
  playlist2.addSong(song10);
  playlist2.addSong(song3);

  var playlist3 = Playlist('Electronic Stage');
  playlist3.addSong(song3);
  playlist3.addSong(song1);
  playlist3.addSong(song4);
  playlist3.addSong(song6);
  playlist3.addSong(song8);

  var festival = MusicFestival('Summer Music Fest');
  festival.addStage(playlist1);
  festival.addStage(playlist2);
  festival.addStage(playlist3);

  festival.getFestivalDetails();
}
