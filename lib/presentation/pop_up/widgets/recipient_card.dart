import 'package:dyno_sign/domain/consts/consts.dart';
import 'package:flutter/material.dart';

class RecipientCard extends StatelessWidget {
  final String name;
  final String email;
  final String status;
  final int index;
  final bool isMe;
  final bool order;
  final Function(int value) onSelected;

  const RecipientCard({
    super.key,
    required this.name,
    required this.email,
    required this.status,
    required this.index,
    this.isMe = false,
    required this.order,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final color = appColorScheme(context);
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppStyle.tileBorderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // The number container
            if (order)
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  color: color.primary,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  index.toString().padLeft(2, '0'),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: AppFontSize.labelMediumFont,
                  ),
                ),
              ),
            const SizedBox(width: 12),

            // Avatar with first letter of the name
            CircleAvatar(
              radius: 20,
              backgroundColor: color.primary,
              child: Text(
                name[0].toUpperCase(),
                style: TextStyle(
                  color: color.surface,
                  fontWeight: FontWeight.bold,
                  fontSize: AppFontSize.titleMSmallFont,
                ),
              ),
            ),
            const SizedBox(width: 12),

            // Name, email, and status
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name and (Me) indicator if applicable
                  Text(
                    '$name${isMe ? " (Me)" : ""}',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: AppFontSize.titleMSmallFont,
                      color: color.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Email text
                  Text(
                    email,
                    style: const TextStyle(
                      fontSize: AppFontSize.labelMediumFont,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Status text
                  Text(
                    status,
                    style: const TextStyle(
                      fontSize: AppFontSize.labelMediumFont,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            // Popup menu button for options
            PopupMenuButton<int>(
              icon: const Icon(Icons.more_vert_rounded),
              onSelected: (value) {
                onSelected(value);
              },
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
