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

  ///API defaults
  static final String baseUrl = "https://api.ebay.com";
  static final String appId = "JaphtaSe-FlutterA-PRD-369ee5442-6ee60ae8";
  static final String devId = "0888aab4-cbb5-4277-84c8-a9918448e0cc";
  static final String clientSecret = "PRD-69ee5442c831-e425-41e1-80fa-7222";
  static final String scopeList =
      "https:%3A%2F%2Fapi.ebay.com%2Foauth%2Fapi_scope%20https:%3A%2F%2Fapi.ebay.com%2Foauth%2Fapi_scope%2Fsell.marketing.readonly%20https:%3A%2F%2Fapi.ebay.com%2Foauth%2Fapi_scope%2Fsell.marketing%20https:%3A%2F%2Fapi.ebay.com%2Foauth%2Fapi_scope%2Fsell.inventory.readonly%20https:%3A%2F%2Fapi.ebay.com%2Foauth%2Fapi_scope%2Fsell.inventory%20https:%3A%2F%2Fapi.ebay.com%2Foauth%2Fapi_scope%2Fsell.account.readonly%20https:%3A%2F%2Fapi.ebay.com%2Foauth%2Fapi_scope%2Fsell.account%20https:%3A%2F%2Fapi.ebay.com%2Foauth%2Fapi_scope%2Fsell.fulfillment.readonly%20https:%3A%2F%2Fapi.ebay.com%2Foauth%2Fapi_scope%2Fsell.fulfillment%20https:%3A%2F%2Fapi.ebay.com%2Foauth%2Fapi_scope%2Fsell.analytics.readonly%20https:%3A%2F%2Fapi.ebay.com%2Foauth%2Fapi_scope%2Fsell.finances%20https:%3A%2F%2Fapi.ebay.com%2Foauth%2Fapi_scope%2Fsell.payment.dispute%20https:%3A%2F%2Fapi.ebay.com%2Foauth%2Fapi_scope%2Fcommerce.identity.readonly";
  static final String authValue = "Basic " + appId + ":" + clientSecret;

  ///API Keys
  static final String keyContentType = "Content-Type";
  static final String keyAuthorization = "Authorization";
  static final String keyGrantType = "grant_type";
  static final String keyScope = "scope";

  ///Endpoints
  static final String endpointToken = baseUrl + "/identity/v1/oauth2/token";
  static final String endpointSearch =
      baseUrl + "/buy/browse/v1/item_summary/search?q=";

  ///Mock Endpoints
  static final String mockEndpoint =
      "http://www.mocky.io/v2/5e5c3b213000002f5df9f33b";
//  static final String mockEndpoint =
//      "http://www.mocky.io/v2/5e58d7832f000077099621b4";
}
