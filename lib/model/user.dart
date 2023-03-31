class User {
  dynamic name;
  dynamic phoneno;
  dynamic email;
  dynamic password;

  User(this.name, this.phoneno, this.email, this.password);

  User.fromMap(Map map) {
    name = map[name];
    phoneno = map[phoneno];
    email = map[email];
    password = map[password];
  }
}
