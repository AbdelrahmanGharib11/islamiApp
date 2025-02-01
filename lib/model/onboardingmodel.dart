class OnBoardingModel {
  String image;

  String promo;

  String? title;

  OnBoardingModel({required this.image, required this.promo, this.title});

  static List<OnBoardingModel> pages = [
    OnBoardingModel(
        image: 'assets/image/Group (1).png', promo: 'Welcome To Islmi App'),
    OnBoardingModel(
      image: 'assets/image/kabba.png',
      promo: 'We Are Very Excited To Have You In Our Community',
      title: 'Welcome To Islami',
    ),
    OnBoardingModel(
      image: 'assets/image/welcome.png',
      promo: 'Read, and your Lord is the Most Generous',
      title: 'Reading the Quran',
    ),
    OnBoardingModel(
      image: 'assets/image/bearish.png',
      promo: 'Praise the name of your Lord, the Most High',
      title: 'Bearish',
    ),
    OnBoardingModel(
      image: 'assets/image/bearish.png',
      promo:
          'You can listen to the Holy Quran Radio through the application for free and easily',
      title: 'Holy Quran Radio',
    ),
  ];
}
