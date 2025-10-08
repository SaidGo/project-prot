# 🧩 Users Service

gRPC-микросервис для управления пользователями.

## 📦 Структура проекта

```
services/users-service/
├── cmd/server/main.go         # Точка входа
├── internal/
│   ├── database/db.go         # Инициализация БД
│   ├── user/                  # ORM, Repository, Service
│   └── transport/grpc/        # gRPC handler + server
├── proto/                     # Контракты (из project-protos)
└── users.db                   # SQLite база
```

## 🚀 Запуск

```bash
cd services/users-service
go mod tidy
make build
./bin/users-server
```

Сервер стартует на `:50051`.

## 🧪 Проверка через grpcurl

```bash
grpcurl -plaintext -d '{"email":"alice@example.com","name":"Alice"}' localhost:50051 user.UserService/CreateUser
grpcurl -plaintext -d '{"id":"1"}' localhost:50051 user.UserService/GetUser
```

## 🧱 Используемые технологии

- Go 1.22+
- gRPC
- GORM (SQLite)
- Protocol Buffers
