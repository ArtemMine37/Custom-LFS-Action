# Set up the bash profile we'll log in to 
cat > ~/.bash_profile << "EOF"
exec env -i HOME=$HOME TERM=$TERM PS1='[\u@\w\]$ ' /bin/bash
EOF
# Now the shell
cat > ~/.bashrc << "EOF"
set +h
umask 022
LFS=/mnt/lfs
LC_ALL=POSIX
LFS_TGT=$(uname -m)-linux-gnu
PATH=/usr/bin
export MAKEFLAGS=-j$(nproc)
if [ ! -L /bin ]; then PATH=/bin:$PATH; fi
PATH=$LFS/tools/bin:$PATH
CONFIG_SITE=$LFS/usr/share/config.site
export LFS LC_ALL LFS_TGT PATH CONFIG_SITE
EOF
# Now, we should be ready to extract and compile a bunch of stuff.
