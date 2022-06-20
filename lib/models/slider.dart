class Slider {
  final String sliderImageUrl;
  final String sliderHeading;
  final String sliderSubHeading;
  final String skipBtn;

  Slider({
    required this.sliderImageUrl,
    required this.sliderHeading,
    required this.sliderSubHeading,
    required this.skipBtn,
  });
}

final sliderArrayList = [
  Slider(
      sliderImageUrl: 'assets/images/slider_image.png',
      sliderHeading: 'Slider Heading',
      sliderSubHeading: 'Slider view1',
      skipBtn: 'skip'),
  Slider(
      sliderImageUrl: 'assets/images/slider_image.png',
      sliderHeading: 'Slider Heading',
      sliderSubHeading: 'Slider view2',
      skipBtn: 'skip'),
  Slider(
      sliderImageUrl: 'assets/images/slider_image.png',
      sliderHeading: 'Slider Heading',
      sliderSubHeading: 'Slider view3',
      skipBtn: 'skip'),
  Slider(
      sliderImageUrl: 'assets/images/slider_image.png',
      sliderHeading: 'Slider Heading',
      sliderSubHeading: 'Slider view4',
      skipBtn: 'skip'),
];
