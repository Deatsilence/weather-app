// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:f_weather/product/state/search_places_manager.dart';

class SearchTextFormField extends StatelessWidget {
  const SearchTextFormField({
    Key? key,
    required this.controller,
    this.onSubmitted,
    this.onChange,
  }) : super(key: key);

  final TextEditingController controller;
  final void Function(String)? onChange;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return SizedBox(
      width: width * 0.9,
      height: height * 0.07,
      child: Observer(
        builder: (context) => TextField(
          contextMenuBuilder: (context, editableTextState) {
            return AdaptiveTextSelectionToolbar.buttonItems(
              anchors: editableTextState.contextMenuAnchors,
              buttonItems: <ContextMenuButtonItem>[
                ContextMenuButtonItem(
                  onPressed: () {
                    editableTextState.copySelection(SelectionChangedCause.toolbar);
                  },
                  type: ContextMenuButtonType.copy,
                ),
                ContextMenuButtonItem(
                  onPressed: () {
                    editableTextState.selectAll(SelectionChangedCause.toolbar);
                  },
                  type: ContextMenuButtonType.selectAll,
                ),
                ContextMenuButtonItem(
                  onPressed: () {
                    editableTextState.cutSelection(SelectionChangedCause.toolbar);
                  },
                  type: ContextMenuButtonType.cut,
                ),
                ContextMenuButtonItem(
                  onPressed: () {
                    editableTextState.pasteText(SelectionChangedCause.toolbar);
                  },
                  type: ContextMenuButtonType.paste,
                ),
              ],
            );
          },
          enableInteractiveSelection: true,
          onChanged: (value) {
            onChange?.call(value);
            value.isNotEmpty
                ? GetSearchPlacesStateManager.searchPlacesManager.changeClearButtonState(isActive: true)
                : GetSearchPlacesStateManager.searchPlacesManager.changeClearButtonState(isActive: false);
          },
          onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
          onSubmitted: onSubmitted,
          controller: controller,
          autofocus: true,
          keyboardType: TextInputType.streetAddress,
          maxLines: 1,
          autocorrect: false,
          decoration: InputDecoration(
            suffixIcon: GetSearchPlacesStateManager.searchPlacesManager.isActiveClearButton
                ? IconButton(
                    onPressed: () {
                      controller.clear();
                      GetSearchPlacesStateManager.searchPlacesManager.changeClearButtonState(isActive: false);
                    },
                    icon: const Icon(Icons.clear_outlined),
                  )
                : null,
            hintText: "Search Places",
            prefixIcon: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
