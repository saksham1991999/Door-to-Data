class SocialListData {
  SocialListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
    this.meals,
    this.kacl = 0,
  });

  String imagePath;
  String titleTxt;
  String startColor;
  String endColor;
  List<String> meals;
  int kacl;

  static List<SocialListData> tabIconsList = <SocialListData>[
    SocialListData(
      imagePath: 'assets/socialapps/google.png',
      titleTxt: 'Google',
      kacl: 525,
      meals: <String>['Location,', 'Search', 'Ads'],
      startColor: '#FA7D82',
      endColor: '#FFB295',
    ),
    SocialListData(
      imagePath: 'assets/socialapps/fb.png',
      titleTxt: 'Facebook',
      kacl: 602,
      meals: <String>['Location,', 'Search', 'Ads'],
      startColor: '#738AE6',
      endColor: '#5C5EDD',
    ),
    SocialListData(
      imagePath: 'assets/socialapps/insta.png',
      titleTxt: 'Instagram',
      kacl: 0,
      meals: <String>['Location,', 'Search', 'Ads'],
      startColor: '#FE95B6',
      endColor: '#FF5287',
    ),
    SocialListData(
      imagePath: 'assets/socialapps/twitter.png',
      titleTxt: 'Twitter',
      kacl: 0,
      meals: <String>['Location,', 'Search', 'Ads'],
      startColor: '#6F72CA',
      endColor: '#1E1466',
    ),
  ];
}
