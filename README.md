<h1 align="center">
  <img alt="AwesomeCV" src="icon.png" width="180px" height="180px" />
  <br />
  Awesome CV & Resume
</h1>

<p align="center">
  Mohamad Dikshie Fauzie — Data Center & IT Infrastructure Engineer
  <br />
  Curriculum Vitae, Résumé, and Cover Letter LaTeX Templates
</p>

<div align="center">
  <a href="https://github.com/dikshie/Awesome-CV/actions">
    <img alt="Build Status" src="https://github.com/dikshie/Awesome-CV/workflows/Build%20LaTeX%20Documents/badge.svg" />
  </a>
  <a href="https://github.com/dikshie/Awesome-CV/releases/latest">
    <img alt="Latest Release" src="https://img.shields.io/github/v/release/dikshie/Awesome-CV?color=blue" />
  </a>
  <a href="https://github.com/dikshie/Awesome-CV/releases/latest/download/resume.pdf">
    <img alt="Resume PDF" src="https://img.shields.io/badge/resume-pdf-green.svg" />
  </a>
  <a href="https://github.com/dikshie/Awesome-CV/releases/latest/download/cv.pdf">
    <img alt="CV PDF" src="https://img.shields.io/badge/cv-pdf-green.svg" />
  </a>
  <a href="https://github.com/dikshie/Awesome-CV/releases/latest/download/coverletter.pdf">
    <img alt="Cover Letter PDF" src="https://img.shields.io/badge/coverletter-pdf-green.svg" />
  </a>
</div>

<br />

## Overview

This repository maintains the LaTeX sources and automated build/release pipeline for:
* **Résumé**: [`examples/resume.tex`](examples/resume.tex) ([Download PDF](https://github.com/dikshie/Awesome-CV/releases/latest/download/resume.pdf))
* **Curriculum Vitae (CV)**: [`examples/cv.tex`](examples/cv.tex) ([Download PDF](https://github.com/dikshie/Awesome-CV/releases/latest/download/cv.pdf))
* **Cover Letter**: [`examples/coverletter.tex`](examples/coverletter.tex) ([Download PDF](https://github.com/dikshie/Awesome-CV/releases/latest/download/coverletter.pdf))

For detailed workflow documentation, local compilation, and release instructions, refer to [**WORKFLOW.md**](WORKFLOW.md).

---

## Preview

#### Résumé
[Download Latest PDF](https://github.com/dikshie/Awesome-CV/releases/latest/download/resume.pdf)

| Page 1 | Page 2 |
|:---:|:---:|
| [![Résumé Page 1](examples/resume-0.png)](https://github.com/dikshie/Awesome-CV/releases/latest/download/resume.pdf) | [![Résumé Page 2](examples/resume-1.png)](https://github.com/dikshie/Awesome-CV/releases/latest/download/resume.pdf) |

#### Cover Letter
[Download Latest PDF](https://github.com/dikshie/Awesome-CV/releases/latest/download/coverletter.pdf)

| Cover Letter |
|:---:|
| [![Cover Letter](examples/coverletter-1.png)](https://github.com/dikshie/Awesome-CV/releases/latest/download/coverletter.pdf) |

---

## How to Build

### Requirements
* **XeLaTeX** (TeX Live 2021 or newer recommended)
* Bundled fonts in `fonts/` (Roboto and FontAwesome)

### Build Commands
Prefix commands with `rtk` (Rust Token Killer) for optimized terminal output:

```bash
# Build all documents
rtk make all

# Build individual documents
rtk make resume
rtk make cv
rtk make coverletter

# Force clean rebuild
rtk make -B all

# Clean temporary build artifacts
rtk make clean
```

---

## Automated Releases

Pushing an annotated git tag automatically triggers the GitHub Actions release workflow to compile the documents and attach `resume.pdf`, `cv.pdf`, and `coverletter.pdf` to a new release:

```bash
rtk git tag v1.0.1 -m "Release v1.0.1"
rtk git push origin v1.0.1
```

See [**WORKFLOW.md**](WORKFLOW.md) for step-by-step guidance.

---

## Credits & License

* Template original design by [Claud D. Park (posquit0)](https://github.com/posquit0/Awesome-CV).
* Licensed under [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/).
