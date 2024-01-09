import 'dart:ui';

import '../../models/ott_platforms_model.dart';

class BottomSheetsConstants {

  // Platform selection sheet constants
  static const String platformsSelSheetButtonTitle = "Proceed To Choose A Plan";
  static const String platformsSelSheetTitle = "Select Subscription Platform";
  static const String platformsSelAftSheetTitle = "Selected Platform";
  static const String platformSelSheetDescription = "Select a platform that you want to take the subscription from the below";

  static final ottPlatforms = [
    OTTPlatform(platformName: "Hotstar", imageUrl: "https://i.gadgets360cdn.com/large/disney_plus_hotstar_logo_1583901149861.jpg"),
    OTTPlatform(platformName: "Jio Cinema", imageUrl: "https://v3img.voot.com/v3Storage/assets/jiocinema_banner_1280x720-1682324171969.png"),
    OTTPlatform(platformName: "Netflix", imageUrl: "https://images.ctfassets.net/y2ske730sjqp/1aONibCke6niZhgPxuiilC/2c401b05a07288746ddf3bd3943fbc76/BrandAssets_Logos_01-Wordmark.jpg"),
    OTTPlatform(platformName: "Prime Video", imageUrl: "https://static.vecteezy.com/system/resources/previews/021/055/767/original/prime-video-logo-free-vector.jpg"),
    OTTPlatform(platformName: "HBO Max", imageUrl: "https://seeklogo.com/images/H/hbo-max-logo-8BD26F0EE7-seeklogo.com.png"),
    OTTPlatform(platformName: "Hulu", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvz-bVOWYDTsOFXrDhlsEjKwM3pd3-ex2RFBuTbZZu&s"),
  ];

  // Platform Plans selection sheet constants
  static const String platformsPlanSelSheetButtonTitle = "Proceed to Payment";
  static const String platformsPlanSelSheetTitle = "Select a Monthly Plan";
  static const String platformsPlanSelAftSheetTitle = "Selected Plan";
  static const String platformPlanSelSheetDescription = "Please choose a plat that suits your preferences.";

  static final platformPlans = [
    Plan(
        planName: "Basic",
        pricePerMonth: 8.99,
        color: const Color(0xFF4169E1)
    ),
    Plan(
        planName: "Standard",
        pricePerMonth: 13.99,
        color: const Color(0xFFE0115F)
    ),
    Plan(
        planName: "Premium",
        pricePerMonth: 19.99,
        color: const Color(0xFF800080)
    ),
    Plan(
        planName: "Family",
        pricePerMonth: 24.99,
        color: const Color(0xFF008080)
    ),
    Plan(
        planName: "Ultimate",
        pricePerMonth: 29.99,
        color: const Color(0xFF4B0082)
    ),
    // Add more plans for other platforms
  ];

  // Bank account selection sheet constants
  static const String bankAccSelSheetButtonTitle = "Subscribe";
  static const String bankAccSelSheetTitle = "Choose Your Bank";
  static const String bankAccSelSheetDescription = "Please select the bank account you'd like to use for your payment.";

  static final bankAccounts = [
    BankAccount(
      bankName: "HDFC Bank",
      bankLogoImageUrl:
      "https://w7.pngwing.com/pngs/636/81/png-transparent-hdfc-thumbnail-bank-logos.png",
      accountNumber: "XXXX-XXXX-1234",
    ),
    BankAccount(
      bankName: "SBI",
      bankLogoImageUrl:
      "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/SBI-logo.svg/2048px-SBI-logo.svg.png",
      accountNumber: "XXXX-XXXX-5678",
    ),
  ];

}