abstract class Storage<TValue> {
  Future<void> write(String key, TValue value);
  Future<TValue?> read(String key);
}
