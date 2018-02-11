VIM=$(shell which vim)
VIMRC=$(wildcard vimrc)

YCM=$(wildcard plugged/youcompleteme)

default:
	$(VIM) -Nu $(VIMRC) -c "PlugUpgrade | PlugInstall | PlugUpdate | qa!"

$(YCM):
	cd $@ && python install.py

all: default $(YCM)

.PHONY: $(YCM)
