String initColumns({
  required String tableName,
  required List<String> columns,
}) {
  return '''
    CREATE TABLE $tableName (
        id INTEGER PRIMARY KEY, 
        ${columns.map((String column) => '$column TEXT').toList().join(',')}
        version INTEGER
      )
  ''';
}
