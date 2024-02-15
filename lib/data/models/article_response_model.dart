// To parse this JSON data, do
//
//     final articleResponseModel = articleResponseModelFromJson(jsonString);

import 'dart:convert';

ArticleResponseModel articleResponseModelFromJson(String str) => ArticleResponseModel.fromJson(json.decode(str));

String articleResponseModelToJson(ArticleResponseModel data) => json.encode(data.toJson());

class ArticleResponseModel {
    List<Post>? posts;

    ArticleResponseModel({
        this.posts,
    });

    factory ArticleResponseModel.fromJson(Map<String, dynamic> json) => ArticleResponseModel(
        posts: json["posts"] == null ? [] : List<Post>.from(json["posts"]!.map((x) => Post.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "posts": posts == null ? [] : List<dynamic>.from(posts!.map((x) => x.toJson())),
    };
}

class Post {
    int? id;
    int? categoryId;
    int? userId;
    String? title;
    String? slug;
    String? image;
    String? excerpt;
    String? body;
    dynamic published;
    DateTime? createdAt;
    DateTime? updatedAt;
    Category? category;
    Author? author;

    Post({
        this.id,
        this.categoryId,
        this.userId,
        this.title,
        this.slug,
        this.image,
        this.excerpt,
        this.body,
        this.published,
        this.createdAt,
        this.updatedAt,
        this.category,
        this.author,
    });

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        categoryId: json["category_id"],
        userId: json["user_id"],
        title: json["title"],
        slug: json["slug"],
        image: json["image"],
        excerpt: json["excerpt"],
        body: json["body"],
        published: json["published"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
        author: json["author"] == null ? null : Author.fromJson(json["author"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "user_id": userId,
        "title": title,
        "slug": slug,
        "image": image,
        "excerpt": excerpt,
        "body": body,
        "published": published,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "category": category?.toJson(),
        "author": author?.toJson(),
    };
}

class Author {
    int? id;
    String? name;
    String? email;
    String? phone;
    String? bio;
    String? role;
    DateTime? emailVerifiedAt;
    dynamic twoFactorSecret;
    dynamic twoFactorRecoveryCodes;
    dynamic twoFactorConfirmedAt;
    DateTime? createdAt;
    DateTime? updatedAt;

    Author({
        this.id,
        this.name,
        this.email,
        this.phone,
        this.bio,
        this.role,
        this.emailVerifiedAt,
        this.twoFactorSecret,
        this.twoFactorRecoveryCodes,
        this.twoFactorConfirmedAt,
        this.createdAt,
        this.updatedAt,
    });

    factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        bio: json["bio"],
        role: json["role"],
        emailVerifiedAt: json["email_verified_at"] == null ? null : DateTime.parse(json["email_verified_at"]),
        twoFactorSecret: json["two_factor_secret"],
        twoFactorRecoveryCodes: json["two_factor_recovery_codes"],
        twoFactorConfirmedAt: json["two_factor_confirmed_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "bio": bio,
        "role": role,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "two_factor_secret": twoFactorSecret,
        "two_factor_recovery_codes": twoFactorRecoveryCodes,
        "two_factor_confirmed_at": twoFactorConfirmedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class Category {
    int? id;
    String? name;
    String? slug;
    DateTime? createdAt;
    DateTime? updatedAt;

    Category({
        this.id,
        this.name,
        this.slug,
        this.createdAt,
        this.updatedAt,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
