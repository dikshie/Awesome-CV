# Awesome-CV Workflow & Release Guide

This document outlines the development, compilation, document alignment, and automated release workflow for the CV, Resume, and Cover Letter.

---

## 1. Overview of Documents

The repository maintains three synchronized LaTeX documents located in `examples/`:

| Document | Source File | Compiled Output | Description |
|---|---|---|---|
| **Resume** | [`examples/resume.tex`](examples/resume.tex) | `examples/resume.pdf` | Concise 2-page summary of professional experience, trainings, publications, and education |
| **Curriculum Vitae (CV)** | [`examples/cv.tex`](examples/cv.tex) | `examples/cv.pdf` | Detailed 2-page CV covering skills, work experience, education, publications, and trainings |
| **Cover Letter** | [`examples/coverletter.tex`](examples/coverletter.tex) | `examples/coverletter.pdf` | 1-page formal application letter tailored to data center & infrastructure engineering |

### Document Alignment Checklist
When personal information, job titles, or contact info change, verify all three root templates:
* **Personal Info**: Name, position title, address, phone number, email, homepage, GitHub, LinkedIn.
* **Colors & Fonts**: `awesome-red` theme, `fonts/` directory, geometry margins.
* **Footers**: Synchronized date, name, document title, and page numbering.

---

## 2. Local Build Workflow

### Prerequisites
* **XeLaTeX** (TeX Live 2021 or newer recommended)
* Bundled fonts in `fonts/` (Roboto and FontAwesome)

### Makefile Commands

```bash
# Compile all documents (resume, cv, coverletter)
make all

# Compile individual documents
make resume
make cv
make coverletter

# Force a clean rebuild from scratch
make -B all

# Clean intermediate auxiliary files (*.aux, *.log, *.out, *.xdv, etc.) and PDFs
make clean
```

### Containerized Build (Docker)
If you don't have XeLaTeX installed locally or want a completely isolated build environment, use Docker:

```bash
# 1. Build the Docker image
make docker-build
# or
docker build -t awesome-cv .

# 2. Compile all documents inside container
make docker-all
# or
docker run --rm -u $(id -u):$(id -g) -v "$(pwd)":/workdir awesome-cv make all

# Or using Docker Compose:
docker compose run --rm awesome-cv make all

# Compile individual documents
make docker-resume
make docker-cv
make docker-coverletter
```

### Preview Image Generation
If updating preview screenshots for `README.md`:
```bash
# macOS sips tool
sips -s format png examples/coverletter.pdf --out examples/coverletter-1.png
```

---

## 3. GitHub Actions CI/CD Architecture

The repository uses two GitHub Actions workflows:

### A. CI Build (`.github/workflows/build.yml`)
* **Trigger**: Push or pull request targeting `master` or `main`, or manual `workflow_dispatch`.
* **Purpose**: Compiles all 3 documents on Ubuntu runner using `xu-cheng/latex-action@v3`.
* **Artifact**: Uploads `awesome-cv-pdfs` containing all compiled PDFs for build validation.

### B. Automated Release (`.github/workflows/release.yml`)
* **Trigger**: Pushing any version tag matching:
  * `v*` (e.g., `v1.0.0`, `v1.1.0`)
  * `[0-9]+.*` or `[0-9]+` (e.g., `2026.09.13`, `1.0.0`)
  * Manual `workflow_dispatch`.
* **Permissions**: `contents: write` (required to create GitHub releases and attach binary assets).
* **Actions Performed**:
  1. Clones repository with full commit history (`fetch-depth: 0`).
  2. Compiles `resume.tex`, `cv.tex`, and `coverletter.tex` via XeLaTeX.
  3. Automatically generates release notes from merged commits/PRs.
  4. Publishes a GitHub Release under the git tag.
  5. Attaches the generated PDFs (`resume.pdf`, `cv.pdf`, `coverletter.pdf`) as downloadable release assets via `softprops/action-gh-release@v2`.

---

## 4. Release Workflow Step-by-Step

Follow these steps to publish a new release:

### Step 1: Make and Verify Changes
Edit the relevant `.tex` files in `examples/resume/`, `examples/cv/`, or `examples/coverletter.tex`.
Test compilation locally:
```bash
make -B all
```
Verify page budgets:
* `coverletter.pdf`: 1 page
* `resume.pdf`: 2 pages
* `cv.pdf`: 2 pages

### Step 2: Commit Working Tree Changes
```bash
git add examples/ .gitignore
git commit -m "Update experience and align CV sections"
```

### Step 3: Push to Master
```bash
git push origin master
```

### Step 4: Tag the Release
Create an annotated semantic version tag:
```bash
git tag v1.0.1 -m "Release v1.0.1: Update experience and certifications"
```

### Step 5: Push the Tag to Trigger Release
```bash
git push origin v1.0.1
```

### Step 6: Monitor & Verify
1. Monitor workflow progress at:  
   `https://github.com/dikshie/Awesome-CV/actions`
2. Download and verify compiled PDF assets on the release page:  
   `https://github.com/dikshie/Awesome-CV/releases`

---

## 5. Local Assistant Tools & Git Configuration

* **`.gitignore` Rules**:
  * Local assistant metadata directories (`.claude/`, `.gemini/`, `.cursor/`, `.aider*`) are ignored to prevent leaking local assistant session state.
