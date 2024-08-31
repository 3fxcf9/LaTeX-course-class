# LaTeX Course Class

A LaTeX class designed specifically for typesetting mathematics course materials. It provides clean and consistent support for theorems, definitions, proofs, and other essential mathematical structures.

## Features

- Easy-to-use environments
- Automatic numbering for theorems, lemmas, corollaries, proofs, definitions and examples
- French version with environments names translated
- Useful shortcuts, like `\R`, `\Z`, `\norm{\vec{u}}`

## Installation

### NixOS (home-manager)

The flake.nix file in this repository provides a Nix package. To install it globally, you need to use the `texlive.combine` option in your Home Manager configuration after defining the package as an input in your configuration flake.

1. Add the package to your flake.nix:

```nix
inputs = {
    ...
    custom-latex-course-class = {
      url = "git+ssh://git@github.com/3fxcf9/LaTeX-course-class.git?ref=main&shallow=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
}
```

2. Update your Home Manager configuration:

```nix
  home.packages = [
    (pkgs.texlive.combine {
      inherit (pkgs.texlive) scheme-full;
      custom-latex-course-class = {
        pkgs = [
          inputs.custom-latex-course-class.packages.${pkgs.system}.default
        ];
      };
    })
  ];

```

### Other

Place the `course.cls` or `course-fr.cls` file in the same directory as your LaTeX document or in your local TeX tree.

## Usage

To use the class in your LaTeX document, simply include the following line in your preamble:

```latex
\documentclass{course} % You can replace `course` by `course-fr` for the french version
```

## Theorem Environments

The class provides the following theorem-like environments:

- `theorem`/`theorems`/`theoremlist`
- `lemma`/`corollary`/`building`
- `definition`/`definitions`/`deflist`
- `property`/`properties`/`proplist`
- `remark`/`remarks`/`remarklist`
- `example`/`examples`/`exlist`

Example usage:

```latex
\begin{theorem}
$\forall{z}\in\C, \conj{\conj{z}} = z$ (Involutive property of the conjugate)
\end{theorem}

\begin{proof}
$\conj{z}=\conj{a-ib}=a+ib=z$
\end{proof}
```

<!-- ## Real-world examples -->
<!---->
<!-- Check out the `examples` directory for sample LaTeX documents. -->

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This work may be distributed and/or modified under the conditions of the LaTeX Project Public License, either version 1.3 of this license or (at your option) any later version.
The latest version of this license can be found [here](https://www.latex-project.org/lppl.txt) and version 1.3c or later is part of all distributions of LaTeX version 2024 or later.
