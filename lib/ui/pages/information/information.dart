import 'package:ai4d_pests_app/domain/controllers/information.dart';
import 'package:ai4d_pests_app/ui/components/app_bar.dart';
import 'package:ai4d_pests_app/ui/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InformationPage extends GetView<InformationController> {
  final double contentWidth;

  const InformationPage({super.key, this.contentWidth = 400});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        pageTitle: "Pests Information",
      ).build(context),
      body: Obx(
        () => controller.isLoadingFor(controller.getPests.hashCode)
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Pests Catalog",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.pestsList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final item = controller.pestsList[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: contentWidth,
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/pests/${item.slug ?? ''}.jpg",
                                  width: contentWidth,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10.0,
                                  ),
                                  child: Container(
                                    width: contentWidth,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(50),
                                      ),
                                      color: Theming.mainColor.withAlpha(20),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "  ${item.scientificName?.capitalize ?? '-'}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            controller.showInfoForPestByIndex(
                                              index,
                                            );
                                          },
                                          style: ButtonStyle(
                                            shadowColor:
                                                MaterialStateProperty.all(
                                              Colors.transparent,
                                            ),
                                          ),
                                          child: const Text("More Info..."),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
