.PHONY: all examples resume cv coverletter clean

CC = xelatex
EXAMPLES_DIR = examples
RESUME_DIR = examples/resume
CV_DIR = examples/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

all: examples

examples: $(foreach x, coverletter cv resume, $(EXAMPLES_DIR)/$x.pdf)

resume: $(EXAMPLES_DIR)/resume.pdf
cv: $(EXAMPLES_DIR)/cv.pdf
coverletter: $(EXAMPLES_DIR)/coverletter.pdf

$(EXAMPLES_DIR)/resume.pdf: $(EXAMPLES_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

$(EXAMPLES_DIR)/cv.pdf: $(EXAMPLES_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

$(EXAMPLES_DIR)/coverletter.pdf: $(EXAMPLES_DIR)/coverletter.tex
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

clean:
	rm -rf $(EXAMPLES_DIR)/*.pdf $(EXAMPLES_DIR)/*.aux $(EXAMPLES_DIR)/*.log $(EXAMPLES_DIR)/*.out $(EXAMPLES_DIR)/*.xdv $(EXAMPLES_DIR)/*.fls $(EXAMPLES_DIR)/*.fdb_latexmk
