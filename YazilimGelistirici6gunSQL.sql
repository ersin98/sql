--Select
Select * from Customers--Hepsini seçer
Select ContactName,CompanyName,City from Customers--adı verilen kolonları verir
--bunlar birer tablolardır
Select ContactName Adi,CompanyName SirketAdi,City Sehir from Customers--tabloların adını değiştirdik

Select * from Customers where City = 'London'--filtreleme yaptık.Şehri Londra olanları seçtik

sEleCt * FrOm proDucts--case insenstive   yani büyük harf küçük harf duyarsız.

Select * from Products where CategoryID=1--ticari sitelerdeki sınırlandırmalar gibi

Select * from Products where CategoryID=1 or CategoryID=3--iki seçenek seçilmiş versiyonu

Select * from Products where CategoryID=1 and UnitPrice>=10 --1 olan ve viyatı 10 dan büyük eşit olanlar

Select * from Products where CategoryID=1 and UnitPrice<>10 --1 olan ve fiyatı 10 olmayan

Select * from Products order by ProductName -- bütün ürünleri ürün ismine göre sırala

Select * from Products order by CategoryID --aynısının katagori ismine göre olan versiyonu 

Select * from Products order by CategoryID,ProductName--önceliği CategoryID olmak üere iki sıralama şekliberaber

Select * from Products order by UnitPrice--fiyata göre sırala defauld artan

Select * from Products order by UnitPrice asc--yine aynısı ama bu sefer biz belirttik. ascending

Select * from Products order by UnitPrice desc--azalan/düşen. decending

Select * from Products where CategoryID=1 order by UnitPrice desc--hem katagori seçtik hem de fiyatı düşen seçtik

Select count(*) from Products--kaç tane ürün olduğu sayısını al

Select count(*),ProductName from Products--bu yanlış bir kullanım. Hem sayısını ver hem ismi olmaaaaz

Select count(*) from Products where CategoryID=2--ütünlerin sayısını ver ama ID si 2 olanların

Select count(*) Adet from Products where CategoryID=2-- Yine isim eğiştirilebiliyor

--her katagorüden kaç tane ürün olduğunu göstermek istiyoruz 

Select CategoryID from Products group by CategoryID--bütün kategorileri tekrar etmeyecek biçimde listele
--her grup için arka planda bir katagori oluşturulur

Select CategoryID,count(*) from Products group by CategoryID--her grup için kaç tene olduğunun sayısı

Select CategoryID,count(*) Sayi from Products group by CategoryID--isim vermek sitedim


Select CategoryID,count(*) Sayi from Products group by CategoryID having count (*)<10 --having group by a konu olan kümelatif sorguya yazılır
--avg ortalaması, same toplamı

Select CategoryID,count(*) Sayi from Products where UnitPrice>20 group by CategoryID having count (*)<10--önce her zaman where çalışır
--daha fazla getirmesinin sebebi fiyat filtresi uygalayınca birim sayısının azalması ve 10 dan daha az birime sahip katagorinin artması

Select Products.ProductId, Products.ProductName, Products.UnitPrice,Categories.CategoryName--* yerine istediğimiz alanları yazdık
from Products inner join Categories--Product ve Categori tablolarını beraber getir
on Products.ProductID= Categories.CategoryID--CategoryID si üzerinden
--DTO Data Transformation object


Select Products.ProductId, Products.ProductName, Products.UnitPrice,Categories.CategoryName
from Products inner join Categories
on Products.ProductID= Categories.CategoryID
where Products.UnitPrice>10-- direkt UnitPrice yazsak da olabilirdi ama iki tabloda da olsaydı karışırdı. O yüzden açık açık yazıyoruz her şeyi.
--fiyatı 10 dan büyük olanlar için onu kategoriler ile goin et. ıd sini , ismini fiyatını ve catagori sinni getir.


--inner join iki tabloda da eşleşenleri bir araya getirir. Eşleşmeyenleri getirmez.

--Sadece eşleşen kayıtları getirir

Select * from Products p inner join [Order Details] od--tablo isminde boşluk olduğu için köşeli parantez içine aldık
on p.ProductID= od.ProductID

Select * from Products p left join [Order Details] od--solda olup sağda olmayanları da getir. Yani üründe olup hiç satışı yok
on p.ProductID= od.ProductID
--yine aynı sonucun gelmesinin sebebi tüm ürün türlerinden satış yapılmasıdır
--yani ürünlerde olup sipariş detayı olmayan yok


Select *from Customers c left join Orders o
on c.CustomerID= o.CustomerID
--müşterilerden sipariş vermeyenler var

Select *from Customers c left join Orders o
on c.CustomerID= o.CustomerID
where o.CustomerID is null--join olurken null geliyor ve biz de onu seçiyoruz
--sitelerdeki kişiye özel indirimi sağlayan bir sorgu. Kayıt olmuş ama hiç alışveriş yapmamış


Select *from Customers c right join Orders o--soldaki sağa yerine sağdaki sola
on c.CustomerID= o.CustomerID--ancak siparişi olup da müşterisi olmayan yok
--yani şuan right ile düz inner join arasında fark yok

Select *from Customers c right join Orders o
on c.CustomerID= o.CustomerID
where o.CustomerID is null--şuan hiç bir şey gelmez

Select * from  Orders o right join Customers c
on c.CustomerID = o.CustomerID
where o.CustomerID is null--şimdiyse null null null gelir.

--genelde inner join ile left join kullanılır. Anca çok fazla join den yeri değişmişse kullanılır.

Select * from Products p inner join [Order Details] od
on p.ProductID = od.ProductID
inner join Orders o--devamını getirmek için bir inner join daha
on o.OrderID=od.OrderID
