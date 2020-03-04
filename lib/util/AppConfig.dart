class AppConfig {
  static final String appName = "ebay Search";
  static final String patternDelimiter = "#";
  static final String blank = "";
  static final int screenTimeout = 5000;
  static final double loaderStokeWidth = 5.0;

  ///Hex Helper Values
  static final int hexMaxLength = 6;
  static final int hexRadix = 16;

  ///Asset Paths
  static final String pathLogoSolid = "assets/images/logo_solid.png";
  static final String pathLogoTrans = "assets/images/logo_trans.png";
  static final String pathLogoTransWhite = "assets/images/logo_trans_white.png";
  static final String pathLogoTransGrey = "assets/images/logo_trans_grey.png";

  ///Image Sizes
  static final double imageAppBarSize = 50;
  static final double imagePopupSize = 70;
  static final double imageHomeSize = 125;
  static final double imageSplashSize = 187;

  /// Hex Color Codes
  static final String ebayColorRed = "#e53238";
  static final String ebayColorBlue = "#0064d2";
  static final String ebayColorOrange = "#f5Af03";
  static final String ebayColorGreen = "#86b816";
  static final String hexColorGrey = "#a6a6a6";
  static final String hexWhiteValue = "FF";

  ///Home screen titles
  static final String oops = "Oops!";
  static final String homeTitle = "Nothing Here Yet";
  static final String homeSubtitle =
      "Please search your item by clicking the search icon.";
  static final String searchItem = "Search for any item name";

  ///Font Sizes
  static final double fontSizeTiny = 14.0;
  static final double fontSizeMedium = 16.0;
  static final double fontSizeLarge = 18.0;
  static final double fontSizeHeader = 20.0;

  ///Fonts
  static final String openSansFontFamily = "OpenSans";
  static final String ebayFontFamily = "ebay";

  ///Padding and Margin
  static final double marginZero = 0;
  static final double marginSmall = 4.0;
  static final double marginNormal = 12.0;
  static final double marginLarge = 16.0;
  static final double marginEdge = 20.0;
  static final double marginBottomLoader = 35.0;
  static final double marginTopImage = 105;
  static final double marginTopSubtext = 16.0;

  ///App Dialog Titles
  static final String error = "Error";
  static final String textFewChars =
      "In order to proceed, your search term must be longer than two letters";
  static final String ok = "Ok";
  static final String noResult = "Could not get the searched item";

  ///API defaults
  static final String baseUrl = "https://api.ebay.com";
  static final String appId = "JaphtaSe-FlutterA-PRD-369ee5442-6ee60ae8";
  static final String devId = "0888aab4-cbb5-4277-84c8-a9918448e0cc";
  static final String clientSecret = "PRD-69ee5442c831-e425-41e1-80fa-7222";
  static final String authToken = "v^1.1#i^1#f^0#p^3#r^0#I^3#t^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";
  static final String authEndUserContextValue = "contextualLocation=country=<2CharCountryCode>,zip=<5DigitCode>,affiliateCampaignId=<ePNCampaignId>,affiliateReferenceId=<referenceId>";
  static final String authMarketValue = "EBAY_US";
  static final String authContentTypeValue = "application/json";

  ///API Keys
  static final String keyContentType = "Content-Type";
  static final String keyAuthorization = "Authorization";
  static final String keyGrantType = "grant_type";
  static final String keyScope = "scope";
  static final String keyMarket = "X-EBAY-C-MARKETPLACE-ID";
  static final String keyEndUserContext = "X-EBAY-C-ENDUSERCTX";

  ///Endpoints
  static final String endpointToken = baseUrl + "/identity/v1/oauth2/token";
  static final String endpointSearch =
      baseUrl + "/buy/browse/v1/item_summary/search?q=";

  ///Mock Endpoints
  static final String mockEndpoint =
      "http://www.mocky.io/v2/5e5cc4843200007d0043c2e1";


///UI Fields
  static final String condition = "Condition: ";
  static final String currentBidPrice = "Current Bid Price: ";
  static final String itemLocation = "Item Location: ";
  static final String shippingCost = "Shipping Cost: ";
  static final String country = "Country: ";
  static final String discountAmount = "Discount Amount: ";
  static final String sellerName = "Seller: ";
}
