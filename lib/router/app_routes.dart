class Route {
  String path;
  String name;
  Route({
    required this.path,
    required this.name,
  });
}

class AppRoutes {
  AppRoutes._();
//   static Route authSession = Route(path: '/authSession', name: 'authSession');
  static Route onboard = Route(path: '/onboard', name: 'onboard');
  static Route getStarted = Route(path: '/getStarted', name: 'getStarted');



  static Route signUp = Route(path: '/signUp', name: 'signUp');
  static Route signIn = Route(path: '/signIn', name: 'signIn');
  static Route forgotPassword =
      Route(path: '/forgotPassword', name: 'forgotPassword');
	  static Route passwordReset =
      Route(path: '/PasswordReset', name: 'PasswordReset');
  static Route otpInput = Route(path: '/otpInput', name: 'otpInput');
  static Route newPassword = Route(path: '/newPassword', name: 'newPassword');
  static Route passwordChanged =
      Route(path: '/passwordChanged', name: 'passwordChanged');

	    static Route emailVerification =
      Route(path: '/emailverification', name: 'emailverification');

	   static Route buttomNavigation =
      Route(path: '/bottomnavigation', name: 'bottomnavigation');
}
