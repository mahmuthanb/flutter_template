import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/res/dimens.dart';
import 'package:flutter_template/l10n/l10n.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settingsPageAppBarTitle),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blueGrey,
            height: size.height * .1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(AppDimens.s),
                    color: Colors.lime,
                    child: const CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(
                        'https://picsum.photos/200',
                      ),
                      minRadius: 30,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.red,
                    child: const Text('data'),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
