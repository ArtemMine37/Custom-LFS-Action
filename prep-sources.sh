export LFS="/mnt/lfs" # Prepare the LFS directory
echo "=> Downloading package sources..."
mkdir -v $LFS/sources # Make the directory
chmod -v a+wt $LFS/sources
wget --input-file=download --continue --directory-prefix=$LFS/sources # Needs wget to be installed
echo "  [OK]" # no package verification - only hardcore
# Chroot-prep
echo "   [OK]"
