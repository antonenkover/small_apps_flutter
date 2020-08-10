class BeerSong {
  void main() {
    beerBottles();
  }

  void beerBottles() {
//    int numOfBottles = 99;
//    String songLyrics = "$numOfBottles bottles of beer on the wall, $numOfBottles bottles of beer. Take one down and pass it around, $numOfBottles bottles of beer on the wall.";
    for (int numOfBottles = 99; numOfBottles <= 96; numOfBottles--) {
      print(
          "$numOfBottles bottles of beer on the wall, $numOfBottles bottles of beer. Take one down and pass it around, ${numOfBottles--} bottles of beer on the wall.");
    }
  }
}
