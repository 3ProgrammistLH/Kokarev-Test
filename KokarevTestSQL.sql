/*�������� ������� Product, 
������� ����� ��������� ���������� � ���������*/
CREATE TABLE Products
(
	Id INT PRIMARY KEY NOT NULL,--������� Id, ��������� ����, �������� �� ����� ���� ������ ��� ����� 0
	Name NVARCHAR(50) NOT NULL--������� Name, �������� �� ����� ���� ������ ��� ����� 0 
);

/* ������� �������� � ������� Poducts*/
 INSERT INTO Products
 VALUES ( 1, 'Samsung Galaxy Note 8'),
		( 2, 'Safety glass for Samsung Galaxy Note 8'),
		( 3, 'Cover for Samsung  Galaxy Note 8');

/*�������� ������� Categories, 
������� ����� ��������� ���������� � ����������*/
CREATE TABLE Categories
(
	Id INT PRIMARY KEY NOT NULL,--������� Id, ��������� ����, �������� �� ����� ���� ������ ��� ����� 0
	Name NVARCHAR(25) NOT NULL--������� Name, �������� �� ����� ���� ������ ��� ����� 0 
 );

/* ������� �������� � ������� Categories*/
 INSERT INTO Categories
 VALUES ( 1, 'Phones'),
		( 2, 'Covers'),
		( 3, 'Safety glasses');

/*�������� ������� ProductCategories, 
������� ����� ��������� ���������� � ���������� ���������*/
CREATE TABLE ProductCategories 
(
	ProductId INT FOREIGN KEY REFERENCES Products(Id) NOT NULL,--������� ProductId, ������� ���� ��������� � �������� Products, �������� Id , �������� �� ����� ���� ������ ��� ����� 0
	CategoryId INT FOREIGN KEY REFERENCES Categories(Id),--������� CategotyId, ������� ���� ��������� � �������� Categories, �������� Id
	PRIMARY KEY (ProductId, CategoryId)--���������� ������� ProductId � CategoryId ��������� ������
);

/* ������� �������� � ������� Categories*/
INSERT INTO ProductCategories
VALUES ( 1, 1),
	   ( 2, 3),
	   ( 3, 2);

SELECT P.Name as '�������� ��������', C.Name as '��������� ��������'--����� �������� Name �� ������ Products � Categories
FROM Products P--�� ������� Products
LEFT JOIN ProductCategories PC
	ON P.Id = PC.ProductId--������������� ���������� ������ Products � ProductCategories �� ������� Id
 JOIN Categories C
	ON PC.CategoryId = C.Id;--������������� ���������� ������ ProductCategories � Categories �� ������� Id