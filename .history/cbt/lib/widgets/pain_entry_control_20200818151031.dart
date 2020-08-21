class PainEntryControl extends StatelessWidget {
  final String text;
  const PainEntryControl({
    this.text,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 74,
        color: Colors.white,
        fontWeight: FontWeight.w100,
      ),
    );
  }
}
