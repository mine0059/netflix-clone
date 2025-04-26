class ApiUrl {
  static const baseURL =
      // 'https://netflix-backend-production-8413.up.railway.app/'; //hosted environment
      // 'http://localhost:5000'; // web browser or a destop app
      //'http://192.168.1.x:5000'; // For physical device
      'http://10.0.2.2:5000'; // For Android emulator
  static const apiV = '/api/v1/';

  static const signup = '${apiV}auth/signup';
  static const signin = '${apiV}auth/signin';
  static const trendingMovies = '${apiV}movie/trending';
  static const nowPlayingMovies = '${apiV}movie/nowplaying';
  static const popularTV = '${apiV}tv/popular';
  static const movie = '${apiV}movie/';
  static const tv = '${apiV}tv/';
  static const search = '${apiV}search/';

  static const trailerBase = 'https://www.youtube.com/watch?v=';
}
