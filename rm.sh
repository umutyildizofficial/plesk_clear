#!/bin/bash

# Renkli metinler için ANSI renk kodları
GREEN='\033[1;33m'
RED='\033[1;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # Renk sıfırlama

# Ekranı temizle
clear

# Başlık
echo -e "${YELLOW}UMUT YILDIZ${NC} - LICENSE ADDS CLEAR"

# /etc/cron.d/ içindeki ossav isimli dosyayı sil
if [ -f /etc/cron.d/ossav ]; then
    echo -e "${YELLOW}1. Adım:${NC} /etc/cron.d/ossav dosyasını siliniyor..."
    rm /etc/cron.d/ossav
    echo -e "   -> /etc/cron.d/ossav başarıyla silindi."
else
    echo -e "   -> ${RED}/etc/cron.d/ossav dosyası bulunamadı.${NC}"
fi

# 1 saniye bekleyin
sleep 1

# /usr/local/psa/admin/htdocs/modules klasörünün içinde OsSav klasörünü sil
if [ -d /usr/local/psa/admin/htdocs/modules/OsSav ]; then
    echo -e "${YELLOW}2. Adım:${NC} /usr/local/psa/admin/htdocs/modules/OsSav klasörü siliniyor..."
    rm -rf /usr/local/psa/admin/htdocs/modules/OsSav
    echo -e "   -> /usr/local/psa/admin/htdocs/modules/OsSav klasörü başarıyla silindi."
else
    echo -e "   -> ${RED}/usr/local/psa/admin/htdocs/modules/OsSav klasörü bulunamadı.${NC}"
fi

# 1 saniye bekleyin
sleep 1

# /usr/local/psa/admin/cp/public/javascript içinde main.js dosyasındaki belirli metni ve altındaki satırları sil
JS_FILE="/usr/local/psa/admin/cp/public/javascript/main.js"
SEARCH_TEXT="\/\*\* OsSav v1.98 \*\*\/"
if [ -f "$JS_FILE" ]; then
    echo -e "${YELLOW}3. Adım:${NC} $JS_FILE dosyasındaki belirli metin ve altındaki satırlar siliniyor..."
    sed -i "/$SEARCH_TEXT/,/^\s*$/d" "$JS_FILE"
    echo -e "   -> $JS_FILE dosyasındaki belirli metin ve altındaki satırlar başarıyla silindi."
else
    echo -e "   -> ${RED}$JS_FILE dosyası bulunamadı.${NC}"
fi

# 1 saniye bekleyin
sleep 1

# /usr/local/psa/admin/plib/modules klasöründeki OsSav klasörünü sil
if [ -d /usr/local/psa/admin/plib/modules/OsSav ]; then
    echo -e "${YELLOW}4. Adım:${NC} /usr/local/psa/admin/plib/modules/OsSav klasörü siliniyor..."
    rm -rf /usr/local/psa/admin/plib/modules/OsSav
    echo -e "   -> /usr/local/psa/admin/plib/modules/OsSav klasörü başarıyla silindi."
else
    echo -e "   -> ${RED}/usr/local/psa/admin/plib/modules/OsSav klasörü bulunamadı.${NC}"
fi

# 1 saniye bekleyin
sleep 1

# service psa restart ile Plesk servisini yeniden başlat
echo -e "${YELLOW}5. Adım:${NC} Plesk servisi yeniden başlatılıyor..."
service psa restart
echo -e "   -> Plesk servisi başarıyla yeniden başlatıldı."

echo -e "${GREEN}İşlem tamamlandı.${NC}"
