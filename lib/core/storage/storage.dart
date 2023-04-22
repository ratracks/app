abstract class Storage<TValue> {
  Future write(String key, TValue value);
  Future<TValue?> read(String key);
}
