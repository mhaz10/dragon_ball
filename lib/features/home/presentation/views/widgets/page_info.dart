import 'package:dragon_ball/core/models/chaaracters_model.dart';
import 'package:dragon_ball/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manger/all_characters/all_characters_cubit.dart';

class PageInfo extends StatelessWidget {
  const PageInfo({super.key, required this.charactersModel});

  final CharactersModel charactersModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('totalI Pages: ${charactersModel.meta!.totalPages}', style: Styles.textStyle18,),
              SizedBox(width: 30,),
              Text('current Page: ${charactersModel.meta!.currentPage}', style: Styles.textStyle18,),
            ],
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  int currentPage = charactersModel.meta!.currentPage!;
                  if (currentPage > 1) {
                    BlocProvider.of<AllCharactersCubit>(context).fetchAllCharacters(page: currentPage - 1);
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[800]
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back_ios),
                      Text('prev', style: Styles.textStyle18,),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 30,),
              GestureDetector(
                onTap: () {
                  int currentPage = charactersModel.meta!.currentPage!;
                  if (currentPage < 6) {
                    BlocProvider.of<AllCharactersCubit>(context).fetchAllCharacters(page: currentPage + 1);
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[800]
                  ),
                  child: Row(
                    children: [
                      Text('next', style: Styles.textStyle18,),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
