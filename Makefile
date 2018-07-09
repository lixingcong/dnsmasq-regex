BIN := dnsmasq/src/dnsmasq

PATCH_DIR  := patches
PATCHES    := $(wildcard $(PATCH_DIR)/*.patch)
PATCHED    := $(patsubst $(PATCH_DIR)/%.patch, $(PATCH_DIR)/%.patched, $(PATCHES))

all:$(BIN)

$(BIN):$(PATCHED)
	cd dnsmasq && $(MAKE)
	$(MAKE) remove_patched
	$(MAKE) reset_submodule

%.patched:%.patch
	patch -p 1 -d dnsmasq < $^ && touch $@

.PHONY: reset_submodule
reset_submodule:
	git submodule foreach --recursive git reset --hard

.PHONY: remove_patched
remove_patched:
	find . \( -name \*.orig -o -name \*.rej \) -delete
	rm -rf $(PATCHED)

.PHONY: clean
clean:
	$(MAKE) -C dnsmasq clean
	$(MAKE) remove_patched
	$(MAKE) reset_submodule
