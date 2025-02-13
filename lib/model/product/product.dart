class Product {
  final List<Listing> data;

  Product({required this.data});

  factory Product.fromJson(Map<String, dynamic> json) {
    final List<dynamic> list = json["data"];
    return Product(
        data: list
            .map((x) => Listing.fromJson(x as Map<String, dynamic>))
            .toList());
  }

  Map<String, dynamic> toJson() => {
        "data": data.map((x) => x.toJson()).toList(),
      };
}

class Listing {
  final String id;
  final String deviceCondition;
  final String listedBy;
  final String deviceStorage;
  final List<Image> images;
  final DefaultImage defaultImage;
  final String listingState;
  final String listingLocation;
  final String listingLocality;
  final String listingPrice;
  final String make;
  final String marketingName;
  final bool openForNegotiation;
  final double discountPercentage;
  final bool verified;
  final String listingId;
  final String status;
  final String verifiedDate;
  final String listingDate;
  final String deviceRam;
  final String warranty;
  final String imagePath;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Location location;
  final int originalPrice;
  final int discountedPrice;

  Listing({
    required this.id,
    required this.deviceCondition,
    required this.listedBy,
    required this.deviceStorage,
    required this.images,
    required this.defaultImage,
    required this.listingState,
    required this.listingLocation,
    required this.listingLocality,
    required this.listingPrice,
    required this.make,
    required this.marketingName,
    required this.openForNegotiation,
    required this.discountPercentage,
    required this.verified,
    required this.listingId,
    required this.status,
    required this.verifiedDate,
    required this.listingDate,
    required this.deviceRam,
    required this.warranty,
    required this.imagePath,
    required this.createdAt,
    required this.updatedAt,
    required this.location,
    required this.originalPrice,
    required this.discountedPrice,
  });

  factory Listing.fromJson(Map<String, dynamic> json) => Listing(
        id: json["_id"] as String,
        deviceCondition: json["deviceCondition"] as String,
        listedBy: json["listedBy"] as String,
        deviceStorage: json["deviceStorage"] as String,
        images: List<Image>.from(
            (json["images"] as List<dynamic>).map((x) => Image.fromJson(x))),
        defaultImage:
            DefaultImage.fromJson(json["defaultImage"] as Map<String, dynamic>),
        listingState: json["listingState"] as String,
        listingLocation: json["listingLocation"] as String,
        listingLocality: json["listingLocality"] as String,
        listingPrice: json["listingPrice"] as String,
        make: json["make"] as String,
        marketingName: json["marketingName"] as String,
        openForNegotiation: json["openForNegotiation"] as bool,
        discountPercentage: json["discountPercentage"] == null
            ? 0.0
            : (json["discountPercentage"] as num).toDouble(),
        verified: json["verified"] as bool,
        listingId: json["listingId"] as String,
        status: json["status"] as String,
        verifiedDate: json["verifiedDate"] as String,
        listingDate: json["listingDate"] as String,
        deviceRam: json["deviceRam"] as String,
        warranty: json["warranty"] as String,
        imagePath: json["imagePath"] as String,
        createdAt: DateTime.parse(json["createdAt"] as String),
        updatedAt: DateTime.parse(json["updatedAt"] as String),
        location: Location.fromJson(json["location"] as Map<String, dynamic>),
        originalPrice: json["originalPrice"] == null
            ? 0
            : json["originalPrice"] is int
                ? json["originalPrice"] as int
                : int.tryParse(json["originalPrice"].toString()) ?? 0,
        discountedPrice: json["discountedPrice"] == null
            ? 0
            : json["discountedPrice"] is int
                ? json["discountedPrice"] as int
                : int.tryParse(json["discountedPrice"].toString()) ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "deviceCondition": deviceCondition,
        "listedBy": listedBy,
        "deviceStorage": deviceStorage,
        "images": images.map((x) => x.toJson()).toList(),
        "defaultImage": defaultImage.toJson(),
        "listingState": listingState,
        "listingLocation": listingLocation,
        "listingLocality": listingLocality,
        "listingPrice": listingPrice,
        "make": make,
        "marketingName": marketingName,
        "openForNegotiation": openForNegotiation,
        "discountPercentage": discountPercentage,
        "verified": verified,
        "listingId": listingId,
        "status": status,
        "verifiedDate": verifiedDate,
        "listingDate": listingDate,
        "deviceRam": deviceRam,
        "warranty": warranty,
        "imagePath": imagePath,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "location": location.toJson(),
        "originalPrice": originalPrice,
        "discountedPrice": discountedPrice,
      };
}

class Image {
  final String thumbImage;
  final String fullImage;
  final String isVarified;
  final String? option;
  final String id;

  Image({
    required this.thumbImage,
    required this.fullImage,
    required this.isVarified,
    this.option,
    required this.id,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        thumbImage: json["thumbImage"] as String,
        fullImage: json["fullImage"] as String,
        isVarified: json["isVarified"] as String,
        option: json["option"] as String?,
        id: json["_id"] as String,
      );

  Map<String, dynamic> toJson() => {
        "thumbImage": thumbImage,
        "fullImage": fullImage,
        "isVarified": isVarified,
        "option": option,
        "_id": id,
      };
}

class DefaultImage {
  final String fullImage;
  final String id;

  DefaultImage({required this.fullImage, required this.id});

  factory DefaultImage.fromJson(Map<String, dynamic> json) => DefaultImage(
        fullImage: json["fullImage"] as String,
        id: json["_id"] as String,
      );

  Map<String, dynamic> toJson() => {
        "fullImage": fullImage,
        "_id": id,
      };
}

class Location {
  final String type;
  final List<double> coordinates;
  final String id;

  Location({required this.type, required this.coordinates, required this.id});

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        type: json["type"] as String,
        coordinates: List<double>.from((json["coordinates"] as List<dynamic>)
            .map((x) => (x as num).toDouble())),
        id: json["_id"] as String,
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": coordinates,
        "_id": id,
      };
}
