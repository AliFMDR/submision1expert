import 'package:ditonton/presentation/provider/list_tv_notifier.dart';
import 'package:ditonton/presentation/widgets/tv_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/state_enum.dart';

class NowPlayingTv extends StatefulWidget {
  static const ROUTE_NAME = '/nowplaying-Tv';

  @override
  _NowPlayingTv createState() => _NowPlayingTv();
}

class _NowPlayingTv extends State<NowPlayingTv> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<ListTvNotifier>(context, listen: false)
        .fetchNowPlayingTv());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Now Playing Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<ListTvNotifier>(
          builder: (context, data, child) {
            if (data.nowPlayingState == RequestState.Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (data.nowPlayingState == RequestState.Loaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Tv = data.nowPlayingTv[index];
                  return TvContent(Tv);
                },
                itemCount: data.nowPlayingTv.length,
              );
            } else {
              return Center(
                key: Key('error_message'),
                child: Text(data.message),
              );
            }
          },
        ),
      ),
    );
  }
}
