SUBDIRS = setfiles semanage load_policy newrole run_init sandbox secon audit2allow audit2why scripts sestatus semodule_package semodule semodule_link semodule_expand semodule_deps setsebool po

INOTIFYH = $(shell ls /usr/include/$(shell dpkg-architecture -qDEB_HOST_MULTIARCH)/sys/inotify.h 2>/dev/null)

ifneq (${INOTIFYH},)
	SUBDIRS += restorecond
endif

SUBDIRS += restorecond mcstrans

all install relabel clean indent:
	@for subdir in $(SUBDIRS); do \
		(cd $$subdir && $(MAKE) $@) || exit 1; \
	done

test:
