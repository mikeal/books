import langid
import sys

for i, line in enumerate(sys.stdin):
    line = line.strip()
    if line:
        try:
            detected_lang, _ = langid.classify(line)
            if detected_lang in ["zh", "hi", "en"]:
                print("{}:{}".format(i, detected_lang))
        except Exception as e:
            print("Error processing line {}: {}".format(i, str(e)), file=sys.stderr)
