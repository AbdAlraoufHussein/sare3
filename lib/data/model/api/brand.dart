
class Brand {
  final int id;
  final Attributes attributes;

  Brand({
    required this.id,
    required this.attributes,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id'],
      attributes: Attributes.fromJson(json['attributes']),
    );
  }
}

class Attributes {
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;
  final String locale;
  final String name;
  final ImageContainer image;

  Attributes({
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.publishedAt,
    required this.locale,
    required this.image,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) {
    return Attributes(
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      publishedAt: DateTime.parse(json['publishedAt']),
      locale: json['locale'],
      name: json['Name'],
      image: ImageContainer.fromJson(json['Image']),
    );
  }
}

class ImageContainer {
  final ImageData data;

  ImageContainer({required this.data});

  factory ImageContainer.fromJson(Map<String, dynamic> json) {
    return ImageContainer(
      data: ImageData.fromJson(json['data']),
    );
  }
}

class ImageData {
  final int id;
  final ImageAttributes attributes;

  ImageData({
    required this.id,
    required this.attributes,
  });

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(
      id: json['id'],
      attributes: ImageAttributes.fromJson(json['attributes']),
    );
  }
}

class ImageAttributes {
  final String name;
  final String? alternativeText;
  final String? caption;
  final int width;
  final int height;
  final Map<String, ImageFormat> formats;
  final String hash;
  final String ext;
  final String mime;
  final double size;
  final String url;
  final String? previewUrl;
  final String provider;
  final dynamic providerMetadata;
  final DateTime createdAt;
  final DateTime updatedAt;

  ImageAttributes({
    required this.name,
    this.alternativeText,
    this.caption,
    required this.width,
    required this.height,
    required this.formats,
    required this.hash,
    required this.ext,
    required this.mime,
    required this.size,
    required this.url,
    this.previewUrl,
    required this.provider,
    this.providerMetadata,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ImageAttributes.fromJson(Map<String, dynamic> json) {
    Map<String, ImageFormat> parsedFormats = {};
    if (json.containsKey('formats')) {
      json['formats'].forEach((key, value) {
        parsedFormats[key] = ImageFormat.fromJson(value);
      });
    }

    return ImageAttributes(
      name: json['name'],
      alternativeText: json['alternativeText'],
      caption: json['caption'],
      width: json['width'],
      height: json['height'],
      formats: parsedFormats,
      hash: json['hash'],
      ext: json['ext'],
      mime: json['mime'],
      size: json['size'].toDouble(),
      url: json['url'],
      previewUrl: json['previewUrl'],
      provider: json['provider'],
      providerMetadata: json['provider_metadata'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

class ImageFormat {
  final String name;
  final String hash;

  ImageFormat({
    required this.name,
    required this.hash,
  });

  factory ImageFormat.fromJson(Map<String, dynamic> json) {
    return ImageFormat(
      name: json['name'],
      hash: json['hash']
    );
  }
}