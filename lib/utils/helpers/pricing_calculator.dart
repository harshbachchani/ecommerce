class HPricingCalculator {
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;

    double shippingCost = getShippingCost(location, productPrice);

    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  /// -- Calculate shipping cost
  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location, productPrice);
    return shippingCost.toStringAsFixed(2);
  }

  /// -- Calculate tax
  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location) {
    // Lookup the tax rate for the given location from a tax rate database or API.
    // Return the appropriate tax rate.
    return 0.05; // Example tax rate of 10%
  }

  static double getShippingCost(String location, double price) {
    // Lookup the shipping cost for the given location using a shipping rate API.
    // Calculate the shipping cost based on various factors like distance, weight, etc.

    if (price < 1000) {
      return 60.0;
    } else if (price >= 1000 && price <= 3000)
      // ignore: curly_braces_in_flow_control_structures
      return 40.0;
    else if (price <= 5000) {
      return 20.0;
    }

    return 0.0; // Example shipping cost of $5
  }

  /// -- Sum all cart values and return total amount
  // static double calculateCartTotal(CartModel cart) {
  //   return cart.items.map((e) => e.price).fold(0, (previousPrice, currentPrice) => previousPrice + (currentPrice ?? 0));
  // }
}
