class PitchModel {
  int? id;
  late String title;
  bool isFavorite;
  late String description;
  String? imageUrl;
  late String category;
  late double estimatedAmount;
  String? howPreviousMoneySpent;

  PitchModel({
    this.isFavorite = false,
    this.id,
    required this.category,
    required this.description,
    required this.estimatedAmount,
    this.howPreviousMoneySpent,
    this.imageUrl,
    required this.title,
  });

  factory PitchModel.fromJson(Map<String, dynamic> json) => PitchModel(
        id: json['id'],
        isFavorite: json['isFav'],
        imageUrl: json['imageUrl'],
        howPreviousMoneySpent: json['howPreviousMoneySpent'],
        category: json['category'],
        description: json['description'],
        estimatedAmount: json['estimatedAmount'],
        title: json['title'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'isFav': isFavorite,
        'imageUrl': imageUrl,
        'howPreviousMoneySpent': howPreviousMoneySpent,
        'category': category,
        'description': description,
        'estimatedAmount': estimatedAmount,
        'title': title,
      };
}
