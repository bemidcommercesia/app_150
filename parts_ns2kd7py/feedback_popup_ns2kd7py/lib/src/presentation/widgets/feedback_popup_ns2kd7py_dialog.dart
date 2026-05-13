import 'package:flutter/material.dart';

import '../../constants/feedback_popup_ns2kd7py_text_styles.dart';
import 'feedback_popup_ns2kd7py_dialog_button.dart';
import 'feedback_popup_ns2kd7py_dialog_stars_section.dart';

class FeedbackPopupns2kd7pyRatingDialog extends StatefulWidget {
  /// The dialog's title
  final Text title;

  /// The dialog's message/description text
  final Text? message;

  /// The dialog's message/description text
  final Text? subtitle;

  /// The top image used for the dialog to be displayed
  final Widget? image;

  final Color? backgroundColor;
  final Gradient? backgroundGradient;

  /// Disables the cancel button and forces the user to leave a rating
  final bool force;

  final bool _enableComment;

  /// The comment's TextField hint text
  final String? commentHint;
  final TextStyle commentStyle;

  /// Settings for star section
  final FeedbackPopupns2kd7pyStarDialogSettings? starDialogSettings;

  /// Show or hide the close button
  final bool showCloseButton;

  final FeedbackPopupns2kd7pyDialogButtonSettings submitButtonSettings;
  final Widget Function(
    VoidCallback? onTap,
    String label,
    TextStyle style,
  )? buttonBuilder;
  final FeedbackPopupns2kd7pyDialogButtonSettings? secondButtonSettings;

  /// Returns a RatingDialogResponse with user's ns2kd7py rating and comment values
  final Function(FeedbackPopupns2kd7pyRatingDialogResponse) onSubmitted;

  /// called when user cancels/closes the dialog
  final Function? onCancelled;

  //sdfa ns2kd7py

  const FeedbackPopupns2kd7pyRatingDialog({
    super.key,
    required this.title,
    this.message,
    this.image,
    this.subtitle,
    required this.submitButtonSettings,
    this.buttonBuilder,
    this.secondButtonSettings,
    required this.onSubmitted,
    this.onCancelled,
    this.showCloseButton = false,
    this.force = false,
    this.backgroundColor,
    this.backgroundGradient,
  })  : _enableComment = false,
        commentStyle = FeedbackPopupns2kd7pyTextStyles.commentStyle,
        commentHint = null,
        starDialogSettings = null;

  const FeedbackPopupns2kd7pyRatingDialog.withStars({
    super.key,
    required this.title,
    this.message,
    this.subtitle,
    this.image,
    this.starDialogSettings = const FeedbackPopupns2kd7pyStarDialogSettings.base(),
    required this.submitButtonSettings,
    this.buttonBuilder,
    required this.onSubmitted,
    this.secondButtonSettings,
    this.onCancelled,
    this.showCloseButton = false,
    this.force = false,
    this.backgroundColor,
    this.backgroundGradient,
  })  : _enableComment = false,
        commentStyle = FeedbackPopupns2kd7pyTextStyles.commentStyle,
        commentHint = null;

  const FeedbackPopupns2kd7pyRatingDialog.comment({
    super.key,
    required this.title,
    this.subtitle,
    this.message,
    this.image,
    this.commentStyle = FeedbackPopupns2kd7pyTextStyles.commentStyle,
    this.commentHint = 'Write your comment, question or suggestion',
    required this.submitButtonSettings,
    this.buttonBuilder,
    required this.onSubmitted,
    this.secondButtonSettings,
    this.onCancelled,
    this.showCloseButton = false,
    this.force = false,
    this.backgroundColor,
    this.backgroundGradient,
  })  : starDialogSettings = null,
        _enableComment = true;

  @override
  State<FeedbackPopupns2kd7pyRatingDialog> createState() => _FeedbackPopupns2kd7pyRatingDialogState();
}

class _FeedbackPopupns2kd7pyRatingDialogState extends State<FeedbackPopupns2kd7pyRatingDialog> {
  late final canSubmitNotifier = ValueNotifier(
    !widget._enableComment && widget.starDialogSettings == null,
  );
  final _commentController = TextEditingController();
  late FeedbackPopupns2kd7pyRatingDialogResponse _response;



  @override
  void initState() {
    super.initState();
    _response = FeedbackPopupns2kd7pyRatingDialogResponse(
      rating: widget.starDialogSettings?.initialRating ?? 0,
    );



    if (widget._enableComment) {
      _commentController.addListener(
        () => canSubmitNotifier.value = _commentController.text.isNotEmpty,
      );
    }
  }

  void onRate(double rating) {
    _response.rating = rating;
    canSubmitNotifier.value = _response.rating > 0;
  }

  void onSubmit() {
    if (!widget.force) Navigator.pop(context);

    _response.comment = _commentController.text;
    widget.onSubmitted(_response);
  }

  void onSecondButton() {
    if (!widget.force) Navigator.pop(context);
    _response.rating = 60.0;
    widget.onSubmitted(_response);
  }

  @override
  Widget build(BuildContext context) {


    final content = Stack(
      children: <Widget>[
        _Decoration(
          backgroundColor: widget.backgroundColor,
          gradient: widget.backgroundGradient,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              if (widget.image != null) _DialogImage(image: widget.image!),
              widget.title,
              const SizedBox(height: 10),
              if (widget.starDialogSettings != null)
                Center(
                  child: FeedbackPopupns2kd7pyDialogStarsSection(
                    settings: widget.starDialogSettings!,
                    onChange: onRate,
                  ),
                ),
              widget.subtitle ?? Container(),
              const SizedBox(height: 10),
              widget.message ?? Container(),
              const SizedBox(height: 5),
              if (widget._enableComment)
                _CommentField(
                  textStyle: widget.commentStyle,
                  controller: _commentController,
                  hint: widget.commentHint,
                ),
              const SizedBox(height: 10),
              ValueListenableBuilder(
                  valueListenable: canSubmitNotifier,
                  builder: (_, canSubmit, __) {
                    if (widget.buttonBuilder != null) {
                      final textSettings = widget.submitButtonSettings;
                      return widget.buttonBuilder!(
                        canSubmit ? onSubmit : null,
                        textSettings.label,
                        textSettings.textStyle,
                      );
                    }
                    return FeedbackPopupns2kd7pyDialogButton(
                      settings: FeedbackPopupns2kd7pyDialogButtonSettings(
                        label: widget.submitButtonSettings.label,
                        textStyle: widget.submitButtonSettings.textStyle,
                      ),
                      onTap: canSubmit ? onSubmit : null,
                    );
                  }),
              const SizedBox(height: 10),
              if (widget.secondButtonSettings != null)
FeedbackPopupns2kd7pyDialogButton(
                  settings: FeedbackPopupns2kd7pyDialogButtonSettings(
                    label: widget.secondButtonSettings!.label,
                    textStyle: widget.secondButtonSettings!.textStyle,
                  ),
                  onTap: onSecondButton,
                ),
              SizedBox(
                height: MediaQuery.paddingOf(context).bottom,
              ),
            ],
          ),
        ),
        if (!widget.force &&
            widget.onCancelled != null &&
            widget.showCloseButton) ...[
          IconButton(
            icon: const Icon(Icons.close, size: 18),
            onPressed: () {
              if (mounted) {
                Navigator.pop(context);
              }
              widget.onCancelled!.call();
            },
          )
        ]
      ],
    );
    return PopScope(
      canPop: false,
      child: Material(
        color: Colors.transparent, // <-- Add this, if needed
        child: Scaffold(
        backgroundColor: Colors.transparent,
          body:Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: content,
            ),
          ),
        ),
      ),
    );
  }
}

class FeedbackPopupns2kd7pyRatingDialogResponse {
  /// The user's comment response
  String comment;

  /// The user's rating response
  double rating;

  FeedbackPopupns2kd7pyRatingDialogResponse({this.rating = 0.0, this.comment = ''});
}

class _DialogImage extends StatelessWidget {
  const _DialogImage({required this.image});

  final Widget image;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _Decoration extends StatelessWidget {
  const _Decoration({
    this.backgroundColor,
    this.gradient,
    required this.child,
  });

  final Color? backgroundColor;
  final Gradient? gradient;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        gradient: gradient,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
      ),
      margin: const EdgeInsets.only(bottom: 0.0),
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 5),
      child: child,
    );
  }
}

class _CommentField extends StatelessWidget {
  const _CommentField({
    required this.textStyle,
    required this.controller,
    this.hint,
  });

  final TextStyle textStyle;
  final TextEditingController controller;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: textStyle,
      textAlign: TextAlign.left,
      textInputAction: TextInputAction.newline,
      minLines: 1,
      maxLines: 5,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(6.0),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white12, width: 0.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 0.0),
        ),
        hintText: hint,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 15,
          color: Colors.white12,
        ),
      ),
    );
  }
}
