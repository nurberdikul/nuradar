import sys
import re

filepath = sys.argv[1]
with open(filepath, 'r', encoding='utf-8') as f:
    content = f.read()

lines = content.split('\n')
original_msg = ""
for line in lines:
    if line.strip() and not line.startswith('#'):
        original_msg = line.strip()
        break

new_msg = original_msg

# Specific mapping for the known russian commit
if "добавил интерактивный дашборд" in original_msg:
    new_msg = "add dashboard and map"
else:
    # Remove common prefixes like feat:, fix:, etc.
    new_msg = re.sub(r'^(feat|fix|chore|ui|refactor|style|test|docs):\s*', '', original_msg, flags=re.IGNORECASE)
    # Lowercase everything
    new_msg = new_msg.lower()

with open(filepath, 'w', encoding='utf-8') as f:
    f.write(new_msg + '\n')
