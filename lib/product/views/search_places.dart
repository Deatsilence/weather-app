import 'package:f_weather/product/components/search_text_form_field.dart';
import 'package:f_weather/product/extensions/padding_extension.dart';
import 'package:f_weather/product/init/mixin/text_form_field_validation_mixin.dart';
import 'package:f_weather/product/init/theme/utility/padding_manager.dart';
import 'package:f_weather/product/state/theme_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SearchPlaces extends StatefulWidget {
  const SearchPlaces({super.key});

  @override
  State<SearchPlaces> createState() => _SearchPlacesState();
}

class _SearchPlacesState extends State<SearchPlaces> with TextFormFieldValidationMixin {
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
    final places = List.generate(20, (index) => "Place $index");

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
                  SearchTextFormField(controller: searchController).onlyPadding(
                    top: PaddingManager.onlyTopOfSearchTextField,
                  ),
                  Expanded(
                    flex: 6,
                    child: ListView.builder(
                      itemCount: places.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(places[index]),
                      ),
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
