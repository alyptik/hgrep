# hgrep
A simple Perl script to quickly search header files in /usr/include using keywords or regular expressions.

### Usage

Requires `File::Grep` and `File::Find`

Install them with `cpan File::Grep File::Find`

You can then run the script with:

```bash
./hgrep -h -i -r -v -c="(y|n)" -C="#" -n="#" <query>
  -h --help:	Print usage information
  -i:		Case-insensitive matching (works both with and without -r)
  -r:		Parse query as a regular expression
  -v --version:	Show version
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
