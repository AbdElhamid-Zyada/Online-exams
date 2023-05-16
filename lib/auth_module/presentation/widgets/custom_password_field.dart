import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_exams_system/shared/style/themes.dart';
import 'package:sizer/sizer.dart';

// Custom form field widget for password input
class CustomPasswordField extends FormField<String> {
  final TextEditingController controller; // the controller for the password input field
  final String label; // the label text for the password input field
  final bool obscureText; // whether to obscure the password or not
  final IconData? suffixIcon; // an optional suffix icon for the password input field

  CustomPasswordField({
    Key? key,
    required this.controller,
    required this.label,
    this.obscureText = true,
    this.suffixIcon,
    FormFieldSetter<String>? onSaved,
    String? Function(String? val)? validator,
  }) : super(
    key: key,
    initialValue: controller.text,
    onSaved: onSaved,
    validator: validator,
    builder: (FormFieldState<String> state) {
      return _CustomPasswordFieldWidget(
        controller: controller,
        label: label,
        obscureText: obscureText,
        suffixIcon: suffixIcon,
        state: state,
      );
    },
  );

  @override
  FormFieldState<String> createState() => FormFieldState<String>();
}

// The stateful widget for the custom password input field
class _CustomPasswordFieldWidget extends StatefulWidget {
  final TextEditingController controller; // the controller for the password input field
  final String label; // the label text for the password input field
  final bool obscureText; // whether to obscure the password or not
  final IconData? suffixIcon; // an optional suffix icon for the password input field
  final FormFieldState<String> state; // the state of the form field

  _CustomPasswordFieldWidget({
    required this.controller,
    required this.label,
    required this.obscureText,
    required this.suffixIcon,
    required this.state,
  });

  @override
  _CustomPasswordFieldWidgetState createState() =>
      _CustomPasswordFieldWidgetState();
}

class _CustomPasswordFieldWidgetState
    extends State<_CustomPasswordFieldWidget> {
  bool _isObscure = true; // whether the password is currently obscured or not

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Label for the password input field
            Text(
              widget.label,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            // Container for the password input field
            Container(
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 5.w,
              ),
              child: TextFormField(
                controller: widget.controller,
                obscureText: _isObscure,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                  hintText: widget.label,
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    child: Icon(
                      _isObscure
                          ? (widget.suffixIcon ?? Icons.visibility_off)
                          : Icons.visibility,
                      color: Colors.grey[400],
                    ),
                  ),prefixIcon: Icon(Icons.lock,color: Themes.darkBlue,),
                  suffixIconConstraints:
                  BoxConstraints(minWidth: 1.w, minHeight: 1.w),
                ),
              ),
            ),
            // Display the error message below the TextFormField if there is any
            if (widget.state.hasError)
              Text(
                widget.state.errorText!,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(color:Colors.red),
              ),
          ],
        );
      },
    );
  }
}