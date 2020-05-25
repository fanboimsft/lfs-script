#!/bin/bash
echo "Stripping"

/tools/bin/find /usr/lib -type f -name \*.a \
	-exec /tools/bin/strip --strip-debug {} ';'

/tools/bin/find /lib /usr/lib -type -f \( -name \*.so* -a ! -name \*dbg \) \
	-exec /tools/bin/strip --strip-unneeded {} ';'

/tools/bin/find /{bin,sbin} /usr/{bin,sbin,libexec} -type f \
	-exec /tools/bin/strip --strip-all {} ';'

rm -f /usr/lib/lib{bfd,opcodes}.a
rm -f /usr/lib/libbz2.a
rm -f /usr/lib/lib{com_err,e2p,ext2fs,ss}.a
rm -f /usr/lib/libltdl.a
rm -f /usr/lib/libfl.a
rm -f /usr/lib/libfl_pic.a
rm -f /usr/lib/libz.a

echo "All Done"
