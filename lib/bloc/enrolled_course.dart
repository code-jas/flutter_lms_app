import 'dart:async';

import 'package:learning_app/models/enrolled_course.dart';

class EnrolledCourseBloc {
  final List<EnrolledCourse> _enrolledCourses = [];

  final _enrolledCoursesController = StreamController<List<EnrolledCourse>>.broadcast();

  Stream<List<EnrolledCourse>> get enrolledCourses => _enrolledCoursesController.stream;

  void addCourse(EnrolledCourse course) {
    _enrolledCourses.add(course);
    _enrolledCoursesController.sink.add(_enrolledCourses);
  }

  void removeCourse(int courseId) {
    _enrolledCourses.removeWhere((course) => course.id == courseId);
    _enrolledCoursesController.sink.add(_enrolledCourses);
  }

  void dispose() {
    _enrolledCoursesController.close();
  }

  bool isEnrolled(int courseId) {
    return _enrolledCourses.any((course) => course.id == courseId);
  }
  // put getters here
}
