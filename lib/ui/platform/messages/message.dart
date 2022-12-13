enum Severity { error, warning, info }

class Message {
  Severity severity;
  String text;

  Message(this.severity, this.text);

  Message.info(String text)
      : text = text,
        severity = Severity.info;

  Message.error(String text)
      : text = text,
        severity = Severity.error;

  Message.warning(String text)
      : text = text,
        severity = Severity.warning;
}
