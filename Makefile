VIM=$(shell which vim)

YCM=$(wildcard plugged/youcompleteme)

.PHONY: $(YCM)

$(YCM):
	cd $@ && python install.py

default: $(YCM)
	$(VIM) -c "PlugUpgrade | PlugInstall | PlugUpdate"
