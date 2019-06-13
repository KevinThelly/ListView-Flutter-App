class Member {
  final String login;
  final String avatarUrL;


  Member(this.login,this.avatarUrL) {
    if (login == null) {
      throw new ArgumentError("login of Member cannot be null. "
          "Received: '$login'");
    }

    if(avatarUrL==null) {
      throw ArgumentError("avatar of Member cannot be Null"
          "Received: '$avatarUrL'");
    }
  }
}