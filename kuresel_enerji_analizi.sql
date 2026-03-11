use petrolarchive
--1.Krizin Pompaya Yansýmasý ve Ýthalat Baðýmlýsý Ülkelerin Durumu---
select * from dbo.benzin_fiyat_karsilatirmasi
select * from dbo.ulke_etkisi
select
	b.Country
   ,b.Region
   ,u.Inflation_Risk
   ,b.Before_War_USD
   ,b.Mar7_USD
   ,b.Pct_Increase
,case 
	  when Oil_Import_Dep='Low' then 'Baðýmsýz'
	  when Oil_Import_Dep='Medium'  then 'Yarý Baðýmlý'
	  when Oil_Import_Dep='High' then 'Tam Baðýmlý'
 END AS Bagimlilik_Durumu
from dbo.benzin_fiyat_karsilatirmasi b
left join dbo.ulke_etkisi u
	ON b.Country= u.Country
where Oil_Import_Dep='High'
order by Pct_Increase desc 

--2.Savaþýn Petrol Fiyatlarýna Günlük Etkisi--
select * from dbo.savas_zaman_cizelgesi
select * from dbo.gunluk_ham_petrol
select 
	 s.Date
	,s.Event
	,s.Location
	,g.Brent_Change_Pct
	,g.Phase
from dbo.savas_zaman_cizelgesi s
inner join dbo.gunluk_ham_petrol g  on s.Date=g.Date
where Brent_Change_Pct >100
order by Brent_Change_Pct desc

--3.Bölgesel Hasar Raporu--

select * from dbo.ulke_etkisi 
 
select
 Region
,COUNT(Country) as Toplam_ülke_sayisi
,ROUND(AVG(GDP_Impact_PCT),2) as gdp_ortalamasi
,ROUND(AVG(Stock_Market_Change),2) as ortalama_borsa
from dbo.ulke_etkisi
group by Region 
order by gdp_ortalamasi desc


--4.Küresel Ortalamanýn Üzerinde Zam Yiyen Ülkeler--

select *from  benzin_fiyat_karsilatirmasi

WITH benzin_ort as (
		 Select
		 AVG(Pct_Increase) as ortalama
		 from dbo.benzin_fiyat_karsilatirmasi
		
)
Select 
    b.Country
   ,u.Inflation_Risk
   ,b.Pct_Increase
from dbo.benzin_fiyat_karsilatirmasi as b
Inner join dbo.ulke_etkisi as u 
   ON  b.Country=u.Country
cross join benzin_ort as bo
where b.Pct_Increase > bo.ortalama and u.Inflation_Risk in ('Very High' , 'High')
Order by b.Pct_Increase desc;
