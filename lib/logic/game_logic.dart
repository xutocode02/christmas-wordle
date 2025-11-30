import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class GameLogic {
  var solution = ['p', 'a', 'r', 'i', 's'];

  var allWords = [
    ['', '', '', '', ''],
    ['', '', '', '', ''],
    ['', '', '', '', ''],
    ['', '', '', '', ''],
    ['', '', '', '', ''],
    ['', '', '', '', ''],
  ];

  int row = 0;
  int index = 0;

  Future<List<String>> loadWordList() async {
    final data = await rootBundle
        .loadString('assets/external_data/valid_wordle_words.txt');
    return const LineSplitter().convert(data);
  }

  Future<bool> isValidWord(String word) async {
    final words = await loadWordList();
    return words.contains(word.toLowerCase());
  }
}
