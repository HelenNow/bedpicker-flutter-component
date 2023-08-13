/// Enumerates the possible types of requests.
enum RequestType { open, accepted }

/// Enumerates the main screens in the app,
enum AppPage { wallet, leaderboard, home, help, account }

/// Enumerates whether a scetion of the app should be seen, hidden, or disabled
enum SectionVisibility { show, hide, showDisabled, showRestricted }

/// A collection of styling parameters, routes, and asset URLs.
class AppConstants {
  /// Route for the authentication skeleton.
  static const String routeAuthenticationSkeleton = '/';

  /// Route for the main app skeleton.
  static const String routeAppSkeleton = '/app';

  //

  /// Asset URL for the wallet icon used in the bottom bar.
  static const String iconWallet = 'assets/bottom_bar_icons/icon_wallet.svg';

  /// Asset URL for the leaderboard icon used in the bottom bar.
  static const String iconLeaderboard =
      'assets/bottom_bar_icons/icon_leaderboard.svg';

  /// Asset URL for the help icon used in the bottom bar.
  static const String iconHelp = 'assets/bottom_bar_icons/icon_help.svg';

  /// Asset URL for the account icon used in the bottom bar.
  static const String iconAccount = 'assets/bottom_bar_icons/icon_account.svg';

  /// Asset URL for the Helen icon used in the bottom bar.
  static const String iconHelen = 'assets/bottom_bar_icons/icon_helen.svg';

  /// Asset URL for the Helen logo (Helen icon with a styled 'Helen' underneath it).
  static const String logo = 'assets/miscellaneous/icon_helen_login.svg';
  static const String patientStatus = 'assets/miscellaneous/patient_status.svg';

  /// Asset URL for the red star icon in the leaderboard screen.
  static const String iconStar =
      'assets/miscellaneous/icon_leaderboard_star.svg';

  /// Asset URL for the purple wallet icon used for articles/tips.
  static const String iconWalletPurple =
      'assets/miscellaneous/icon_wallet_purple.svg';

  /// Asset URL for the red card used for displaying requests.
  static const String cardRed = 'assets/request_cards/card_red.svg';

  /// Asset URL for the orange card used for displaying requests.
  static const String cardOrange = 'assets/request_cards/card_orange.svg';

  /// Asset URL for the blue card used for displaying requests.
  static const String cardBlue = 'assets/request_cards/card_blue.svg';

  /// Asset URL for the header backround in the wallet screen.
  static const String backgroundWallet =
      'assets/backgrounds/background_wallet.svg';

  /// Asset URL for the header background in the leaderboard screen.
  static const String backgroundLeaderboard =
      'assets/backgrounds/background_leaderboard.svg';

  /// Asset URL for the header background in the help screen.
  static const String backgroundHelp = 'assets/backgrounds/background_help.svg';

  /// Asset URL for the QR used to download the patient app (Google Store).
  static const String qrPatientApp = 'assets/patient_app_qr.png';

  static const String qrConcierge = 'assets/qr_codes/Concierge.png';
  static const String qrLocation = 'assets/qr_codes/Location.png';

  /// 15 - Used for general padding to keep widgets away from the screen's edges.
  static const double paddingGeneral = 15;

  //

  /// The space between a screen title and the top edge of the screen.
  static const double spaceBeforeTitle = 65;

  /// The space between the last widget in a page and the top of the bottom bar (top of Helen icon).
  static const double spaceAvoidBottomBar = heightBottomBar + 40;

  //

  /// The height of the bottom bar (excluding the Home/Helen button which extends above the bottom bar).
  static const double heightBottomBar = 101;

  /// The percentage of the screen's height allocated for the height of header backgrounds (wallet, leaderboard, and help screens).
  static const double heightBackgroundHeaderMultiplier = 0.39;

  //

  /// The name of the Nunito font family.
  static const String fontFamilyNunito = 'Nunito';

  /// The name of the Helvetica font family.
  static const String fontFamilyHelvetica = 'Helvetica';

  //

  /// Size 26 - Used for the greeting in the appbar.
  static const double fontAppbarGreeting = 26;

  /// Size 18 - Used for the duty text in the appbar.
  static const double fontAppbarDuty = 18;

  /// Size 48 - Used for the wallet value in the wallet screen.
  static const double fontWalletValue = 48;

  /// Size 19 - Used for the leaderboard placement in the wallet screen.
  static const double fontWalletPlacement = 19;

  /// Size 16 - Used for the value in the wallet activity displays (wallet and home screen).
  static const double fontWalletCard = 16;

  /// Size 20 - Used for the text in the leaderboard placement cards.
  static const double fontLeaderboardCard = 20;

  /// Size 18 - Used for the section titles in the home screen ('TIPS' and 'RECENT ACTIVITY').
  static const double fontHomeSectionTitle = 18;

  /// Size 16 - Used for the assignment text in the regular displays of requests.
  static const double fontAssignmentRegular = 16;

  /// Size 18 - Used for the assignment text in the maximuzed displays of requests.
  static const double fontAssignmentMaximized = 18;

  /// Size 20 - Used for the button text in the regular displasy of all requests.
  static const double fontRequestButtonRegular = 20;

  /// Size 18 - Used for the button text in the maximized displays of open/assigned requests.
  static const double fontRequestButtonMaximizedAssigned = 18;

  /// Size 18 - Used for the button text in the maximized displays of accepted requests.
  static const double fontRequestButtonMaximizedAccepted = 14;

  /// Size 28 - Used for the dollar sign in request displays.
  static const double fontRequestValueDollarSign = 28;

  /// Size 66 - Used for the value/reward in the regular displays of requests.
  static const double fontRequestValueRegular = 66;

  /// Size 70 - Used for the value/reward in the maximized displays of requests.
  static const double fontRequestValueMaximized = 70;

  /// Size 42 - Used for the room number in the regular displays of requests.
  static const double fontRoomNumberRegular = 42;

  /// Size 32 - Used for the room number in the maximized displays of requests.
  static const double fontRoomNumberMaximized = 32;

  /// Size 18 - Used for the title of service types in the request update screen.
  static const double fontServiceTypeTitle = 18;

  /// Size 64 - Used for the number of add-ons selected in the request update screen.
  static const double fontAddonItemCount = 64;

  /// Size 16 - Used for the title of an add-on in the request update screen.
  static const double fontAddonItemTitle = 16;

  /// Size 16 - Used for the text in cards in the account screen.
  static const double fontAccountCard = 16;

  /// Size  16 - Used for the text in cards in the language screen.
  static const double fontLanguageCard = 16;

  /// Size 20 - Used for dialog titles.
  static const double fontDialogTitle = 20;

  /// Size  16 - Used for dialog descriptions.
  static const double fontDialogDescription = 16;

  /// Size 24 - Used for the text in the log-in screen.
  static const double fontLogin = 24;

  /// Size 32 - Used for screen titles.
  static const double fontScreenTitle = 32;

  /// Size 12 - Used for the labels on the buttons in the bottom tab bar.
  static const double fontBottomTabItem = 12;

  /// Size 16 - Used for the text in toast messages.
  static const double fontToastMessage = 16;

  /// Size 12.
  static const double fontSmallX = 12;

  /// Size 13.
  static const double fontSmallXPlus = 13;

  /// Size 14.
  static const double fontSmall = 14;

  /// Size 15.
  static const double fontSmallPlus = 15;

  /// Size 16.
  static const double fontMedium = 16;

  /// Size 17.
  static const double fontMediumPlus = 17;

  /// Size 18.
  static const double fontMediumX = 18;

  /// Size 19.
  static const double fontMediumXPlus = 19;

  /// Size 20.
  static const double fontLarge = 20;

  /// Size 21.
  static const double fontLargePlus = 21;

  /// Size 22.
  static const double fontLargeX = 22;

  /// Size  23.
  static const double fontLargeXPlus = 23;

  /// Size 24.
  static const double fontLargeXX = 24;

  /// Size 25.
  static const double fontLargeXXPlus = 25;

  /// Size 26.
  static const double fontLargeXXX = 26;

  /// Size 27.
  static const double fontLargeXXXPlus = 27;

  //

  /// Indicates the number of decimal points to be shown on numbers (such as wallet values).
  static const int decimalPointsAfterNumber = 2;
}
