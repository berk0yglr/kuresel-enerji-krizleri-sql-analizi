# 🛢️ Global Energy Crisis & Macroeconomic Impact Analysis (SQL)

## 📌 Proje Hakkında
Bu proje, küresel çapta yaşanan jeopolitik krizlerin ve çatışmaların, ham petrol fiyatlarına, ülkelerin enflasyon risklerine ve bölgesel ekonomilere (Büyüme/Borsa) olan etkilerini analiz eden bir veri bilimi/analitiği çalışmasıdır. Proje kapsamında parçalı halde bulunan ekonomik ve tarihi veriler, İlişkisel Veritabanı (RDBMS) mimarisine uygun olarak modellenmiş ve SQL ile analiz edilmiştir.

## 🛠️ Kullanılan Teknolojiler ve Yetenekler
* **Veritabanı:** MS SQL Server (SSMS)
* **SQL Yetenekleri:** `CTE (Common Table Expressions)`, `INNER/LEFT JOIN`, `CROSS JOIN`, `GROUP BY`, `Aggregate Functions (AVG, COUNT, ROUND)`, `CASE WHEN`, `Subqueries`.
* **Veri Modelleme:** Primary Key / Foreign Key ilişkileri, Veri Tipi Optimizasyonu.

## 🗂️ Veritabanı Şeması
Analiz için 4 ana tablo kullanılmış ve bu tablolar birbiriyle ilişkilendirilmiştir:
1. `ulke_etkisi`: Ülkelerin makroekonomik göstergeleri (GDP düşüşü, Borsa kayıpları, Enflasyon riski).
2. `benzin_fiyat_karsilatirmasi`: Savaş öncesi ve sonrası ülkeler bazında pompa fiyatları ve artış oranları.
3. `savas_zaman_cizelgesi`: Kriz döneminde yaşanan önemli diplomatik ve askeri olayların günlüğü.
4. `gunluk_ham_petrol`: Günlük Brent ve WTI ham petrol fiyatları ve değişim yüzdeleri.

---

## 📊 Analiz Soruları ve Çıktılar

### 1. Krizin Pompaya Yansıması ve İthalat Bağımlısı Ülkelerin Durumu
**Soru:** Petrol ithalatına yüksek oranda bağımlı olan ülkeler bu fiyat şokundan nasıl etkilendi?
* `LEFT JOIN` ve `CASE WHEN` kullanılarak veriler kategorize edildi.
* **İçgörü:** İthalata tam bağımlı ülkelerde (Örn: Pakistan, Türkiye, Sri Lanka) fiyat artışlarının %100'lerin çok üzerine çıktığı ve enflasyon riskinin "Very High" seviyesine ulaştığı gözlemlendi.

### 2. Savaşın Petrol Fiyatlarına Günlük Etkisi (Tetikleyici Olaylar)
**Soru:** Hangi jeopolitik veya ekonomik olaylar Brent petrol fiyatlarında %100'den fazla sıçramaya neden oldu?
* Olay günlüğü ve petrol fiyatları tabloları `Date` bazlı `INNER JOIN` ile birleştirildi.
* **İçgörü:** "Qatar Gas Halt" (Katar'ın gaz akışını durdurması) ve "Talks Collapse" (Görüşmelerin çökmesi) gibi spesifik olayların yaşandığı günlerde petrol fiyatlarında panik alımlarıyla devasa sıçramalar yaşandığı tespit edildi.

### 3. Bölgesel Hasar Raporu (Makroekonomik Çöküş)
**Soru:** Kıtalar ve bölgeler bazında ekonomik olarak en ağır darbeyi kimler aldı?
* Veriler `Region` bazında `GROUP BY` ile kümelenerek `AVG` ve `ROUND` fonksiyonlarıyla özetlendi.
* **İçgörü:** Tedarik zinciri kırılmaları ve enerji maliyetleri yüzünden bazı bölgelerin ortalama borsa kayıplarının -%45 seviyelerine ulaştığı ve ciddi bir ekonomik daralma (GDP küçülmesi) yaşandığı görüldü.

### 4. "Kırmızı Alarm" Veren Ülkelerin Tespiti
**Soru:** Küresel ortalama zam oranının **üzerinde** zam yiyen ve enflasyon riski yüksek olan ülkeler hangileridir?
* `CTE (WITH bloğu)` kullanılarak tüm dünyanın ortalama fiyat artış yüzdesi dinamik olarak hesaplandı. Ardından `CROSS JOIN` ile bu ortalama ana sorguya dahil edilerek ortalamanın üstünde kalan ve enflasyon riski kritik olan ülkeler filtrelendi.
* **İçgörü:** Krizin merkez üssünde yer alan ve ekonomik kırılganlığı en yüksek olan hedef ülkeler dinamik bir metrikle başarıyla listelendi.

---

## 🚀 Nasıl Çalıştırılır?
1. Repoda bulunan `.sql` dosyasını indirin.
2. SQL Server Management Studio (SSMS) üzerinden kendi veritabanınızı oluşturup ilgili tabloları (Excel/CSV üzerinden) içeri aktarın.
3. Dosya içindeki sorguları sırasıyla çalıştırarak analiz sonuçlarını görüntüleyebilirsiniz.

*Bu proje, makroekonomik verilerin SQL ile nasıl anlamlı iş kararlarına ve içgörülere dönüştürülebileceğini göstermek amacıyla hazırlanmıştır.*
