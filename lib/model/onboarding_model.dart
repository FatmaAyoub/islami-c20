class OnboardingModel{
  final String image;
  final String title;
  final String? description;

  const OnboardingModel({
    this.description,
    required this.image,
    required this.title,
  });

  static const List<OnboardingModel> item = [
    OnboardingModel(
      image: 'assets/images/Frame 3.png',
      title: 'Welcome To Islmi App',
    ),
    OnboardingModel(
      description: 'We Are Very Excited To Have You In Our\nCommunity',
      image: 'assets/images/kabba.png',
      title: 'Welcome To Islami',
    ),
    OnboardingModel(
      description: 'Read, and your Lord is the Most Generous',
      image: 'assets/images/welcome.png',
      title: 'Reading the Quran',
    ),
    OnboardingModel(
      description: 'Praise the name of your Lord, the Most \nHigh',
      image: 'assets/images/bearish.png',
      title: 'Bearish',
    ),
    OnboardingModel(
      description:
          'You can listen to the Holy Quran Radio \nthrough the application for free and easily',
      image: 'assets/images/radio.png',
      title: 'Holy Quran Radio',
    ),
  ];
}


