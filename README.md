# David Mas-Ponte CV

This is a repository to host and compile my CV.

## Update

For updating either talks, posters of articles change the
informaiton in the `bibtex` files and update the
bibliography to generate `yaml`. If talk or lead author
change the two arrays in the begining of the script.

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

