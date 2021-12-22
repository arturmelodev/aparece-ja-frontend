
class AppController {
  static AppController instance = AppController();
  bool isDarkTheme = false;

  changeTheme() {
    isDarkTheme = !isDarkTheme;
  }
}