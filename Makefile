# Make commands for Dotfiles

DEPS := \
	git\
	curl\
	tar\
	zsh\
	sudo\

dependencies:
	@for p in $(DEPS); do \
		$(call isinstalled,$$p) || exit 1; \
	done

fmt:
	@shfmt --version
	@find . -maxdepth 3 -name '*.sh' | while read -r src; do shfmt -w -p "$$src"; done
	@find . -maxdepth 3 -name '*.zsh' | while read -r src; do shfmt -w "$$src"; done;

check: dependencies
	@curl -sL https://git.io/shcheck | bash -f -s -- \
		--ignore='./vim/vim.symlink/**/*' \
		--shellcheck-exclude=SC1071

ci: check
	./script/test

define isinstalled
hash $(1) >/dev/null 2>/dev/null || { echo >&2 "$(1) required but not found. Aborting."; exit 1; }
endef