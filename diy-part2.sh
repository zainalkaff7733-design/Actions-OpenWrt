# 1. تغيير الأيبي الافتراضي للدخول للراوتر إلى 192.168.10.1 (لتجنب التعارض مع المايكروتك)
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# 2. تعديل إعدادات الشبكة الافتراضية لقفل الـ DHCP والـ IPv6 تلقائياً لمنع اللوب وقفل الشبكات
cat << 'EOF' >> package/base-files/files/etc/config/dhcp
config dhcp 'lan'
	option interface 'lan'
	option start '100'
	option limit '150'
	option leasetime '12h'
	option ignore '1'

config odhcpd 'lan'
	option maindhcp '0'
	option mode 'disabled'
EOF

# 3. إضافة حزم ومميزات إضافية لدعم معالج MT7621 الخاص بجهاز KT708
echo "CONFIG_PACKAGE_luci-app-ttyd=y" >> .config
echo "CONFIG_PACKAGE_luci-app-watchcat=y" >> .config
