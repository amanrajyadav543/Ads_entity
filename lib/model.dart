// class AdsResponse {
//   final String message;
//   final int totalAds;
//   final List<Ads> ads;
//
//   AdsResponse({
//     required this.message,
//     required this.totalAds,
//     required this.ads,
//   });
//
//   factory AdsResponse.fromJson(Map<String, dynamic> json) {
//     return AdsResponse(
//       message: json['message'],
//       totalAds: json['totalAds'],
//       ads: List<Ads>.from(json['ads'].map((x) => Ads.fromJson(x))),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'message': message,
//       'totalAds': totalAds,
//       'ads': ads.map((x) => x.toJson()).toList(),
//     };
//   }
// }
//
// class Ads {
//   final String id;
//   final int adId;
//   final String type;
//   final String typeName;
//   final String typeSize;
//   final String clientRedirectUrl;
//   final String adsName;
//   final String cdnLink;
//   final String adsPosition;
//   final String adsType;
//   final String adUnitId;
//   final int adsStatus;
//   final int adsRotation;
//   final String country;
//   final int rotationOrder;
//   final int company;
//   final int contentType;
//   final int impressionCount;
//   final String? lastImpressionAt;
//
//   Ads({
//     required this.id,
//     required this.adId,
//     required this.type,
//     required this.typeName,
//     required this.typeSize,
//     required this.clientRedirectUrl,
//     required this.adsName,
//     required this.cdnLink,
//     required this.adsPosition,
//     required this.adsType,
//     required this.adUnitId,
//     required this.adsStatus,
//     required this.adsRotation,
//     required this.country,
//     required this.rotationOrder,
//     required this.company,
//     required this.contentType,
//     required this.impressionCount,
//     this.lastImpressionAt,
//   });
//
//   factory Ads.fromJson(Map<String, dynamic> json) {
//     return Ads(
//       id: json['_id'],
//       adId: json['id'],
//       type: json['type'],
//       typeName: json['type_name'],
//       typeSize: json['type_size'],
//       clientRedirectUrl: json['client_redirect_url'],
//       adsName: json['ads_name'],
//       cdnLink: json['cdnlink'],
//       adsPosition: json['ads_position'],
//       adsType: json['ads_type'],
//       adUnitId: json['ad_unit_id'],
//       adsStatus: json['ads_status'],
//       adsRotation: json['ads_rotation'],
//       country: json['country'],
//       rotationOrder: json['rotation_order'],
//       company: json['company'],
//       contentType: json['content_type'],
//       impressionCount: json['impressionCount'],
//       lastImpressionAt: json['lastImpressionAt'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'id': adId,
//       'type': type,
//       'type_name': typeName,
//       'type_size': typeSize,
//       'client_redirect_url': clientRedirectUrl,
//       'ads_name': adsName,
//       'cdnlink': cdnLink,
//       'ads_position': adsPosition,
//       'ads_type': adsType,
//       'ad_unit_id': adUnitId,
//       'ads_status': adsStatus,
//       'ads_rotation': adsRotation,
//       'country': country,
//       'rotation_order': rotationOrder,
//       'company': company,
//       'content_type': contentType,
//       'impressionCount': impressionCount,
//       'lastImpressionAt': lastImpressionAt,
//     };
//   }
// }



class AdsResponse {
  final String message;
  final int totalAds;
  final List<Ads> ads;

  AdsResponse({
    required this.message,
    required this.totalAds,
    required this.ads,
  });

  factory AdsResponse.fromJson(Map<String, dynamic> json) {
    return AdsResponse(
      message: json['message'],
      totalAds: json['totalAds'],
      ads: List<Ads>.from(json['ads'].map((x) => Ads.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'totalAds': totalAds,
      'ads': ads.map((x) => x.toJson()).toList(),
    };
  }
}

class Ads {
  final String id;
  final int adId;
  final String type;
  final String typeName;
  final String typeSize;
  final String clientRedirectUrl;
  final String adsName;
  final String cdnLink;
  final String adsPosition;
  final String adsType;
  final String adUnitId;
  final int adsStatus;
  final int adsRotation;
  final String country;
  final int rotationOrder;
  final int company;
  final int contentType;
  final int impressionCount;
  final String? lastImpressionAt;

  Ads({
    required this.id,
    required this.adId,
    required this.type,
    required this.typeName,
    required this.typeSize,
    required this.clientRedirectUrl,
    required this.adsName,
    required this.cdnLink,
    required this.adsPosition,
    required this.adsType,
    required this.adUnitId,
    required this.adsStatus,
    required this.adsRotation,
    required this.country,
    required this.rotationOrder,
    required this.company,
    required this.contentType,
    required this.impressionCount,
    this.lastImpressionAt,
  });

  factory Ads.fromJson(Map<String, dynamic> json) {
    return Ads(
      id: json['_id'],
      adId: json['id'],
      type: json['type'],
      typeName: json['type_name'],
      typeSize: json['type_size'],
      clientRedirectUrl: json['client_redirect_url'],
      adsName: json['ads_name'],
      cdnLink: json['cdnlink'],
      adsPosition: json['ads_position'],
      adsType: json['ads_type'],
      adUnitId: json['ad_unit_id'],
      adsStatus: json['ads_status'],
      adsRotation: json['ads_rotation'],
      country: json['country'],
      rotationOrder: json['rotation_order'],
      company: json['company'],
      contentType: json['content_type'],
      impressionCount: json['impressionCount'],
      lastImpressionAt: json['lastImpressionAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'id': adId,
      'type': type,
      'type_name': typeName,
      'type_size': typeSize,
      'client_redirect_url': clientRedirectUrl,
      'ads_name': adsName,
      'cdnlink': cdnLink,
      'ads_position': adsPosition,
      'ads_type': adsType,
      'ad_unit_id': adUnitId,
      'ads_status': adsStatus,
      'ads_rotation': adsRotation,
      'country': country,
      'rotation_order': rotationOrder,
      'company': company,
      'content_type': contentType,
      'impressionCount': impressionCount,
      'lastImpressionAt': lastImpressionAt,
    };
  }
}
