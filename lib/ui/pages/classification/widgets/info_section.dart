import 'package:ai4d_pests_app/domain/entities/pest.dart';
import 'package:ai4d_pests_app/ui/components/info_highlighted.dart';
import 'package:flutter/material.dart';

class InfoSection extends StatelessWidget {
  final PestEntity pest;

  // XXX: move this logic to another place
  final controlMethodMapper = {
    "p": "Physical",
    "c": "Chemical",
    "b": "Biological",
    "o": "Other"
  };

  InfoSection({super.key, required this.pest});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Also Known as:",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              pest.popularName ?? "",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 8),
          child: Text(
            "Description",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 20,
                ),
          ),
        ),
        Text(
          pest.description ?? "-",
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.justify,
        ),
        if (pest.cropsAffected?.isNotEmpty == true) ...{
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 8),
            child: Text(
              "Crops Affected",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 20,
                  ),
            ),
          ),
          Text(
            pest.cropsAffected!.map((e) => e.name ?? '').join(', '),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        },
        if (pest.controlMethods?.isNotEmpty == true) ...{
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 8),
            child: Text(
              "Control Methods",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 20,
                  ),
            ),
          ),
          ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              color: Color.fromARGB(20, 0, 0, 0),
            ),
            shrinkWrap: true,
            itemCount: pest.controlMethods!.length,
            itemBuilder: (context, index) {
              final item = pest.controlMethods![index];
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InfoHighlightedText(
                          infoKey: "Name",
                          infoValue: item.name ?? "",
                        ),
                        InfoHighlightedText(
                          infoKey: "Type",
                          infoValue: item.type != null
                              ? controlMethodMapper[item.type!] ?? ""
                              : "",
                        ),
                      ],
                    ),
                    if (item.description != null && item.description != "")
                      InfoHighlightedText(
                        infoKey: "Description",
                        infoValue: item.description ?? "",
                        textAlign: TextAlign.justify,
                        valueStyle:
                            Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                      ),
                  ],
                ),
              );
            },
          ),
        }
      ],
    );
  }
}
