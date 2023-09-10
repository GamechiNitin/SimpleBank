import 'package:flutter/material.dart';
import 'package:simple_bank/utils/colors.dart';
import 'package:simple_bank/utils/dimens.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({
    super.key,
    this.imageUrl,
    this.ucc,
    this.userName,
    this.email,
    this.onTap,
  });
  final String? imageUrl;
  final String? ucc;
  final String? userName;
  final String? email;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(kBorderRadius),
                child: Image.network(
                  imageUrl ?? "",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "UCC : ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w500),
                          children: [
                            TextSpan(
                              text: ucc,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.verified_user_outlined,
                        size: kSmallIconSize,
                        color: kErrorColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    userName ?? "",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    email ?? "",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.keyboard_arrow_right_sharp,
              size: kIconSize,
              color: Theme.of(context)
                  .bottomNavigationBarTheme
                  .selectedIconTheme
                  ?.color,
            ),
          ],
        ),
      ),
    );
  }
}
