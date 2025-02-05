import 'package:flutter_tech_camp/src/cart/models/cart_item.dart';
import 'package:flutter_tech_camp/src/products/models/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart.freezed.dart';

@freezed
abstract class Cart with _$Cart {
  const Cart._();

  factory Cart({@required List<CartItem> items}) = _Cart;

  Cart addProduct(Product product) {
    final cartItemOrNull = items.firstWhere(
        (element) => element.product == product,
        orElse: () => null);

    if (cartItemOrNull != null) {
      // Our cart contains the product. Increment the multiplier.
      final newItems = List<CartItem>.from(items)
        ..remove(cartItemOrNull)
        ..add(CartItem(
            multiplier: cartItemOrNull.multiplier + 1, product: product));
      return this.copyWith(items: newItems);
    } else {
      final newItems = List<CartItem>.from(items)
        ..add(CartItem(multiplier: 1, product: product));
      return this.copyWith(items: newItems);
    }
  }

  int get quantity {
    return items.fold(
        0, (previousValue, element) => previousValue + element.multiplier);
  }
}
