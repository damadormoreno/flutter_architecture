import 'package:meta/meta.dart';
import 'dart:convert';

RequestGuestToken requestGuestTokenFromJson(String str) =>
    RequestGuestToken.fromJson(json.decode(str));

String requestGuestTokenToJson(RequestGuestToken data) =>
    json.encode(data.toJson());

class RequestGuestToken {
  RequestGuestToken({
    @required this.success,
    @required this.guestSessionId,
    @required this.expiresAt,
  });

  final bool success;
  final String guestSessionId;
  final String expiresAt;

  factory RequestGuestToken.fromJson(Map<String, dynamic> json) =>
      RequestGuestToken(
        success: json["success"],
        guestSessionId: json["guest_session_id"],
        expiresAt: json["expires_at"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "guest_session_id": guestSessionId,
        "expires_at": expiresAt,
      };
}
