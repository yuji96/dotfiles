import sys
import json
import pyperclip


if sys.argv[1].endswith(".tex.txt"):
    with open(sys.argv[1]) as f:
        pyperclip.copy(json.dumps(f.read().splitlines(), ensure_ascii=False, indent=2))
        print("copy to clipboard")
