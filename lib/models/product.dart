import 'package:my_own_pc/models/store.dart';

class Product {
  final int id;
  final String name;
  final String description;
  final double value;
  final Store store;
  final int type;

  Product(
      this.id, this.name, this.description, this.value, this.store, this.type);
}
