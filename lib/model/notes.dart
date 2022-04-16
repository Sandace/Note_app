const String tableNotes = 'notes ';

class Notefields {
  static final List<String> values = [
    id,
    isImportant,
    number,
    title,
    description,
    time
  ];
  static const String id = '_id';
  static const String isImportant = 'isImportant';
  static const String number = 'number';
  static const String title = 'title';
  static const String description = 'description';
  static const String time = 'time';
}

class Note {
  final int? id;
  final bool isImportant;
  final int number;
  final String title;
  final String description;
  final DateTime createdTime;

  const Note({
    this.id,
    required this.isImportant,
    required this.number,
    required this.title,
    required this.description,
    required this.createdTime,
  });

  Note copy({
    int? id,
    bool? isImportant,
    int? number,
    String? title,
    String? description,
    DateTime? createdTime,
  }) =>
      Note(
        id: id ?? this.id,
        isImportant: isImportant ?? this.isImportant,
        number: number ?? this.number,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
      );
  static Note fromJson(Map<String, Object?> json) => Note(
    id: json[Notefields.id] as int?,
    isImportant: json[Notefields.isImportant]==1,
    number: json[Notefields.number] as int,
    title: json[Notefields.title] as String,
    description: json[Notefields.description] as String,
    createdTime: DateTime.parse(json[Notefields.time] as String), 
    
  );
  Map<String, Object?> toJson() => {
        Notefields.id: id,
        Notefields.isImportant: isImportant ? 1 : 0,
        Notefields.number: number,
        Notefields.title: title,
        Notefields.description: description,
        Notefields.time: createdTime.toIso8601String(),
      };
}
