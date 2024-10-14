

class DashboardModel {
  final String sloonType;
  final String visitType;
  final List<dynamic>? banners;
  final List<dynamic>? trending;
  final List<dynamic>? lookingFor;
  final List<LatestVideosItem>? latestVideos;
  final List<dynamic>? testimonials;

  DashboardModel({
    required this.sloonType,
    required this.visitType,
    required this.banners,
    required this.trending,
    required this.lookingFor,
    required this.latestVideos,
    required this.testimonials,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
    sloonType: json['sloonType'],
    visitType: json['visitType'],
    banners: json['banners']?.map((e) => e)?.toList(),
    trending: json['trending']?.map((e) => e)?.toList(),
    lookingFor: json['lookingFor']?.map((e) => e)?.toList(),
    latestVideos: (json['latestVideos'] as List<dynamic>?)
        ?.map((e) => LatestVideosItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    testimonials: json['testimonials']?.map((e) => e)?.toList(),
  );

  Map<String, dynamic> toJson() => {
    'sloonType': sloonType,
    'visitType': visitType,
    'banners': banners?.map((e) => e).toList(),
    'trending': trending?.map((e) => e).toList(),
    'lookingFor': lookingFor?.map((e) => e).toList(),
    'latestVideos': latestVideos?.map((e) => e.toJson()).toList(),
    'testimonials': testimonials?.map((e) => e).toList(),
  };
}

class LatestVideosItem {
  final int id;
  final String? title;
  final String? description;
  final String? url;

  LatestVideosItem({
    this.id = 0,
    this.title = "",
    this.description = "",
    this.url = "",
  });

  factory LatestVideosItem.fromJson(Map<String, dynamic> json) => LatestVideosItem(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    url: json['url'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'url': url,
  };
}

