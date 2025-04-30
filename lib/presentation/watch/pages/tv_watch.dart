import 'package:flutter/material.dart';
import 'package:netflix/common/widgets/appbar/app_bar.dart';
import 'package:netflix/domain/tv/entities/tv.dart';
import 'package:netflix/presentation/watch/widgets/recommendation_tvs.dart';
import 'package:netflix/presentation/watch/widgets/similar_tvs.dart';
import 'package:netflix/presentation/watch/widgets/tv_keywords.dart';
import 'package:netflix/presentation/watch/widgets/video_overview.dart';
import 'package:netflix/presentation/watch/widgets/video_player.dart';
import 'package:netflix/presentation/watch/widgets/video_title.dart';
import 'package:netflix/presentation/watch/widgets/video_vote_average.dart';

class TVWatchPage extends StatelessWidget {
  const TVWatchPage({required this.tvEntity, super.key});
  final TVEntity tvEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayer(id: tvEntity.id!),
            const SizedBox(height: 16),
            VideoTitle(title: tvEntity.name!),
            const SizedBox(height: 16),
            TVKeywords(tvId: tvEntity.id!),
            const SizedBox(height: 16),
            VideoVoteAverage(voteAverage: tvEntity.voteAverage!),
            const SizedBox(height: 16),
            VideoOverview(overview: tvEntity.overview!),
            const SizedBox(height: 16),
            RecommendationTVs(tvId: tvEntity.id!),
            const SizedBox(height: 16),
            SimilarTVs(tvId: tvEntity.id!)
          ],
        ),
      ),
    );
  }
}
