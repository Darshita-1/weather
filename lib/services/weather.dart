import 'package:weather/services/loc.dart';
import 'package:weather/services/networking.dart';

const weaURL = 'https://api.openweathermap.org/data/2.5/weather';
const apikey = 'fce150427a05482d180e3f763d38e025';

class WeatherModel {
  Future<dynamic> getlocationbycity(String city) async {
    print('we are almost there');
    Networkhelper A = Networkhelper(Uri.parse('$weaURL?q=$city&appid=$apikey'));
    var data = await A.getdata();
    return data;
  }

  Future<dynamic> getlocationweather() async {
    print('we are almost there');
    Location loc = Location();
    await loc.getcurrentlocation();
    Networkhelper N = Networkhelper(Uri.parse(
        '$weaURL?lat=${loc.latitude}&lon=${loc.longitude}&appid=$apikey&units=metric'));
    var weatherdata = await N.getdata();
    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
