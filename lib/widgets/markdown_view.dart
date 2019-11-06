import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/screens/issue.dart';
import 'package:git_touch/screens/object.dart';
import 'package:git_touch/screens/repository.dart';
import 'package:git_touch/screens/user.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:primer/primer.dart';
import 'package:provider/provider.dart';
import 'package:uri/uri.dart';
import 'package:path/path.dart' as path;

class MarkdownView extends StatelessWidget {
  final String text;
  final List<String> basePaths;

  MarkdownView(this.text, {this.basePaths});

  static const _basicStyle =
      TextStyle(fontSize: 16, color: PrimerColors.gray900, height: 1.5);

  static final _hStyle =
      _basicStyle.copyWith(fontWeight: FontWeight.w600, height: 1.25);

  Map<String, String> matchPattern(String url, String pattern) {
    var uri = Uri.parse(url);
    return UriParser(UriTemplate(pattern)).match(uri)?.parameters;
  }

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      onTapLink: (url) {
        if (basePaths != null &&
            !url.startsWith('https://') &&
            !url.startsWith('http://')) {
          // Treat as relative path

          final x = basePaths.sublist(3).join('/');
          var y = path.join(x, url);
          if (y.startsWith('/')) y = y.substring(1);
          final paths = path.split(y);

          return Provider.of<ThemeModel>(context).pushRoute(
            context,
            (_) => ObjectScreen(
              basePaths[0],
              basePaths[1],
              basePaths[2],
              paths: paths,
            ),
          );
        }

        // TODO: Relative paths
        if (url.startsWith('https://github.com')) {
          Map<String, String> m;

          m = matchPattern(url, '/{owner}/{name}/pull/{number}');
          if (m != null) {
            return Provider.of<ThemeModel>(context).pushRoute(
                context,
                (_) => IssueScreen(
                      m['owner'],
                      m['name'],
                      int.parse(m['number']),
                      isPullRequest: true,
                    ));
          }

          m = matchPattern(url, '/{owner}/{name}/issues/{number}');
          if (m != null) {
            return Provider.of<ThemeModel>(context).pushRoute(
                context,
                (_) => IssueScreen(
                      m['owner'],
                      m['name'],
                      int.parse(m['number']),
                    ));
          }

          m = matchPattern(url, '/{owner}/{name}');
          if (m != null) {
            return Provider.of<ThemeModel>(context).pushRoute(
                context, (_) => RepositoryScreen(m['owner'], m['name']));
          }

          m = matchPattern(url, '/{login}');
          if (m != null) {
            return Provider.of<ThemeModel>(context)
                .pushRoute(context, (_) => UserScreen(m['login']));
          }
        }

        launchUrl(url);
      },
      data: text,
      styleSheet: MarkdownStyleSheet(
        a: _basicStyle.copyWith(color: PrimerColors.blue500),
        p: _basicStyle,
        code: _basicStyle.copyWith(
          fontSize: 16 * 0.85,
          height: 1.45,
          fontFamily: CommonStyle.monospace,
        ),
        h1: _hStyle.copyWith(fontSize: 32),
        h2: _hStyle.copyWith(fontSize: 24),
        h3: _hStyle.copyWith(fontSize: 20),
        h4: _hStyle,
        h5: _hStyle.copyWith(fontSize: 14),
        h6: _hStyle.copyWith(fontSize: 16 * 0.85, color: PrimerColors.gray500),
        em: _basicStyle.copyWith(fontStyle: FontStyle.italic),
        strong: _basicStyle.copyWith(fontWeight: FontWeight.w600),
        blockquote: _basicStyle.copyWith(color: PrimerColors.gray500),
        img: _basicStyle,
        blockSpacing: 16,
        listIndent: 32,
        blockquotePadding: 16, // FIXME: only horizontal
        blockquoteDecoration: BoxDecoration(
          border: Border(left: BorderSide(color: Color(0xffdfe2e5), width: 4)),
        ),
        codeblockPadding: 16,
        codeblockDecoration: BoxDecoration(
          color: PrimerColors.gray100,
          borderRadius: BorderRadius.circular(3),
        ),
        horizontalRuleDecoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 4, color: PrimerColors.gray200),
          ),
        ),
      ),
      // syntaxHighlighter: , // TODO:
    );
  }
}
