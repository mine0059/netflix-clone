import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/common/cubit/generic_data_cubit.dart';
import 'package:netflix/core/entity/keyword.dart';
import 'package:netflix/domain/tv/usecase/get_keywords.dart';
import 'package:netflix/service_locator.dart';

class TVKeywords extends StatelessWidget {
  final int tvId;
  const TVKeywords({required this.tvId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GenericDataCubit()
          ..getData<List<KeywordEntity>>(sl<GetTVKeywordsUseCase>(),
              params: tvId),
        child: BlocBuilder<GenericDataCubit, GenericDataState>(
          builder: (context, state) {
            if (state is DataLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is DataLoaded) {
              List<KeywordEntity> keywords = state.data;
              return Wrap(
                spacing: 5,
                children: keywords
                    .map((item) => Chip(
                          label: Text(item.name!),
                        ))
                    .toList(),
              );
            }

            if (state is FailureLoadData) {
              return Text(state.errorMessage);
            }

            return Container();
          },
        ));
  }
}
