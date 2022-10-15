/*Создание таблицы Product, 
которая будет содержать информацию о продуктах*/
CREATE TABLE Products
(
	Id INT PRIMARY KEY NOT NULL,--Столбец Id, первичный ключ, значение не может быть пустое или равно 0
	Name NVARCHAR(50) NOT NULL--Столбец Name, значение не может быть пустое или равно 0 
);

/* Вставка значений в таблицу Poducts*/
 INSERT INTO Products
 VALUES ( 1, 'Samsung Galaxy Note 8'),
		( 2, 'Safety glass for Samsung Galaxy Note 8'),
		( 3, 'Cover for Samsung  Galaxy Note 8');

/*Создание таблицы Categories, 
которая будет содержать информацию о категориях*/
CREATE TABLE Categories
(
	Id INT PRIMARY KEY NOT NULL,--Столбец Id, первичный ключ, значение не может быть пустое или равно 0
	Name NVARCHAR(25) NOT NULL--Столбец Name, значение не может быть пустое или равно 0 
 );

/* Вставка значений в таблицу Categories*/
 INSERT INTO Categories
 VALUES ( 1, 'Phones'),
		( 2, 'Covers'),
		( 3, 'Safety glasses');

/*Создание таблицы ProductCategories, 
которая будет содержать информацию о категориях продуктов*/
CREATE TABLE ProductCategories 
(
	ProductId INT FOREIGN KEY REFERENCES Products(Id) NOT NULL,--Столбец ProductId, внешний ключ связанный с таблицой Products, столбцом Id , значение не может быть пустое или равно 0
	CategoryId INT FOREIGN KEY REFERENCES Categories(Id),--Столбец CategotyId, внешний ключ связанный с таблицой Categories, столбцом Id
	PRIMARY KEY (ProductId, CategoryId)--Обозначить столбцы ProductId и CategoryId первичным ключом
);

/* Вставка значений в таблицу Categories*/
INSERT INTO ProductCategories
VALUES ( 1, 1),
	   ( 2, 3),
	   ( 3, 2);

SELECT P.Name as 'Название продукта', C.Name as 'Категория продукта'--Выбор столбцов Name из таблиц Products и Categories
FROM Products P--Из таблицы Products
LEFT JOIN ProductCategories PC
	ON P.Id = PC.ProductId--Присоединение соединение таблиц Products и ProductCategories по столбцу Id
 JOIN Categories C
	ON PC.CategoryId = C.Id;--Присоединение соединение таблиц ProductCategories и Categories по столбцу Id