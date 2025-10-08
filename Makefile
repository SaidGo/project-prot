.PHONY: tidy build run ps stop srv-tidy srv-build srv-run srv-ps srv-stop

# Корневые цели просто проксируют в сервис users-service
tidy: srv-tidy
build: srv-build
run: srv-run
ps: srv-ps
stop: srv-stop

# Цели конкретно для сервиса users-service
srv-tidy:
	@$(MAKE) -C services/users-service tidy

srv-build:
	@$(MAKE) -C services/users-service build

srv-run:
	@$(MAKE) -C services/users-service run

srv-ps:
	@$(MAKE) -C services/users-service ps

srv-stop:
	@$(MAKE) -C services/users-service stop
