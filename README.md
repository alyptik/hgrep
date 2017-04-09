# hgrep
A simple Perl script to quickly search header files in /usr/include using keywords or regular expressions.
### Usage
```bash
hgrep -hrv -c="(y|n)" -C="#" -n="#" <query>
  -h:		Print usage information
  -r:		Parse query as a regular expression
  -v:		Show version
  -c="(y|n)":   Colorize output (default: enabled)
  -C="#":       Number of after-context lines (default: 1)
  -n="#":       Number of matches to print (default: 10)
```
