class Endpoints {
  static String anonymousUser() => "https://ratracks-api.onrender.com/users/anonymous";
  static String createTracking() => "https://ratracks-api.onrender.com/trackings";
  static String getTrackings(String userId, String status) => "https://ratracks-api.onrender.com/trackings?userId=$userId&status=$status";
}