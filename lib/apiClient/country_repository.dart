import 'package:task_pro/model/country_model.dart';
import 'api_client.dart';

class CountryApiService
{

  Future<List<Country>> fetchCountries() async
  {
    print("GET COUNTRY LISt");
    print("https://restcountries.com/v3.1/all?fields=name,cca2,flags");
    try
    {
      final jsonData = await ApiClient().getJson(
        Uri.parse('https://restcountries.com/v3.1/all?fields=name,cca2,flags'),
      );
      final List<dynamic> list = jsonData;
      return list.map((e) => Country.fromJson(e)).toList();
    }
    on Exception
    {
      throw Exception();

    }
    catch(e)
    {
      throw Exception(e);
    }

  }
}
