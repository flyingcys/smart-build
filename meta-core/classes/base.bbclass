# 基础构建类
BB_DEFAULT_TASK ?= "build"

# 添加基础任务
addtask build
do_build[noexec] = "1"
do_build[recrdeptask] = "do_populate_sysroot do_deploy"

# 基础fetch任务
python base_do_fetch() {
    """获取源码"""
    src_uri = (d.getVar('SRC_URI') or "").split()
    if not src_uri:
        return
    
    fetcher = bb.fetch2.Fetch(src_uri, d)
    fetcher.download()
}

# 基础unpack任务
python base_do_unpack() {
    """解压源码"""
    src_uri = (d.getVar('SRC_URI') or "").split()
    if not src_uri:
        return
    
    fetcher = bb.fetch2.Fetch(src_uri, d)
    fetcher.unpack(d.getVar('WORKDIR'))
}

# 基础配置任务
do_configure() {
    :
}

# 基础编译任务
do_compile() {
    :
}

# 基础安装任务
do_install() {
    :
}

# 添加任务和依赖关系
addtask fetch
addtask unpack after do_fetch
addtask configure after do_unpack
addtask compile after do_configure
addtask install after do_compile

do_fetch[dirs] = "${DL_DIR}"
do_unpack[dirs] = "${WORKDIR}"
do_configure[dirs] = "${B}"
do_compile[dirs] = "${B}"
do_install[dirs] = "${B}"

# 为Python任务设置正确的函数
do_fetch[python] = "base_do_fetch"
do_unpack[python] = "base_do_unpack" 