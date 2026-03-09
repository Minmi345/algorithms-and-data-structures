import re
from collections import defaultdict

INPUT_FILE = "src/Seminar 1 - File with random numbers.txt"
OUTPUT_FILE = "averaged_table.txt"

# Column sizes (fixed, taken from header)
SIZES = [
    1000, 2500, 5000, 7500, 10000, 25000, 50000,
    75000, 100000, 250000, 500000, 750000, 1000000
]

# Regex patterns
HEADER_RE = re.compile(r"^\s+1000\s+2500")
ROW_RE = re.compile(r"^([A-Za-z]+(?:\([a-z]+\))?)\s+(.+)$")

# Data structure:
# data[algorithm][col_index] = [values...]
data = defaultdict(lambda: defaultdict(list))

with open(INPUT_FILE, "r", encoding="utf-8") as f:
    lines = f.readlines()

i = 0
while i < len(lines):
    line = lines[i]

    # Detect table header
    if HEADER_RE.match(line):
        i += 1
        # Read rows until empty line
        while i < len(lines) and lines[i].strip():
            row = lines[i].rstrip()
            match = ROW_RE.match(row)
            if match:
                algo = match.group(1)
                values = list(map(int, match.group(2).split()))
                for idx, val in enumerate(values):
                    data[algo][idx].append(val)
            i += 1
    else:
        i += 1

# Compute averages
averages = {}
for algo, cols in data.items():
    averages[algo] = [
        sum(vals) // len(vals) for _, vals in sorted(cols.items())
    ]

# ---------- OUTPUT ----------
with open(OUTPUT_FILE, "w", encoding="utf-8") as out:
    # Header
    out.write(" " * 24)
    for s in SIZES:
        out.write(f"{s:>12}")
    out.write("\n")

    # Rows
    for algo in sorted(averages.keys()):
        out.write(f"{algo:<24}")
        for val in averages[algo]:
            out.write(f"{val:>12}")
        out.write("\n")

print(f"Averaged table written to '{OUTPUT_FILE}'")
