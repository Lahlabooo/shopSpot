import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../feature/login/data/models/auth_model.dart';

 class SubabaseServices {
  final SupabaseClient _supabaseClient = Supabase.instance.client;
  // signIn................
   Future<AuthResponse> signInWithEmail({required AuthModel authModel})async{
    return await _supabaseClient.auth.signInWithPassword(password: authModel.pass!,email: authModel.email);
  }
  //.............................................................................
  Future<void> signInWithGoogle() async {
    if(!kIsWeb && (Platform.isAndroid||Platform.isIOS)){
      /// Web Client ID that you registered with Google Cloud.
      const webClientId = '348927856886-mf7mci779584b4rreet36j8ssr3gunjp.apps.googleusercontent.com';

      /// iOS Client ID that you registered with Google Cloud.
      const iosClientId = '348927856886-fj84i63hugedqp46pn4m7t7itukhlctg.apps.googleusercontent.com';

      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: iosClientId,
        serverClientId: webClientId,
      );
      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;
      if (accessToken == null) {
        throw 'No Access Token found.';
      }
      if (idToken == null) {
        throw 'No ID Token found.';
      }
      await _supabaseClient.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );
    }
    await Supabase.instance.client.auth.signInWithOAuth(OAuthProvider.google);
  }
  //............................................................................
    Future<void> signInWithFacebook() async {
      await _supabaseClient.auth.signInWithOAuth(
        OAuthProvider.facebook,
        redirectTo: kIsWeb ? null : 'my.scheme://my-host', // Optionally set the redirect link to bring back the user via deeplink.
        authScreenLaunchMode:
        kIsWeb ? LaunchMode.platformDefault : LaunchMode.externalApplication,
      );
    }

  // signUp.....................
  Future<AuthResponse> signUp({required AuthModel authModel})async{
   return await _supabaseClient.auth.signUp(password: authModel.pass!,email: authModel.email,);
 }
  // signOut.....................
 Future<void> signOut() async{
    return await _supabaseClient.auth.signOut();

}
// getUserEmail...................
String? getCurrentUser(){
    final session = _supabaseClient.auth.currentUser;
    final user = session?.email;
    return user;
}
  // updateUserInfo..........
 Future<void> updatePass ({required String newPass})async{
   await _supabaseClient.auth.updateUser(
    UserAttributes(
      password:newPass,
    ),
  );
}
//..............................................................................
   Future<void> updateEmail ({required String newEmail})async{
    await _supabaseClient.auth.updateUser(
      UserAttributes(
        email:newEmail,
      ),
    );
  }
  // uploadToStorage..........
  // getUrlFromStorage...
  // insertDataToDatabase...
  // fetchDataFromDatabase...

}