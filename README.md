# MogDB/openGauss 系数据库工具集容器

## 支持的工具

`gsql`(默认), `gs_dump`, `gs_dumpall`, `gs_basebackup`, `gs_probackup`, `gs_restore`

## 支持的平台

- `linux/arm64`
- `linux/amd64`

## 使用方式

### gsql (默认)

- Linux

```bash
alias gsql="docker run --rm -it --net host vimiix/gsql"
gsql -h<IP> -p<PORT> -U<USER> -d<DBNAME>
```

- Windows

```Powershell
# 打开 $PROFILE 文件，不存在需要先创建
notepad.exe $PROFILE

# 然后在文件中添加如下函数
function gsql {
    param (
        [string[]]$args
    )
    & "docker" run --rm -it --net host vimiix/gsql $args
}
# 保存即可直接通过 gsql 使用

gsql -h<IP> -p<PORT> -U<USER> -d<DBNAME>
```

如果要使用其他工具可在镜像名后追加具体的工具名称调用

```bash
docker run --rm -it --net host vimiix/gsql gs_dump
```
