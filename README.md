# openGauss 系数据库 gsql 工具容器

## 支持的工具

`gsql`(默认), `gs_dump`, `gs_dumpall`, `gs_basebackup`, `gs_probackup`, `gs_restore`

## 支持的平台

- `arm64`
- `amd64`

## 使用方式

- gsql (默认)

```bash
alias gsql="docker run --rm -it vimiix/gsql"
gsql -h<IP> -p<PORT> -U<USER> -d<DBNAME>
```

如果要使用其他工具可直接追加命令调用

```bash
docker run --rm -it vimiix/gsql gs_dump ...
```

## 说明

- 镜像名称就叫 `gsql`，不想改
