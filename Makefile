.PHONY: bootstrap doctor up down status logs reset test cloud-validate
bootstrap: ; ./scripts/c2lab bootstrap
doctor: ; ./scripts/c2lab doctor
up: ; ./scripts/c2lab up
down: ; ./scripts/c2lab down
status: ; ./scripts/c2lab status
logs: ; ./scripts/c2lab logs
reset: ; ./scripts/c2lab reset
test: ; ./scripts/c2lab test
cloud-validate: ; ./scripts/c2lab cloud-validate
