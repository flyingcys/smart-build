DESCRIPTION = "Base system files for RT-Smart"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

# 这是一个虚拟配方，提供基础系统支持
do_install() {
    # 创建基础目录结构
    install -d ${D}${sysconfdir}
    install -d ${D}${bindir}
    install -d ${D}${libdir}
    
    # 创建基础配置文件
    echo "RT-Smart Base System" > ${D}${sysconfdir}/rt-smart-release
}

# 提供基础包
PROVIDES = "base-files"
RPROVIDES:${PN} = "base-files"

# 包文件
FILES:${PN} = "${sysconfdir} ${bindir} ${libdir}" 