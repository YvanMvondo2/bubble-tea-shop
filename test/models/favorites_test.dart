import 'package:bubble_tea_shop/models/favorites.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Testing app Provider', () {
    var favorites = Favorites();

    test('un nouvel element doit etre ajoute', () {
      var number = 35;
      favorites.add(number);
      expect(favorites.items.contains(number), true);
    });

    test('un nouvel element doit etre retire', () {
      var number = 35;
      favorites.remove(number);
      expect(favorites.items.contains(number), false);
    });
  });
}
