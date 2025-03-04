
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'ads_manager.dart';

class InterstitialAdHandler {
  InterstitialAd? _interstitialAd;

  void loadInterstitialAd() {
    String? ad = AdsManager().getNextAdUnit("interstitial");

    if (ad == null) {
      print("No available Interstitial Ad Units");
      return;
    }

    InterstitialAd.load(
      adUnitId: ad,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (loadedAd) {
          print("Interstitial Ad Loaded: ${ad}");
          _interstitialAd = loadedAd;
        },
        onAdFailedToLoad: (error) {
          print("Interstitial Ad failed to load: $error");
        },
      ),
    );
  }

  void showInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          print("Interstitial Ad dismissed");
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          print("Interstitial Ad failed to show: $error");
        },
      );
      _interstitialAd!.show();
      _interstitialAd = null; // Clear after showing
    } else {
      print("No Interstitial Ad to show");
    }
  }
}
