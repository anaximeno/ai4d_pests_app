import 'package:ai4d_pests_app/ui/components/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutPage extends GetView {
  final double contentWidth;

  const AboutPage({super.key, this.contentWidth = 500});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        pageTitle: "About",
      ).build(context),
      body: SingleChildScrollView(
        child: SizedBox(
          width: context.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "About This Project",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              SizedBox(
                width: contentWidth,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "This application was developed under the project ",
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: <TextSpan>[
                      TextSpan(
                        text: "'The Use of Artificial Intelligence in"
                            " Mitigating Crop Losses in Cape Verde'",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                      TextSpan(
                        text: " at the University of Cape Verde granted under "
                            "the AI4D Africa scholarship program. Its goal is "
                            "to help detect and identify potential pests "
                            "affecting crops and alert farmers in a timely "
                            "manner to mitigate agricultural losses.",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
