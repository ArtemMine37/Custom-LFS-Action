export LFSDISK=/mnt/rootfs-lfs
export LFS=/mnt/lfs
export helloworld=${pwd}

# the env preparation script - pre compile

# Software preparations
echo "=> Preparing software..."
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install build-essential bison m4 perl gawk
# Partitions (won't use real block anyway)
echo "> Partitions"
echo "=> Make system partition first"
fallocate -l 20G $LFSDISK
mkfs.ext4 $LFSDISK
echo "=> Mounting..."
mount -v $LFSDISK $LFS
# Recreate directory structure - FROM LFS GUIDE
echo "> System"
echo "=> Directory structure creation"
mkdir -pv $LFS/{etc,var} $LFS/usr/{bin,lib,sbin}

for i in bin lib sbin; do
  ln -sv usr/$i $LFS/$i
done

case $(uname -m) in
  x86_64) mkdir -pv $LFS/lib64 ;;
esac

mkdir -pv $LFS/tools
echo "=> Creating lfs user..."
groupadd lfs
# Create a user with a "user" password
useradd -s /bin/bash -g lfs -m -p user -k /dev/null lfs
# Grant permissions to change LFS directory
chown -v lfs $LFS/{usr{,/*},lib,var,etc,bin,sbin,tools}
case $(uname -m) in
  x86_64) chown -v lfs $LFS/lib64 ;;
esac
# Scripts.
chown lfs lfs-configure-1.sh
chmod +x lfs-configure-1.sh
sudo -l lfs ./lfs-configure-1.sh
# The end.
echo "    [OK]"
# to be continued ig
