import 'package:dragon_ball/core/models/single_character_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widgets/custom_app_icon.dart';
import '../../manger/add_favorite_character/add_favorite_character_cubit.dart';

class CustomSliverAppBar extends StatefulWidget {
  const CustomSliverAppBar({super.key, required this.characterModel});

  final SingleCharacterModel characterModel;

  @override
  State<CustomSliverAppBar> createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AddFavoriteCharacterCubit>(
      context,
    ).checkIfCharacterIsFavorite(widget.characterModel);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddFavoriteCharacterCubit, AddFavoriteCharacterState>(
      listener: (context, state) {
        if (state is AddFavoriteCharacterFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is AddFavoriteCharacterSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Added to favorites'),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.green,
            ),
          );
        }
      },
      builder: (context, state) {
        return SliverAppBar(
          toolbarHeight: 75,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomAppIcon(
                icon: Icons.close,
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                color: Colors.white,
              ),
              CustomAppIcon(
                icon:
                    state is SavedFavoriteCharacter
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                onPressed: () {
                  BlocProvider.of<AddFavoriteCharacterCubit>(
                    context,
                  ).addFavoriteCharacter(widget.characterModel);
                },
                color:
                    state is SavedFavoriteCharacter ? Colors.red : Colors.white,
              ),
            ],
          ),
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
              ),
              width: double.infinity,
              padding: EdgeInsets.only(top: 5, bottom: 10),
              child: Center(
                child: Container(
                  width: 60,
                  height: 12,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(60),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
          ),
          expandedHeight: 330,
          backgroundColor: Colors.grey,
          pinned: true,
          //floating: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              children: [
                Image.asset(
                  'assets/images/background.jpg',
                  height: 340,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Image.network(
                  widget.characterModel.image!,
                  height: 300,
                  width: 400,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
