# project-protos

Общий репозиторий protobuf-контрактов для микросервисов **Users** и **Tasks**.

## Структура
```
proto/
  user/user.proto
  task/task.proto
scripts/
  install_protoc_msys.sh
Makefile
go.mod
.gitignore
```

## Требования
- MSYS2/MINGW64 окружение
- `protoc` (Protocol Buffers Compiler) в PATH
- Go 1.22+
- Плагины:
  - `google.golang.org/protobuf/cmd/protoc-gen-go`
  - `google.golang.org/grpc/cmd/protoc-gen-go-grpc`

## Установка protoc (MSYS2)
```bash
pacman -S --noconfirm --needed mingw-w64-x86_64-protobuf
protoc --version
```

## Генерация
```bash
make tools
make generate
```

## Очистка
```bash
make clean
```

## Проверка
```bash
make verify
```
