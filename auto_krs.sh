# Add debian buster
cat > /etc/apt/sources.list.d/debian.list <<'EOF'
deb [arch=amd64 signed-by=/usr/share/keyrings/debian-buster.gpg] http://deb.debian.org/debian buster main
deb [arch=amd64 signed-by=/usr/share/keyrings/debian-buster-updates.gpg] http://deb.debian.org/debian buster-updates main
deb [arch=amd64 signed-by=/usr/share/keyrings/debian-security-buster.gpg] http://deb.debian.org/debian-security buster/updates main
EOF
# 
# Add keys
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys DCC9EFBF77E11517 &> /dev/null
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 648ACFD622F3D138 &> /dev/null
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 112695A0E562B32A &> /dev/null
# 
apt-key export 77E11517 | gpg --dearmour -o /usr/share/keyrings/debian-buster.gpg &> /dev/null
apt-key export 22F3D138 | gpg --dearmour -o /usr/share/keyrings/debian-buster-updates.gpg &> /dev/null
apt-key export E562B32A | gpg --dearmour -o /usr/share/keyrings/debian-security-buster.gpg &> /dev/null
# 
# Prefer debian repo for chromium* packages only
# Note the double-blank lines between entries
cat > /etc/apt/preferences.d/chromium.pref << 'EOF'
Package: *
Pin: release a=eoan
Pin-Priority: 500
# 
# 
Package: *
Pin: origin "deb.debian.org"
Pin-Priority: 300
# 
# 
Package: chromium*
Pin: origin "deb.debian.org"
Pin-Priority: 700
EOF
# 
# 
apt-get update &> /dev/null
apt-get install chromium chromium-driver &> /dev/null
pip3 install selenium &> /dev/null
# 
sudo apt install tesseract-ocr &> /dev/null
pip install pytesseract &> /dev/null
pip install Pillow==9.1.1 &> /dev/null
git clone https://github.com/defittri01/auto-KRS.git &> /dev/null
# 
