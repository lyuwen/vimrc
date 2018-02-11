VIM=$(shell which vim)
VIMRC=$(wildcard vimrc)

YCM=$(wildcard plugged/youcompleteme)

all: default

.PHONY: $(YCM)

$(YCM):
	cd $@ && python install.py

default: $(YCM)
	$(VIM) -Nu $(VIMRC) -c "PlugUpgrade | PlugInstall | PlugUpdate | qa!"
