import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField(
      {Key? key,
      this.hintText,
      required this.controller,
      this.inputFormatters,
      this.labelColor,
      this.validator,
      this.label = "",
      this.inputAction,
      this.isRequired,
      this.prefix,
      this.focusedBorder,
      this.borderColor,
      this.maxLines = 1,
      this.textColor = Colors.black,
      this.hintColor = Colors.grey,
      this.suffix,
      this.enablePaddingOutside = true,
      this.borderSize = 1.0,
      this.isEnable = true,
      this.maxLength,
      this.inputType = TextInputType.text,
      this.onChange,
      this.isRemovable = false,
      this.textCapitalization,
      this.contentPadding,
      this.labelStyle})
      : super(key: key);
  final TextInputAction? inputAction;
  final bool? isRemovable;
  final bool? isRequired;
  final bool? isEnable;
  final bool? enablePaddingOutside;
  final TextEditingController controller;
  final TextInputType? inputType;
  final String? hintText;
  final String? label;
  final Widget? suffix;
  final int? maxLength;
  final Widget? prefix;
  final int? maxLines;
  final Color? textColor;
  final Color? hintColor;
  final Color? focusedBorder;
  final Color? borderColor;
  final double? borderSize;
  final Color? labelColor;
  final EdgeInsets? contentPadding;
  final ValueChanged<String>? onChange;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextCapitalization? textCapitalization;
  final TextStyle? labelStyle;

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  final FocusNode _focus = FocusNode();
  bool _obsuretext = true;

  @override
  void initState() {
    _focus.addListener(_onFocusChange);
    widget.controller.addListener(_onChange);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: (widget.enablePaddingOutside!)
          ? const EdgeInsets.all(8.0)
          : EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != "")
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: RichText(
                text: TextSpan(
                  text: widget.label,
                  style: (widget.labelStyle != null)
                      ? widget.labelStyle
                      : TextStyle(
                          fontSize: 12.0,
                          color: (widget.labelColor == null)
                              ? Theme.of(context).hintColor
                              : widget.labelColor),
                  children: [
                    TextSpan(
                      text: (widget.isRequired == true) ? " *" : "",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red[700]),
                    ),
                  ],
                ),
              ),
            ),
          TextFormField(
            enabled: widget.isEnable,
            maxLength: widget.maxLength,
            maxLines: widget.maxLines,
            style: TextStyle(color: widget.textColor, fontSize: 16.0),
            textInputAction: widget.inputAction,
            obscureText: (widget.inputType == TextInputType.visiblePassword)
                ? _obsuretext
                : false,
            onChanged: (string) {
              if (widget.onChange != null) {
                widget.onChange!(string);
              }
            },
            controller: widget.controller,
            // style: poppinsMedium,x
            textCapitalization:
                widget.textCapitalization ?? TextCapitalization.none,
            inputFormatters: widget.inputFormatters,
            keyboardType: widget.inputType,
            validator: widget.validator,
            focusNode: _focus,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:
                      BorderSide(color: widget.focusedBorder ?? Colors.blue)),
              filled: true,
              fillColor: Colors.grey[100] /*Colors.grey[100]*/,
              enabledBorder: OutlineInputBorder(
                // width: 0.0 produces a thin "hairline" border
                borderSide: BorderSide(
                    color: (widget.borderColor == null)
                        ? Colors.grey
                        : widget.borderColor!,
                    width: widget.borderSize!),
                borderRadius: BorderRadius.circular(10.0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              counterText: "",
              hintText: widget.hintText,
              hintStyle: TextStyle(color: widget.hintColor, fontSize: 16.0),
              isDense: true,
              prefixIcon: widget.prefix,
              contentPadding: widget.contentPadding ??
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
              suffixIcon: (widget.inputType == TextInputType.visiblePassword)
                  ? (GestureDetector(
                      child: (_obsuretext)
                          ? const Icon(
                              Icons.visibility_off,
                              color: Colors.black,
                              size: 20.0,
                            )
                          : const Icon(
                              Icons.visibility,
                              size: 20.0,
                              color: Colors.black,
                            ),
                      onTap: () {
                        setState(() {
                          _obsuretext = !_obsuretext;
                        });
                      }))
                  : null,
              suffix: (widget.isRemovable == true)
                  ? ((_focus.hasFocus)
                      ? GestureDetector(
                          onTap: () {
                            widget.controller.clear();
                            _onChange();
                          },
                          child: const Icon(
                            Icons.highlight_remove_rounded,
                            color: Colors.black,
                            size: 16.0,
                          ),
                        )
                      : null)
                  : SizedBox(height: 20.0, width: 20.0, child: (widget.suffix)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
    // widget.controller.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
    // Logger().i("Focus: ${_focus.hasPrimaryFocus.toString()}");
  }

  void _onChange() {
    if (widget.onChange != null) {
      widget.onChange!(widget.controller.text);
    }
  }
}
