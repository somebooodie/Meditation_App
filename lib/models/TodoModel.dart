class TodoModel {
  TodoModel({
    required this.code,
    required this.data,
  });
  late final int code;
  late final List<Todo> data;

  TodoModel.printMyName() {
    print("Empty");
  }

  TodoModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = List.from(json['data']).map((e) => Todo.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Todo {
  Todo({
    required this.id,
    required this.todoName,
    required this.createdAt,
    required this.updatedAt,
    // required this.V,
    required this.isComplete,
  });
  late final String id;
  late final String todoName;
  late final String? createdAt;
  late final String updatedAt;
  // late final int? V;
  late final bool? isComplete;

  Todo.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    todoName = json['todoName'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    // V = json['__v'];
    isComplete = json['isComplete'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['todoName'] = todoName;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    // _data['__v'] = V;
    _data['isComplete'] = isComplete;
    return _data;
  }
}
