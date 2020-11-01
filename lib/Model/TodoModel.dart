import 'dart:convert';

Todo todoFromJson(String str) => Todo.fromJson(json.decode(str));

String todoToJson(Todo data) => json.encode(data.toJson());

class Todo {
    Todo({
        this.id,
        this.note,
        this.status,
    });

    String id;
    String note;
    String status;

    factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json["id"],
        note: json["note"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "note": note,
        "status": status,
    };
}