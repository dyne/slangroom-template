.DEFAULT_GOAL := check
BIN_DIR     ?= bin
EXEC_NAME   ?= slangroom-exec
EXEC_PATH   := $(BIN_DIR)/$(EXEC_NAME)

.PHONY: install-slangroom-exec check-mise

check-mise:
	if command -v mise >/dev/null 2>&1; then \
		echo "✔️  mise is installed"; \
	else \
		echo "⚠️  mise is not installed - we really push to:"; \
		echo "https://mise.jdx.dev/getting-started.html#installing-mise-cli"; \
	fi

# Ensure the bin directory exists (only runs if missing)
$(BIN_DIR):
	mkdir -p $@

install-slangroom-exec: $(BIN_DIR) check-mise
	@echo "→ Ensuring '$(EXEC_NAME)' is at '$(EXEC_PATH)'…"
	@if [ -x "$(EXEC_PATH)" ]; then \
		echo "✔️  '$(EXEC_PATH)' already exists."; \
	elif command -v $(EXEC_NAME) >/dev/null 2>&1; then \
		echo "✔️  Found '$(EXEC_NAME)' in your PATH."; \
	elif command -v mise >/dev/null 2>&1; then \
		echo "⚙️  Installing via mise…"; \
	 	mise i ; \
	 	mise activate ; \
	else \
		echo "⬇️  Downloading binary…"; \
		wget \
		  "https://github.com/dyne/$(EXEC_NAME)/releases/latest/download/slexfe" \
		  -O "$(BIN_DIR)/slexfe"; \
		chmod +x "$(BIN_DIR)/slexfe"; \
		wget \
		  "https://github.com/dyne/$(EXEC_NAME)/releases/latest/download/$(EXEC_NAME)-$$(uname)-$$(uname -m)" \
		  -O "$(EXEC_PATH)"; \
		chmod +x "$(EXEC_PATH)"; \
		echo "✔️  Downloaded to '$(EXEC_PATH)'."; \
	fi
	@echo "→ Using '$(EXEC_NAME)' version:"  
	@if [ -x "$(EXEC_PATH)" ]; then \
		"$(EXEC_PATH)" -v; \
	else \
		$(EXEC_NAME) -v; \
	fi

check: install-slangroom-exec
	./bats/bin/bats test.bats
