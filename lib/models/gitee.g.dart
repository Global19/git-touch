// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gitee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiteeUser _$GiteeUserFromJson(Map<String, dynamic> json) {
  return GiteeUser()
    ..login = json['login'] as String
    ..avatarUrl = json['avatar_url'] as String
    ..name = json['name'] as String
    ..htmlUrl = json['html_url'] as String
    ..bio = json['bio'] as String
    ..blog = json['blog'] as String
    ..publicRepos = json['public_repos'] as int
    ..followers = json['followers'] as int
    ..following = json['following'] as int
    ..stared = json['stared'] as int
    ..watched = json['watched'] as int
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String);
}

Map<String, dynamic> _$GiteeUserToJson(GiteeUser instance) => <String, dynamic>{
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
      'name': instance.name,
      'html_url': instance.htmlUrl,
      'bio': instance.bio,
      'blog': instance.blog,
      'public_repos': instance.publicRepos,
      'followers': instance.followers,
      'following': instance.following,
      'stared': instance.stared,
      'watched': instance.watched,
      'created_at': instance.createdAt?.toIso8601String(),
    };

GiteeListUser _$GiteeListUserFromJson(Map<String, dynamic> json) {
  return GiteeListUser()
    ..login = json['login'] as String
    ..avatarUrl = json['avatar_url'] as String
    ..name = json['name'] as String
    ..htmlUrl = json['html_url'] as String;
}

Map<String, dynamic> _$GiteeListUserToJson(GiteeListUser instance) =>
    <String, dynamic>{
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
      'name': instance.name,
      'html_url': instance.htmlUrl,
    };

GiteeRepo _$GiteeRepoFromJson(Map<String, dynamic> json) {
  return GiteeRepo()
    ..namespace = json['namespace'] == null
        ? null
        : GiteeRepoNamespace.fromJson(json['namespace'] as Map<String, dynamic>)
    ..owner = json['owner'] == null
        ? null
        : GiteeRepoOwner.fromJson(json['owner'] as Map<String, dynamic>)
    ..path = json['path'] as String
    ..description = json['description'] as String
    ..private = json['private'] as bool
    ..public = json['public'] as bool
    ..internal = json['internal'] as bool
    ..fork = json['fork'] as bool
    ..forksCount = json['forks_count'] as int
    ..stargazersCount = json['stargazers_count'] as int
    ..watchersCount = json['watchers_count'] as int
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String)
    ..license = json['license'] as String
    ..homepage = json['homepage'] as String
    ..openIssuesCount = json['open_issues_count'] as int
    ..pullRequestsEnabled = json['pull_requests_enabled'] as bool;
}

Map<String, dynamic> _$GiteeRepoToJson(GiteeRepo instance) => <String, dynamic>{
      'namespace': instance.namespace,
      'owner': instance.owner,
      'path': instance.path,
      'description': instance.description,
      'private': instance.private,
      'public': instance.public,
      'internal': instance.internal,
      'fork': instance.fork,
      'forks_count': instance.forksCount,
      'stargazers_count': instance.stargazersCount,
      'watchers_count': instance.watchersCount,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'license': instance.license,
      'homepage': instance.homepage,
      'open_issues_count': instance.openIssuesCount,
      'pull_requests_enabled': instance.pullRequestsEnabled,
    };

GiteeRepoOwner _$GiteeRepoOwnerFromJson(Map<String, dynamic> json) {
  return GiteeRepoOwner()
    ..login = json['login'] as String
    ..avatarUrl = json['avatar_url'] as String;
}

Map<String, dynamic> _$GiteeRepoOwnerToJson(GiteeRepoOwner instance) =>
    <String, dynamic>{
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
    };

GiteeRepoNamespace _$GiteeRepoNamespaceFromJson(Map<String, dynamic> json) {
  return GiteeRepoNamespace()..path = json['path'] as String;
}

Map<String, dynamic> _$GiteeRepoNamespaceToJson(GiteeRepoNamespace instance) =>
    <String, dynamic>{
      'path': instance.path,
    };
