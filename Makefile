.PHONY: all examples resume cv coverletter resume_finance cv_finance coverletter_finance finance clean docker-build docker-all docker-resume docker-cv docker-coverletter docker-finance docker-clean

CC = xelatex
EXAMPLES_DIR = examples
RESUME_DIR = examples/resume
CV_DIR = examples/cv
FINANCE_DIR = examples/finance
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')
FINANCE_SRCS = $(shell find $(FINANCE_DIR) -name '*.tex')

# Docker configuration
DOCKER_IMAGE ?= awesome-cv:latest
DOCKER_RUN = docker run --rm -u $$(id -u):$$(id -g) -v "$$(pwd)":/workdir $(DOCKER_IMAGE)

all: examples

examples: $(foreach x, coverletter cv resume coverletter_finance cv_finance resume_finance, $(EXAMPLES_DIR)/$x.pdf)

resume: $(EXAMPLES_DIR)/resume.pdf
cv: $(EXAMPLES_DIR)/cv.pdf
coverletter: $(EXAMPLES_DIR)/coverletter.pdf

resume_finance: $(EXAMPLES_DIR)/resume_finance.pdf
cv_finance: $(EXAMPLES_DIR)/cv_finance.pdf
coverletter_finance: $(EXAMPLES_DIR)/coverletter_finance.pdf
finance: cv_finance resume_finance coverletter_finance

$(EXAMPLES_DIR)/resume.pdf: $(EXAMPLES_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

$(EXAMPLES_DIR)/cv.pdf: $(EXAMPLES_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

$(EXAMPLES_DIR)/coverletter.pdf: $(EXAMPLES_DIR)/coverletter.tex
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

$(EXAMPLES_DIR)/resume_finance.pdf: $(EXAMPLES_DIR)/resume_finance.tex $(FINANCE_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

$(EXAMPLES_DIR)/cv_finance.pdf: $(EXAMPLES_DIR)/cv_finance.tex $(FINANCE_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

$(EXAMPLES_DIR)/coverletter_finance.pdf: $(EXAMPLES_DIR)/coverletter_finance.tex
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

clean:
	rm -rf $(EXAMPLES_DIR)/*.pdf $(EXAMPLES_DIR)/*.aux $(EXAMPLES_DIR)/*.log $(EXAMPLES_DIR)/*.out $(EXAMPLES_DIR)/*.xdv $(EXAMPLES_DIR)/*.fls $(EXAMPLES_DIR)/*.fdb_latexmk

docker-build:
	docker build -t $(DOCKER_IMAGE) .

docker-all:
	$(DOCKER_RUN) all

docker-resume:
	$(DOCKER_RUN) resume

docker-cv:
	$(DOCKER_RUN) cv

docker-coverletter:
	$(DOCKER_RUN) coverletter

docker-clean:
	$(DOCKER_RUN) clean
