// ignore_for_file: constant_identifier_names

abstract class ApiRoutes {
  static const PESTS = "/pests";

  static const CLASSIFICATION = "$PESTS/classify";

  static const PESTS_SLUGS = "$PESTS/slugs";

  static String pestById(int id) => "$PESTS/$id";

  static String pestBySlug(String slug) => "$PESTS_SLUGS/$slug";
}
