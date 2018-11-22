VIM     = $(shell which vim)
VIMRC   = $(wildcard vimrc)
PYTHON ?= $(shell which python)

YCM     = $(wildcard plugged/youcompleteme)

default:
	$(VIM) -Nu $(VIMRC) -c "PlugUpgrade | PlugInstall | PlugUpdate | qa!"

$(YCM):
	cd $@ && $(PYTHON) install.py

all: default $(YCM)

.PHONY: $(YCM)
