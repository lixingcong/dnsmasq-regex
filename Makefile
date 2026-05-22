BIN := dnsmasq/src/dnsmasq

PATCH_DIR  := patches
PATCHES    := $(sort $(wildcard $(PATCH_DIR)/*.patch))
PATCHED    := $(PATCH_DIR)/flag.patched

# turn on/off for regex or regex_ipset
DNSMASQ_COPTS="-DHAVE_REGEX -DHAVE_REGEX_IPSET -DHAVE_NFTSET"

all:$(BIN)
$(BIN): $(PATCHED)
	$(MAKE) submodule
	$(MAKE) remove_patched
	$(MAKE) reset_submodule

$(PATCHED):
	@for i in $(PATCHES); do \
		echo "Applying $$i"; \
		patch -p1 -d dnsmasq < $$i; \
		echo ""; done
	@touch $(PATCHED)

.PHONY: submodule
submodule:
	$(MAKE) -C dnsmasq COPTS=$(DNSMASQ_COPTS)

.PHONY: reset_submodule
reset_submodule:
	@git submodule foreach --recursive git reset --hard

.PHONY: remove_patched
remove_patched:
	@find . \( -name \*.orig -o -name \*.rej \) -delete
	@rm -rf $(PATCHED)

.PHONY: clean
clean:
	$(MAKE) -C dnsmasq clean
	$(MAKE) remove_patched
	$(MAKE) reset_submodule
