import 'package:ai4d_pests_app/domain/controllers/about.dart';
import 'package:ai4d_pests_app/ui/components/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutPage extends GetView<AboutController> {
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
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "About This Project",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Image.asset(
                "assets/images/logo-03.png",
                width: contentWidth - 10,
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
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: " by the ",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: "Responsible and Smart Solutions Lab",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: " at the University of Cape Verde, granted under "
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
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "Partners",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    controller.partnersLogoAssests[0],
                    width: contentWidth / 2 - 20,
                  ),
                  Image.asset(
                    controller.partnersLogoAssests[1],
                    width: contentWidth / 2 - 20,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    controller.partnersLogoAssests[2],
                    width: contentWidth / 2 - 20,
                  ),
                  Image.asset(
                    controller.partnersLogoAssests[3],
                    width: contentWidth / 2 - 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
