class Band {
  String id;
  String name; 
  int votes;

  Band({
    required this.id,
    required this.name,
    required this.votes
  });

  factory Band.fromMap(Map<String, dynamic> obj)
    => Band(
        id: obj.containsKey('id') ? obj['id'] : 'no-id',
        name: obj.containsKey('name') ? obj['name'] : 'no-name', //_TypeError (type '_Map<String, dynamic>' is not a subtype of type 'String')
        votes: obj.containsKey('votes') ? obj['votes'] : 0, 
      );

}