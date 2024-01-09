import 'dart:ui';

class OTTPlatform {
  final String platformName;
  final String imageUrl;

  OTTPlatform({
    required this.platformName,
    required this.imageUrl,
  });
}

class Plan {
  final String planName;
  final double pricePerMonth;
  final Color color;

  Plan({
    required this.planName,
    required this.pricePerMonth,
    required this.color,
  });
}

class BankAccount {
  final String bankName;
  final String bankLogoImageUrl;
  final String accountNumber;

  BankAccount({
    required this.bankName,
    required this.bankLogoImageUrl,
    required this.accountNumber,
  });
}