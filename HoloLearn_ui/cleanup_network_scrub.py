from pathlib import Path
import re
files = [
    'd:/HoloLearn_ui/lib/screens/change_pass_screen.dart',
    'd:/HoloLearn_ui/lib/screens/create_new_lecture_screen.dart',
    'd:/HoloLearn_ui/lib/screens/edit_lecture_screen.dart',
    'd:/HoloLearn_ui/lib/screens/forget_pass_screen.dart',
    'd:/HoloLearn_ui/lib/screens/lecture_options_screen.dart',
    'd:/HoloLearn_ui/lib/screens/otp_verification_screen.dart',
    'd:/HoloLearn_ui/lib/screens/profile_screen.dart',
    'd:/HoloLearn_ui/lib/screens/reset_pass_screen.dart',
    'd:/HoloLearn_ui/lib/screens/student_dashboard_screen.dart',
]
for file_path in files:
    p = Path(file_path)
    if not p.exists():
        print('MISSING', file_path)
        continue
    text = p.read_text(encoding='utf-8')
    t = text.replace('\r\n', '\n')
    t = re.sub(r"^import .*package:http/http\\.dart.*\n", '', t, flags=re.MULTILINE)
    if 'File(' not in t and 'File ' not in t:
        t = re.sub(r"^import .*dart:io.*\n", '', t, flags=re.MULTILINE)
    t = re.sub(r"\n\s*}\s*on\s+(?:http\\.)?ClientException\s*\{.*?\}\s*", '\n', t, flags=re.DOTALL)
    t = re.sub(r"\n\s*}\s*on\s+SocketException\s*\{.*?\}\s*", '\n', t, flags=re.DOTALL)
    t = re.sub(r"\n\s*}\s*on\s+TimeoutException\s*\{.*?\}\s*", '\n', t, flags=re.DOTALL)
    if t != text:
        p.write_text(t.replace('\n', '\r\n'), encoding='utf-8')
        print('Updated', file_path)
