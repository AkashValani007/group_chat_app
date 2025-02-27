class ChatResponseModel {
  final String? status;
  final String? message;
  final List<ChatData> data;

  ChatResponseModel({required this.data,this.status,this.message});

  factory ChatResponseModel.fromJson(Map<String, dynamic> json) {
    return ChatResponseModel(
      status: json["status"],
      message: json["message"],
      data: (json['data'] as List).map((e) => ChatData.fromJson(e)).toList(),
    );
  }
}

class ChatData {
  final ChatDetails chatDetails;
  final UserDetails userDetails;

  ChatData({required this.chatDetails, required this.userDetails});

  factory ChatData.fromJson(Map<String, dynamic> json) {
    return ChatData(
      chatDetails: ChatDetails.fromJson(json['Chat_details']),
      userDetails: UserDetails.fromJson(json['user_details']),
    );
  }
}

class ChatDetails {
  final int? id;
  final String? userId;
  final String? image;
  final String? message;
  final String? createdAt;
  final String? updatedAt;

  ChatDetails({
    required this.id,
    required this.userId,
    required this.image,
    required this.message,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ChatDetails.fromJson(Map<String, dynamic> json) {
    return ChatDetails(
      id: json['id'],
      userId: json['user_id'],
      image: json['image'],
      message: json['message'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class UserDetails {
  final int? id;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? gender;
  final String? address;
  final String? city;
  final String? state;
  final String? dateOfBirth;
  final String? createdAt;
  final String? updatedAt;

  UserDetails({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.address,
    required this.city,
    required this.state,
    required this.dateOfBirth,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      gender: json['gender'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      dateOfBirth: json['date_of_birth'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
