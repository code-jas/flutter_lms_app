import 'package:learning_app/screens/main/course_content_list.dart';

class Course {
  int id;
  String title;
  String category;
  List<String> description;
  String author;
  String authorImage;
  String courseImage;

  Course({
    required this.id,
    required this.title,
    required this.category,
    required this. description,
    required this.author,
    required this.authorImage,
    required this.courseImage,
    required List<CourseContentList> contents,
  });
}

class CourseContentList {
  String title;
  List<SubTopicList> subTopicList; // updated property
  late String type;
  late String duration;
  late bool isDone;

  CourseContentList({
    required this.title,
    required this.subTopicList,
    required String type,
    required String duration,
    required bool isDone,
  });
}

class SubTopicList {
  String subTopic;
  List<String> subTopicContent;

  SubTopicList({required this.subTopic, required this.subTopicContent});
}

List<Course> data = [
  Course(
    id: 1,
    title: "Data Mining",
    category:
        "data mining, statistics, visualization, data science, data analysis, python, deep learning, classifier, random forest, data analysis",
    author: "John Angelo Silvestre",
    authorImage: "assets/images/author1.png",
    courseImage: "assets/images/course1.png",
    description: [
      "The data mining tutorial provides basic and advanced concepts of data mining. Our data mining tutorial is designed for learners and experts.",
      "Data mining is one of the most useful techniques that help entrepreneurs, researchers, and individuals to extract valuable information from huge sets of data. Data mining is also called Knowledge Discovery in Database (KDD). The knowledge discovery process includes Data cleaning, Data integration, Data selection, Data transformation, Data mining, Pattern evaluation, and Knowledge presentation.",
      "Our Data mining tutorial includes all topics of Data mining such as applications, Data mining vs Machine learning, Data mining tools, Social Media Data mining, Data mining techniques, Clustering in data mining, Challenges in Data mining, etc.",
    ],
    contents: [
      CourseContentList(
        title: "Introduction",
        subTopicList: [
          SubTopicList(
            subTopic: "What is Data Mining?",
            subTopicContent: [
              "The process of extracting information to identify patterns, trends, and useful data that would allow the business to take the data-driven decision from huge sets of data is called Data Mining.",
              "In other words, we can say that Data Mining is the process of investigating hidden patterns of information to various perspectives for categorization into useful data, which is collected and assembled in particular areas such as data warehouses, efficient analysis, data mining algorithm, helping decision making and other data requirement to eventually cost-cutting and generating revenue.",
              "Data mining is the act of automatically searching for large stores of information to find trends and patterns that go beyond simple analysis procedures. Data mining utilizes complex mathematical algorithms for data segments and evaluates the probability of future events. Data Mining is also called Knowledge Discovery of Data (KDD).",
              "Data Mining is a process used by organizations to extract specific data from huge databases to solve business problems. It primarily turns raw data into useful information.",
              "Data Mining is similar to Data Science carried out by a person, in a specific situation, on a particular data set, with an objective. This process includes various types of services such as text mining, web mining, audio and video mining, pictorial data mining, and social media mining. It is done through software that is simple or highly specific. By outsourcing data mining, all the work can be done faster with low operation costs. Specialized firms can also use new technologies to collect data that is impossible to locate manually. There are tons of information available on various platforms, but very little knowledge is accessible. The biggest challenge is to analyze the data to extract important information that can be used to solve a problem or for company development. There are many powerful instruments and techniques available to mine data and find better insight from it. How does Machine Learning work",
            ],
          ),
        ],
        type: "Readings",
        duration: "5:35",
        isDone: true,
      ),
    ],
  ),
  // Course(
  //   id: 2,
  //   title: title,
  //   category: category,
  //   description: description,
  //   author: author,
  //   authorImage: authorImage,
  //   courseImage: courseImage,
  // )
];
