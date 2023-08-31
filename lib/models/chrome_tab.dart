class ChromeTab {
  final bool active;
  final String? favIconUrl;
  final num groupId;
  final num id;
  final num index;
  final String? title;
  final String? url;

  ChromeTab({
    required this.active,
    this.favIconUrl,
    required this.groupId,
    required this.id,
    required this.index,
    this.title,
    this.url,
  });
}
