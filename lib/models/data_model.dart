class datamodel {
  String? name;
  String? email;

  datamodel({nam, this.email}) {
    name = nam.toString();
    email = this.email.toString();
    print(email);
  }
}
