class EndPoints {

  static const String baseUrl = 'https://new.easydealmasr.com/api/v1/';
  // static const String baseUrl = 'https://easydealmasr.com/api/v1/';
  static const String login = 'auth/login';
  static const String register = 'auth/register';
  static const String sendOtp = 'auth/send-otp';
  static const String verifyOtp = 'auth/check-otp';
  static const String logout = 'auth/logout';
  static const String unitDetails = 'unit';
  static const String bestSellerUnitsInHome = 'unit/advertisement-shuffle';
  static const String bestSellerUnitsInSearch = 'unit/advertisement-shuffle';
  static const String unitUniTypes = 'unit/unit-types';
  static const String dynamicForms = 'requests/create/dynamic-fields';
  static const String requests = 'requests';
  static const String users = 'users';
  static const String allUnits = 'unit?limit=20&offset=0';
  static const String cities = 'location/city';
  static const String areas = 'location/area';
  static const String subAreas = 'location/sub-area';
  static const String faqs = 'faqs';
  static const String aboutUs = 'about-us';
  static const String contactUs = 'contact-us';
  static const String reportsIssues = 'reports-issues';
  static const String socialMedia = 'social-media';
  static const String contentTerms = 'content/terms';
  static const String createRequest = 'requests/create';
  static const String recommendBrokers = 'requests/recommend/brokers';
  static const String assignToBrokers = 'requests/assign-to-brokers';
  static const String promoCodesLastApplied = 'promo-codes/last-applied';
  static const String promoCodesApply = 'promo-codes/apply';
  static const String requestsStatistics = 'requests/statistics';
  static const String advertisementShuffle = 'unit/advertisement-shuffle?limit=4&offset=0';
  static const String developers = 'developers?limit=10&offset=0&sort=desc&sortBy=id';
  static const String developerProjects = 'developers/projects';
  static const String brokerMaps = 'broker/maps';
  static const String brokerUnits = 'unit';
  static const String brokerFcmToken = 'broker/fcm-token';
  static const String brokerNotificationsCount = 'broker/notifications/count';
  static const String brokerNotifications = 'broker/notifications';



}