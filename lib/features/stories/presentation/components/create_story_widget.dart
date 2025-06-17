import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/core/extensions/num_extensions.dart';
import 'package:social/features/stories/presentation/components/file_bottom_sheet.dart';
import 'package:social/features/stories/presentation/cubit/stories_cubit.dart';

class CreateStoryWidget extends StatelessWidget {

  final BuildContext cubitContext;
  const CreateStoryWidget({super.key, required this.cubitContext});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          useRootNavigator: true,
          builder: (BuildContext modalBottomSheetContext) {
              return FileBottomSheet(onUpdated: (image) {
                BlocProvider.of<StoriesCubit>(cubitContext).addStory(image);
              });
          },
        );
      },
      child: Container(
        width: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 2, color: Colors.grey),
          // color: Colors.grey
        ),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        topLeft: Radius.circular(12),
                    ),
                  ),
                  child: Transform.translate(
                    offset: Offset(-10, 32),
                    child: Icon(
                      Icons.person,
                      color: Colors.black54,
                      size: 130,
                    ),
                  ),
                ),
                // Plus Button
                Positioned(
                  right: 0,
                  left: 0,
                  bottom: -16,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Colors.white),
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            const Spacer(),
            Text(
              'Create story'
            ),
            8.ph,
          ],
        ),
      ),
    );
  }
}
