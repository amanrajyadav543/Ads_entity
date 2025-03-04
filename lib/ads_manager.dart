// import 'dart:convert';
//
// import 'package:ads_package/model.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:http/http.dart' as http;
//
// class AdsManager {
//   static final AdsManager _instance = AdsManager._internal();
//   factory AdsManager() => _instance;
//   AdsManager._internal();
//
//   bool _isInitialized = false;
//   // List<Map<String, dynamic>> _adUnits = [];
//   List<AdUnit> _adUnits = [];
//
//   int _currentAdIndex = 0;
//
//   /// ✅ Initialize Google Mobile Ads
//   Future<void> initializeAds() async {
//     if (!_isInitialized) {
//       await MobileAds.instance.initialize();
//       await fetchAdUnits(); // Fetch Ad Units from API
//       _isInitialized = true;
//     }
//   }
//
//   /// ✅ Fetch Ad Units from API
//   Future<void> fetchAdUnits() async {
//     try {
//       final url = Uri.parse("https://adsapi-jxp7.onrender.com/api/v1/show");
//       final response = await http.get(url);
//
//       if (response.statusCode == 200) {
//         print(response.body);
//         final data = json.decode(response.body);
//
//         if (data != null && data['ads'] != null) {
//           final List<dynamic> adsList = data['ads'];
//           _adUnits = adsList.map((ad) => AdUnit.fromJson(ad)).toList();
//           print("✅ Fetched ${_adUnits.length} ads successfully.");
//         } else {
//           print("⚠️ No 'ads' field found in the response.");
//           _adUnits = [];
//         }
//       } else {
//         print("❌ Failed to fetch ads. Status code: ${response.statusCode}");
//       }
//     } catch (e) {
//       print("❌ Error fetching ad units: $e");
//     }
//   }
//
//
//   /// ✅ Get Next Available Ad Unit (Rotating)
//   String? getNextAdUnit(String adType) {
//     if (_adUnits.isEmpty) return null;
//
//     // Find the next available AdUnit for the given type
//     while (_currentAdIndex < _adUnits.length) {
//       var adUnit = _adUnits[_currentAdIndex];
//       _currentAdIndex = (_currentAdIndex + 1) % _adUnits.length; // Rotate index
//
//       if (adUnit.adType == adType) {
//         return adUnit.adUnit;
//       }
//     }
//     return null;
//   }
// }

import 'dart:convert';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;
import 'model.dart';

class AdsManager {
  static final AdsManager _instance = AdsManager._internal();
  factory AdsManager() => _instance;
  AdsManager._internal();

  bool _isInitialized = false;
  List<Ads> _adsList = [];
  int _currentAdIndex = 0;

  /// ✅ Initialize Mobile Ads and fetch ads from API
  Future<void> initializeAds() async {
    if (!_isInitialized) {
      await MobileAds.instance.initialize();
      await fetchAdsFromAPI();
      _isInitialized = true;
    }
  }

  /// ✅ Fetch Ads from the API
  Future<void> fetchAdsFromAPI() async {
    try {
      final url = Uri.parse("https://adsapi-c4i1.onrender.com/api/v1/ads/get");
      final response = await http.get(url);
      // print(response);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print("amanraj");
        print(data);

        final adsResponse = AdsResponse.fromJson(data);
        print("amanraj2");
        print(adsResponse);
        _adsList = adsResponse.ads;
        print(_adsList[0].cdnLink);
        print("✅ Ads fetched: ${_adsList.length}");
      } else {
        print("❌ Failed to fetch ads. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("❌ Error fetching ads: $e");
    }
  }

  /// ✅ Get next available Ad Unit ID for a specific ad type (rotation logic)
  String? getNextAdUnit(String adType) {
    if (_adsList.isEmpty) return null;

    int startIndex = _currentAdIndex;
    do {
      final ad = _adsList[_currentAdIndex];
      _currentAdIndex = (_currentAdIndex + 1) % _adsList.length;

      if (ad.adsType == adType) {
        return ad.adUnitId;
      }
    } while (_currentAdIndex != startIndex);

    return null; // No matching ad type found
  }


  // Ads? getNextAdUnit(String adType) {
  //   if (_adsList.isEmpty) return null;
  //   int startIndex = _currentAdIndex;
  //   do {
  //     final ad = _adsList[_currentAdIndex];
  //     _currentAdIndex = (_currentAdIndex + 1) % _adsList.length;
  //     if (ad.adsType == adType) {
  //       return ad;
  //     }
  //   } while (_currentAdIndex != startIndex);
  //   return null; // No matching ad type found
  // }

}
