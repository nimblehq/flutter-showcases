import 'dart:async';

import 'package:responsive_ui/data/repositories/use_case_result.dart';

class InterestSection {
  final String title;
  final List<String> interests;

  InterestSection(this.title, this.interests);
}

/// Interface to the Interests data layer.
abstract class InterestsRepository {
  /// Get relevant topics to the user.
  Future<Result<List<InterestSection>>> getTopics();

  /// Get list of people.
  Future<Result<List<String>>> getPeople();

  /// Get list of publications.
  Future<Result<List<String>>> getPublications();

  /// Toggle between selected and unselected
  toggleTopicSelection(TopicSelection topic);

  /// Toggle between selected and unselected
  togglePersonSelected(String person);

  /// Toggle between selected and unselected
  togglePublicationSelected(String publication);

  /// Currently selected topics
  Stream<Set<TopicSelection>> observeTopicsSelected();

  /// Currently selected people
  Stream<Set<String>> observePeopleSelected();

  /// Currently selected publications
  Stream<Set<String>> observePublicationSelected();
}

class TopicSelection {
  final String section;
  final String topic;

  TopicSelection(this.section, this.topic);
}

class FakeInterestRepository extends InterestsRepository {
  final List<InterestSection> topics = [
    InterestSection("Android", ["Jetpack Compose", "Kotlin", "Jetpack"]),
    InterestSection("Programming", [
      "Kotlin",
      "Declarative UIs",
      "Java",
      "Unidirectional Data Flow",
      "C++"
    ]),
    InterestSection("Technology", ["Pixel", "Google"])
  ];

  final List<String> people = [
    "Kobalt Toral",
    "K'Kola Uvarek",
    "Kris Vriloc",
    "Grala Valdyr",
    "Kruel Valaxar",
    "L'Elij Venonn",
    "Kraag Solazarn",
    "Tava Targesh",
    "Kemarrin Muuda"
  ];

  final List<String> publications = [
    "Kotlin Vibe",
    "Compose Mix",
    "Compose Breakdown",
    "Android Pursue",
    "Kotlin Watchman",
    "Jetpack Ark",
    "Composeshack",
    "Jetpack Point",
    "Compose Tribune"
  ];

  // for now, keep the selections in memory
  final Set<TopicSelection> selectedTopics = {};
  final Set<String> selectedPeople = {};
  final Set<String> selectedPublications = {};

  final selectedTopicsStream = StreamController<Set<TopicSelection>>();
  final selectedPeopleStream = StreamController<Set<String>>();
  final selectedPublicationsStream = StreamController<Set<String>>();

  @override
  Future<Result<List<String>>> getPeople() {
    return Future.value(Success(people));
  }

  @override
  Future<Result<List<String>>> getPublications() {
    return Future.value(Success(publications));
  }

  @override
  Future<Result<List<InterestSection>>> getTopics() {
    return Future.value(Success(topics));
  }

  @override
  Stream<Set<String>> observePeopleSelected() => selectedPeopleStream.stream;

  @override
  Stream<Set<String>> observePublicationSelected() =>
      selectedPublicationsStream.stream;

  @override
  Stream<Set<TopicSelection>> observeTopicsSelected() =>
      selectedTopicsStream.stream;

  @override
  togglePersonSelected(String person) {
    final set = selectedPeople.toSet();
    if (set.contains(person)) {
      set.remove(person);
    } else {
      set.add(person);
    }
    selectedPeople.clear();
    selectedPeople.addAll(set);
    selectedPeopleStream.sink.add(selectedPeople);
  }

  @override
  togglePublicationSelected(String publication) {
    final set = selectedPublications.toSet();
    if (set.contains(publication)) {
      set.remove(publication);
    } else {
      set.add(publication);
    }
    selectedPublications.clear();
    selectedPublications.addAll(set);
    selectedPublicationsStream.sink.add(selectedPublications);
  }

  @override
  toggleTopicSelection(TopicSelection topic) {
    final set = selectedTopics.toSet();
    if (set.contains(topic)) {
      set.remove(topic);
    } else {
      set.add(topic);
    }
    selectedTopics.clear();
    selectedTopics.addAll(set);
    selectedTopicsStream.sink.add(selectedTopics);
  }
}
