.PHONY: swinful

CC = xelatex
swinful_DIR = swinful
RESUME_DIR = swinful/resume
CV_DIR = swinful/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

swinful: $(foreach x, coverletter cv resume, $x.pdf)

resume.pdf: $(swinful_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(swinful_DIR) $<

cv.pdf: $(swinful_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(swinful_DIR) $<

coverletter.pdf: $(swinful_DIR)/coverletter.tex
	$(CC) -output-directory=$(swinful_DIR) $<

clean:
	rm -rf $(swinful_DIR)/*.pdf
