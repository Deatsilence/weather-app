import 'package:f_weather/product/components/search_text_form_field.dart';
import 'package:f_weather/product/constants/enums/navigate_routes_enum.dart';
import 'package:f_weather/product/extensions/padding_extension.dart';
import 'package:f_weather/product/init/mixin/search_places_mixin.dart';
import 'package:f_weather/product/init/mixin/text_form_field_validation_mixin.dart';
import 'package:f_weather/product/init/theme/utility/padding_manager.dart';
import 'package:f_weather/product/state/home_state_manager.dart';
import 'package:f_weather/product/state/root_state_manager.dart';
import 'package:f_weather/product/state/theme_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SearchPlaces extends StatefulWidget {
  const SearchPlaces({super.key});

  @override
  State<SearchPlaces> createState() => _SearchPlacesState();
}

class _SearchPlacesState extends State<SearchPlaces> with TextFormFieldValidationMixin, SearchPlacesMixin {
  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Overlay(
          initialEntries: [
            OverlayEntry(
              builder: (context) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const _SearchPlacesTitleText(),
                  SearchTextFormField(
                          onChange: (value) => placesViewModel.getSelectedPlace(value),
                          onSubmitted: (value) => placesViewModel.getSelectedPlace(value),
                          controller: searchController)
                      .onlyPadding(
                    top: PaddingManager.onlyTopOfSearchTextField,
                  ),
                  Expanded(
                    flex: 6,
                    child: Observer(
                      builder: (_) {
                        return ListView.builder(
                          itemCount: getPlaces().length,
                          itemBuilder: (context, index) {
                            var place = getPlaces()[index].description?.split(", ");
                            var lengthOfPlace = place?.length;
                            if (lengthOfPlace == 2 || lengthOfPlace == 3) {
                              return ListTile(
                                title: lengthOfPlace == 2
                                    ? Text("${place![0]}, ${place[1]}")
                                    : Text("${place![0]}, ${place[1]}, ${place[2]}"),
                                leading: const Icon(Icons.location_on_outlined),
                                onTap: () {
                                  debugPrint("selected: ${place[0]}");
                                  GetHomeStateManager.homeStateManager.setCityName(place[0]);
                                  debugPrint("city: ${weatherViewModel.cityName}");
                                  GetRooteStateManager.rootStateManager.setIndex(NavigateRoutes.home.index);
                                },
                              );
                            } else {
                              return const SizedBox.shrink();
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _SearchPlacesTitleText extends StatelessWidget {
  const _SearchPlacesTitleText();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Search Places",
            style: GetThemeStateManager.themeStateManager.theme.textTheme.titleMedium,
          ),
        ).onlyPadding(left: PaddingManager.onlyTopOfSearchPlacesText);
      },
    );
  }
}
