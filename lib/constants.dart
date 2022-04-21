import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const kAppBarColor = Colors.purple;
const kPrimaryScaffoldColor = Colors.white;

const kHomeTextStyle = TextStyle(
    fontSize: 25, fontFamily: 'Poppins', color: kPrimaryScaffoldColor);
const kCategoryTextStyle = TextStyle(
    fontSize: 20,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    color: kAppBarColor);
var kQuestionStyle = TextStyle(
  fontFamily: 'Poppins',
  color: Colors.purple.shade900,
  fontSize: 16,
);

List<String> categoryAnimation = [
  'assets/animation/categories/spinning-globe.json',
  'assets/animation/categories/book-animation.json',
  'assets/animation/categories/film-clipper.json',
  'assets/animation/categories/music.json',
  'assets/animation/categories/theater-masks.json',
  'assets/animation/categories/retro-television-tv.json',
];

List<IconData> iconlist = [
  FontAwesomeIcons.gamepad,
  FontAwesomeIcons.chessBoard,
  FontAwesomeIcons.microscope,
  FontAwesomeIcons.laptopCode,
  FontAwesomeIcons.arrowDown19,
  FontAwesomeIcons.dragon,
  FontAwesomeIcons.futbol,
  FontAwesomeIcons.mountain,
  FontAwesomeIcons.monument,
  FontAwesomeIcons.handshake,
  FontAwesomeIcons.paintbrush,
  FontAwesomeIcons.faceGrinStars,
  FontAwesomeIcons.dog,
  FontAwesomeIcons.carRear,
  FontAwesomeIcons.commentDots,
  FontAwesomeIcons.mobileScreenButton,
  FontAwesomeIcons.zhihu,
  FontAwesomeIcons.fortAwesome,
];
