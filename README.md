# hgrep
A utility to quickly search header files in /usr/include using keywords/regular expressions.
## Usage
```bash
hgrep -hrv -n="#" -c="(y|n)" <query>
  -h:		Print usage information
  -r:		Parse query as a regular expression
  -v:		Show version
  -n="#":	Number of matches to print
  -c="(y|n)":	Colorize output (default: enabled)
```
