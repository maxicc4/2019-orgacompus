#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <getopt.h>
#include <ctype.h>
#include "matrix.h"


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


static void parse_cmdline(int argc, char * const argv[]);
static void do_usage(const char *name, int status);
static void do_version(const char *name);

char *get_line(FILE *f);
int parse_line(char *line, matrix_t **m1, matrix_t **m2);


int main(int argc, char * const argv[])
{
	parse_cmdline(argc, argv);
	FILE *fp_in = stdin;
	FILE *fp_out = stdout;
	matrix_t *m1 = NULL;
	matrix_t *m2 = NULL;
	matrix_t *m_result = NULL;
	unsigned long int num_line = 1;

	while (!feof(fp_in)) {
		char *line = get_line(fp_in);

		if (line == NULL) {
			fprintf(stderr, "Error: cannot read line %ld.\n", num_line);
			exit(1);
		}
		if (!isspace(line[0])) {
			if (parse_line(line, &m1, &m2) == 1) {
				fprintf(stderr, "Error: cannot parse line %ld.\n", num_line);
				exit(1);
			}
			free(line);
			
			m_result = matrix_multiply(m1, m2);
			destroy_matrix(m1);
			destroy_matrix(m2);

			print_matrix(fp_out, m_result);
			destroy_matrix(m_result);
		}
		num_line++;
	}
	
	return 0;
}
// Hace el parseo de la linea y crea las 2 matrices
// Si obtuvo error devuelve 1. Si fue exitoso 0
int parse_line(char *line, matrix_t **m1, matrix_t **m2)
{
	char *line_end;
	double value;
	matrix_t *matrices[2];
	
	int n = strtoul(line, &line_end, 10);

	if (n > 0) {
		int num_values = n*n;
		int i = 0;

		*m1 = create_matrix(n, n);
		matrices[0] = *m1;
		*m2 = create_matrix(n, n);
		matrices[1] = *m2;
		char *token = strtok(line_end, " ");
		if (token == NULL) {
			return 1;
		}
		sscanf(token, "%lg", &value);
		(*m1)->array[i] = value;
		i++;
		int x;
		for (x=0; x < 2; x++) {
			matrix_t *m = matrices[x];
			while ( (i < num_values) && (token=strtok(NULL, " ")) ) {
				sscanf(token, "%lg", &value);
				m->array[i] = value;
				i++;
			}
			if (i != num_values) {
				return 1;
			}
			i = 0;
		}
		return 0;
	}
	return 1;
}

// Lee una linea de cualquier tamanio del file pointer.
char *get_line(FILE *f)
{
    size_t size = 0;
    size_t len = 0;
    size_t last = 0;
    char *buf = NULL;

    do {
        size += BUFSIZ; /* BUFSIZ is defined as "the optimal read size for this platform" */
        buf = realloc(buf,size);

        if (buf == NULL) return NULL;
        if (fgets(buf+len,BUFSIZ,f) == NULL) {
        	if (feof(f)) {
        		free(buf);
        		return " ";
        	} else {
        		return NULL;
        	}
        }
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
