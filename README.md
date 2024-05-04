# David Mas-Ponte CV

This is a repository to host and compile my CV.

## Update publications

For updating either talks, posters or articles, first change the
informaiton in the `bibtex` files and update the
bibliography to generate `yaml`.

```
hayagriva talks.bib  > talks.yaml
```

If the talk/paper/preprint is a "lead author" work
change the two arrays in the begining of the `cv.typ` script.

If the work is a submitted preprint, edit the `yaml` file with
a submitted field as follows: (this modification is optional!)

```
  submitted:
    journal: "Journal"
    status: "under review/in press"
```

The rest of the information is currently hardcoded in the
`.typ` scrypt.

## Usage

To compile the project:

```
make all
```

Compiling the pdf requires [typst](https://github.com/typst/typst).

### Generate YAML files

To regenerate the YAML files form the bibtex files use:

```
hayagriva talks.bib  > talks.yaml
```

Requires [hayagriva](https://github.com/typst/hayagriva)

