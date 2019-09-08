#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <getopt.h>


#ifndef VERSION
#define VERSION "0.0.1"
#endif

#ifndef no_argument
#define no_argument 0
#endif

#ifndef required_argument
#define required_argument 1
#endif

#ifndef optional_argument
#define optional_argument 2
#endif

static void parse_cmdline(int, char * const []);
static void do_usage(const char *, int);
static void do_version(const char *);

int main(int argc, char * const argv[])
{
	parse_cmdline(argc, argv);

	// Parsear linea y obtener 2 matrices

	// Multiplicar matrices

	// Imprimir resultado
	
	return 0;
}

static void parse_cmdline(int argc, char * const argv[])
{
	int ch;
	int index = 0;

	struct option options[] = {
		{"help", no_argument, NULL, 'h'},
		{"version", no_argument, NULL, 'V'},
		{NULL, 0, NULL, 0}
	};

	while ((ch = getopt_long(argc, argv, "hV", options, &index)) != -1) {
		switch (ch) {
		case 'h':
			do_usage(argv[0], 0);
			break;
		case 'V':
			do_version(argv[0]);
			break;
		default:
			do_usage(argv[0], 1);
		}
	}
}

static void do_usage(const char *name, int status)
{
	fprintf(stderr, "Usage:\n");
	fprintf(stderr, "  %s -h\n", name);
	fprintf(stderr, "  %s -V\n", name);
	fprintf(stderr, "  %s < in_file > out_file\n", name);
	fprintf(stderr, "Options:\n");
	fprintf(stderr, "  -V, --version "
	                " Print version and quit.\n");
	fprintf(stderr, "  -h, --help     "
	                " Print this information and quit.\n");
	fprintf(stderr, "Examples:\n");
	fprintf(stderr, "  %s < in.txt > out.txt\n", name);
	fprintf(stderr, "  cat in.txt | %s > out.txt\n", name);
	exit(status);
}

static void do_version(const char *name)
{
	fprintf(stderr, "%s\n", VERSION);
	exit(0);
}
