import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static String theMovieDBkey = dotenv.env['THE_MOVIEDB_KEY'] ?? 'Key is empty';
}
