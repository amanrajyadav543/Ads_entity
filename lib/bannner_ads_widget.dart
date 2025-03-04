

import 'package:ads_entity/ads_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({Key? key}) : super(key: key);

  @override
  _BannerAdWidgetState createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  BannerAd? _bannerAd;
  bool _isAdLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadBannerAd();
  }

  void _loadBannerAd() {
    String? adUnitId = AdsManager().getNextAdUnit("banner");

    print("No available Banner Ad Units");
    print(adUnitId);
    print(adUnitId);
    print(adUnitId);
    print(adUnitId);
    print(adUnitId);
    print(adUnitId);
    print(adUnitId);

    if (adUnitId == null) {
      print("No available Banner Ad Units");
      return;
    }

    _bannerAd = BannerAd(
      adUnitId: adUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) => setState(() => _isAdLoaded = true),
        onAdFailedToLoad: (ad, error) {
          print("Ad failed to load: $error");
          ad.dispose();
        },
      ),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    return _isAdLoaded && _bannerAd != null
        ? SizedBox(
      width: _bannerAd!.size.width.toDouble(),
      height: _bannerAd!.size.height.toDouble(),
      child: AdWidget(ad: _bannerAd!),
    )
        : const SizedBox(); // Placeholder if no ad available
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }
}
//
// import 'package:ads_package/ads_manager.dart';
// import 'package:ads_package/model.dart';
// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
//
// class BannerAdWidget extends StatefulWidget {
//   final String adType;
//   const BannerAdWidget({Key? key, required this.adType}) : super(key: key);
//
//   @override
//   _BannerAdWidgetState createState() => _BannerAdWidgetState();
// }
//
// class _BannerAdWidgetState extends State<BannerAdWidget> {
//   BannerAd? _bannerAd;
//   bool _isAdLoaded = false;
//   AdsResponse? adModel;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadBannerAd();
//   }
//
//   void _loadBannerAd() {
//     adModel = AdsManager().getNextAdUnit(widget.adType);
//
//     if (adModel == null || adModel!.adUnitId.isEmpty) {
//       print("No available Banner Ad");
//       return;
//     }
//
//     if (widget.adType == 'google') {
//       _bannerAd = BannerAd(
//         adUnitId: adModel!.adUnitId,
//         size: AdSize.banner,
//         request: const AdRequest(),
//         listener: BannerAdListener(
//           onAdLoaded: (_) {
//             print("Banner Ad Loaded: ${adModel!.adUnitId}");
//             setState(() => _isAdLoaded = true);
//           },
//           onAdFailedToLoad: (ad, error) {
//             print("Banner Ad failed to load: $error");
//             ad.dispose();
//           },
//         ),
//       )..load();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (widget.adType == 'google') {
//       return _isAdLoaded && _bannerAd != null
//           ? SizedBox(
//         width: _bannerAd!.size.width.toDouble(),
//         height: _bannerAd!.size.height.toDouble(),
//         child: AdWidget(ad: _bannerAd!),
//       )
//           : const SizedBox(); // Placeholder if not loaded
//     } else if (widget.adType == 'custom' && adModel != null) {
//       return SizedBox(
//         width: double.infinity,
//         height: 100,
//         child: Image.network(
//           adModel!.cdnLink,
//           fit: BoxFit.cover,
//           errorBuilder: (context, error, stackTrace) => const Center(
//             child: Text('Failed to load custom ad'),
//           ),
//         ),
//       );
//     } else if (widget.adType == 'facebook') {
//       return SizedBox(
//         width: double.infinity,
//         height: 100,
//         child: Center(
//           child: Text(
//             'Facebook Ad Placeholder',
//             style: TextStyle(fontSize: 16, color: Colors.black),
//           ),
//         ),
//       );
//     } else {
//       return const SizedBox(); // If no valid ad type
//     }
//   }
//
//   @override
//   void dispose() {
//     _bannerAd?.dispose();
//     super.dispose();
//   }
// }
//
// import 'package:ads_package/ads_manager.dart';
// import 'package:ads_package/model.dart';
// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
//
// class BannerAdWidget extends StatefulWidget {
//   final String adType;
//
//   const BannerAdWidget({Key? key, required this.adType}) : super(key: key);
//
//   @override
//   _BannerAdWidgetState createState() => _BannerAdWidgetState();
// }
//
// class _BannerAdWidgetState extends State<BannerAdWidget> {
//   BannerAd? _bannerAd;
//   bool _isAdLoaded = false;
//   Ads? adModel;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadBannerAd();
//   }
//
//   void _loadBannerAd() {
//     adModel = AdsManager().getNextAdUnit(widget.adType);
//     if (adModel == null || adModel!.adUnitId.isEmpty) {
//       print("No available Banner Ad");
//       return;
//     }
//
//     if (widget.adType == 'google') {
//       _bannerAd = BannerAd(
//         adUnitId: adModel!.adUnitId,
//         size: AdSize.banner,
//         request: const AdRequest(),
//         listener: BannerAdListener(
//           onAdLoaded: (_) {
//             print("Banner Ad Loaded: ${adModel!.adUnitId}");
//             setState(() => _isAdLoaded = true);
//           },
//           onAdFailedToLoad: (ad, error) {
//             print("Banner Ad failed to load: $error");
//             ad.dispose();
//           },
//         ),
//       )..load();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (widget.adType == 'google') {
//       return _isAdLoaded && _bannerAd != null
//           ? SizedBox(
//         width: _bannerAd!.size.width.toDouble(),
//         height: _bannerAd!.size.height.toDouble(),
//         child: AdWidget(ad: _bannerAd!),
//       )
//           : const SizedBox();
//     } else if (widget.adType == 'custom' && adModel != null) {
//       return SizedBox(
//         width: double.infinity,
//         height: 100,
//         child: Image.network(
//           adModel!.cdnLink,
//           fit: BoxFit.cover,
//           errorBuilder: (context, error, stackTrace) => const Center(
//             child: Text('Failed to load custom ad'),
//           ),
//         ),
//       );
//     } else if (widget.adType == 'facebook') {
//       return const SizedBox(
//         width: double.infinity,
//         height: 100,
//         child: Center(
//           child: Text(
//             'Facebook Ad Placeholder',
//             style: TextStyle(fontSize: 16, color: Colors.black),
//           ),
//         ),
//       );
//     } else {
//       return const SizedBox();
//     }
//   }
//
//   @override
//   void dispose() {
//     _bannerAd?.dispose();
//     super.dispose();
//   }
// }
