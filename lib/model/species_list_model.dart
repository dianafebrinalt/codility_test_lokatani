
import 'dart:convert';


SpeciesListResponse speciesListResponseFromJson(String str) => SpeciesListResponse.fromJson(json.decode(str));

String speciesListResponseToJson(SpeciesListResponse data) => json.encode(data.toJson());

class SpeciesListResponse {
    List<SpeciesListData> data;
    int to;
    int perPage;
    int currentPage;
    int from;
    int lastPage;
    int total;

    SpeciesListResponse({
        required this.data,
        required this.to,
        required this.perPage,
        required this.currentPage,
        required this.from,
        required this.lastPage,
        required this.total,
    });

    factory SpeciesListResponse.fromJson(Map<String, dynamic> json) => SpeciesListResponse(
        data: List<SpeciesListData>.from(json["data"].map((x) => SpeciesListData.fromJson(x))),
        to: json["to"],
        perPage: json["per_page"],
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "to": to,
        "per_page": perPage,
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "total": total,
    };
}

class SpeciesListData {
    int id;
    String commonName;
    List<String> scientificName;
    List<String> otherName;
    String cycle;
    Watering watering;
    List<Sunlight> sunlight;
    DefaultImage? defaultImage;

    SpeciesListData({
        required this.id,
        required this.commonName,
        required this.scientificName,
        required this.otherName,
        required this.cycle,
        required this.watering,
        required this.sunlight,
        required this.defaultImage,
    });

    factory SpeciesListData.fromJson(Map<String, dynamic> json) => SpeciesListData(
        id: json["id"],
        commonName: json["common_name"],
        scientificName: List<String>.from(json["scientific_name"].map((x) => x)),
        otherName: List<String>.from(json["other_name"].map((x) => x)),
        cycle: json["cycle"],
        watering: wateringValues.map[json["watering"]]!,
        sunlight: List<Sunlight>.from(json["sunlight"].map((x) => sunlightValues.map[x]!)),
        defaultImage: json["default_image"] == null ? null : DefaultImage.fromJson(json["default_image"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "common_name": commonName,
        "scientific_name": List<dynamic>.from(scientificName.map((x) => x)),
        "other_name": List<dynamic>.from(otherName.map((x) => x)),
        "cycle": cycle,
        "watering": wateringValues.reverse[watering],
        "sunlight": List<dynamic>.from(sunlight.map((x) => sunlightValues.reverse[x])),
        "default_image": defaultImage?.toJson(),
    };
}

class DefaultImage {
    int license;
    LicenseName licenseName;
    String licenseUrl;
    String originalUrl;
    String regularUrl;
    String mediumUrl;
    String smallUrl;
    String thumbnail;

    DefaultImage({
        required this.license,
        required this.licenseName,
        required this.licenseUrl,
        required this.originalUrl,
        required this.regularUrl,
        required this.mediumUrl,
        required this.smallUrl,
        required this.thumbnail,
    });

    factory DefaultImage.fromJson(Map<String, dynamic> json) => DefaultImage(
        license: json["license"],
        licenseName: licenseNameValues.map[json["license_name"]]!,
        licenseUrl: json["license_url"],
        originalUrl: json["original_url"],
        regularUrl: json["regular_url"],
        mediumUrl: json["medium_url"],
        smallUrl: json["small_url"],
        thumbnail: json["thumbnail"],
    );

    Map<String, dynamic> toJson() => {
        "license": license,
        "license_name": licenseNameValues.reverse[licenseName],
        "license_url": licenseUrl,
        "original_url": originalUrl,
        "regular_url": regularUrl,
        "medium_url": mediumUrl,
        "small_url": smallUrl,
        "thumbnail": thumbnail,
    };
}

enum LicenseName {
    ATTRIBUTION_LICENSE,
    ATTRIBUTION_SHARE_ALIKE_30_UNPORTED_CC_BY_SA_30,
    ATTRIBUTION_SHARE_ALIKE_LICENSE,
    CC0_10_UNIVERSAL_CC0_10_PUBLIC_DOMAIN_DEDICATION
}

final licenseNameValues = EnumValues({
    "Attribution License": LicenseName.ATTRIBUTION_LICENSE,
    "Attribution-ShareAlike 3.0 Unported (CC BY-SA 3.0)": LicenseName.ATTRIBUTION_SHARE_ALIKE_30_UNPORTED_CC_BY_SA_30,
    "Attribution-ShareAlike License": LicenseName.ATTRIBUTION_SHARE_ALIKE_LICENSE,
    "CC0 1.0 Universal (CC0 1.0) Public Domain Dedication": LicenseName.CC0_10_UNIVERSAL_CC0_10_PUBLIC_DOMAIN_DEDICATION
});

enum Sunlight {
    FILTERED_SHADE,
    FULL_SUN,
    PART_SHADE,
    PART_SUN_PART_SHADE,
    SUNLIGHT_FULL_SUN
}

final sunlightValues = EnumValues({
    "filtered shade": Sunlight.FILTERED_SHADE,
    "full sun": Sunlight.FULL_SUN,
    "part shade": Sunlight.PART_SHADE,
    "part sun/part shade": Sunlight.PART_SUN_PART_SHADE,
    "Full sun": Sunlight.SUNLIGHT_FULL_SUN
});

enum Watering {
    AVERAGE,
    FREQUENT
}

final wateringValues = EnumValues({
    "Average": Watering.AVERAGE,
    "Frequent": Watering.FREQUENT
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
