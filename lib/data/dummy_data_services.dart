class DummyDataServices {
  final List weatherData = [
    {
      'UVIndex': '4',
      'sunriseTime': '5:28 AM',
      'sunsetTime': '7:25 Pm',
      'wind': '9.7',
      'LHRainFallInMM': '1.9',
      'fullDayRainFallInMM': '1.2',
      'feelsLike': '19',
      'humidity': '90',
      'visibility': '8'
    }
  ];

  final List hourlyData = [
    {
      'time': '12 PM',
      'rainChances': 10,
      'temprature': 17,
      'isNow': false,
    },
    {
      'time': '12 PM',
      'rainChances': 80,
      'temprature': 17,
      'isNow': true,
    },
    {
      'time': '12 PM',
      'rainChances': 0,
      'temprature': 17,
      'isNow': false,
    },
    {
      'time': '12 PM',
      'rainChances': 45,
      'temprature': 17,
      'isNow': false,
    },
    {
      'time': '12 PM',
      'rainChances': 90,
      'temprature': 17,
      'isNow': false,
    }
  ];
}
