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
### Example output
```bash
./hgrep -r -c=n -C=2 -n=2 'printf *\(.*'

	Searching for: "(?^:printf *\(.*)"
	# of matches that will be printed: 2
	# of after-context lines that will be printed: 2

	/* Use replacement snprintf() functions. */
	/* #undef USE_REPL_SNPRINTF */

	/* Define to 1 to use Intel SSE 4.2 CRC instructions with a runtime check. */
	#define caca_printf(x, y, f, z...) caca_printf(__caca0_cv, x, y, f, ##z)
	#define caca_clear() caca_clear_canvas(__caca0_cv)

	#define caca_draw_line(x, y, z, t, c) \
```
