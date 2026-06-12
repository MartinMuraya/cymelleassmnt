import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../products/models/product.dart';
import '../models/cart_item.dart';

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addToCart(Product product) {
    final index = state.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (index >= 0) {
      final updated = [...state];

      updated[index] = updated[index].copyWith(
        quantity: updated[index].quantity + 1,
      );

      state = updated;
    } else {
      state = [
        ...state,
        CartItem(product: product),
      ];
    }
  }

  void increaseQuantity(int productId) {
    state = state.map((item) {
      if (item.product.id == productId) {
        return item.copyWith(
          quantity: item.quantity + 1,
        );
      }
      return item;
    }).toList();
  }

  void decreaseQuantity(int productId) {
    state = state
        .map((item) {
          if (item.product.id == productId) {
            return item.copyWith(
              quantity: item.quantity - 1,
            );
          }
          return item;
        })
        .where((item) => item.quantity > 0)
        .toList();
  }

  void removeFromCart(int productId) {
    state = state
        .where(
          (item) => item.product.id != productId,
        )
        .toList();
  }

  void clearCart() {
    state = [];
  }

  double get totalPrice =>
      state.fold(
        0,
        (sum, item) => sum + item.total,
      );
}

final cartProvider =
    StateNotifierProvider<CartNotifier, List<CartItem>>(
  (ref) => CartNotifier(),
);