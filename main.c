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

char *getline(FILE *);

int main(int argc, char * const argv[])
{
	parse_cmdline(argc, argv);
	FILE *fp_in = stdin;

	while (!feof(fp_in)) {
		char *line = getline(fp_in);

		if (line == NULL) {
			fprintf(stderr, "cannot read line.\n");
			exit(1);
		}
		printf("Line: %s\n", line);
		// Parsear linea y obtener 2 matrices
		free(line);
		// Multiplicar matrices

		// Imprimir resultado

		
	}
	
	return 0;
}

// https://sucs.org/Knowledge/Help/Program%20Advisory/Reading%20an%20arbitrarily%20long%20line%20in%20C
char *getline(FILE *f)
{
    size_t size = 0;
    size_t len = 0;
    size_t last = 0;
    char *buf = NULL;

    do {
        size += BUFSIZ; /* BUFSIZ is defined as "the optimal read size for this platform" */
        buf = realloc(buf,size);

        if (buf == NULL) return NULL;
        fgets(buf+last,size,f);
        len = strlen(buf);
        last = len - 1;
    } while (!feof(f) && buf[last]!='\n');
    return buf;
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
