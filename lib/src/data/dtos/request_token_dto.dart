class RequestTokenDto {
  final bool success;
  late final String? requestToken;
  late final String? expiresAt;

  RequestTokenDto({
    this.success = false,
    this.requestToken,
    this.expiresAt,
  });

  factory RequestTokenDto.fromJson(Map<String, dynamic> json) {
    return RequestTokenDto(
      success: json['success'],
      requestToken: json['request_token'],
      expiresAt: json['expires_at'],
    );
  }

  Map<String, dynamic> toJson() => {
        'request_token': requestToken,
      };
}
