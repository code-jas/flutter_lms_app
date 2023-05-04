class Course {
  final int id;
  final String title;
  final String author;
  final String authorImage;
  final String courseImage;
  final String ratings;
  final String shortDescription;
  final List<String> category;
  final List<String> description;
  final List<CourseContent> contents;

  Course({
    required this.id,
    required this.title,
    required this.category,
    required this.author,
    required this.ratings,
    required this.authorImage,
    required this.courseImage,
    required this.shortDescription,
    required this.description,
    required this.contents,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    List<dynamic> contentsJson = json['contents'];
    List<CourseContent> contents = contentsJson
        .map((contentJson) => CourseContent.fromJson(contentJson))
        .toList();

    return Course(
      id: json['id'],
      title: json['title'],
      category: List<String>.from(json['category']),
      author: json['author'],
      ratings: json['ratings'],
      authorImage: json['authorImage'],
      courseImage: json['courseImage'],
      shortDescription: json['shortDescription'],
      description: List<String>.from(json['description']),
      contents: contents,
    );
  }
}

class CourseContent {
  final String title;
  final List<CourseSubTopic> subTopicList;
  final String type;
  final String duration;
  final bool isDone;

  CourseContent({
    required this.title,
    required this.subTopicList,
    required this.type,
    required this.duration,
    required this.isDone,
  });

  factory CourseContent.fromJson(Map<String, dynamic> json) {
    List<dynamic> subTopicListJson = json['subTopicList'];
    List<CourseSubTopic> subTopicList = subTopicListJson
        .map((subTopicJson) => CourseSubTopic.fromJson(subTopicJson))
        .toList();

    return CourseContent(
      title: json['title'],
      subTopicList: subTopicList,
      type: json['type'],
      duration: json['duration'],
      isDone: json['isDone'],
    );
  }
}

class CourseSubTopic {
  final String subTopic;
  final List<String> subTopicContent;

  CourseSubTopic({
    required this.subTopic,
    required this.subTopicContent,
  });

  factory CourseSubTopic.fromJson(Map<String, dynamic> json) {
    return CourseSubTopic(
      subTopic: json['subTopic'],
      subTopicContent: List<String>.from(json['subTopicContent']),
    );
  }
}
