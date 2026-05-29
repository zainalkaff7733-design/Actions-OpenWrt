# حذف المصدر الافتراضي وإضافة مصدر ImmortalWrt المستقر
sed -i 's/^src-git/src-git/g' feeds.conf.default
echo 'src-git-full immortalwrt https://github.com' >> feeds.conf.default
