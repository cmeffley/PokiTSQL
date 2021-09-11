--1
Select *
From Grade

--2
Select *
From Emotion

--3
Select count(*) as [Total # of Poems]
From Poem

--4
Select Top 76 Name
From Author
Order By Name ASC

--5
Select Top 76 a.Name as [Author Name], g.Name Grade
From Author a
	JOIN Grade g
	ON a.GradeId = g.Id
Order By a.Name ASC

--6
Select Top 76 a.Name as [Author Name], g.Name Gender
From Author a
	JOIN Gender g
	ON a.GenderId = g.Id
Order By a.Name ASC

--7
Select sum(WordCount) as [Total # of Words in all poems combined]
From Poem	

--8
Select Top 1 *
From Poem
Order By CharCount ASC

--9
Select count(*) as [# of Authors in the 3rd Grade]
From Author a
	JOIN Grade g
	ON a.GradeId = g.Id
Where g.Name = '3rd Grade'

--10
Select count(*) as [Authors in the first, second or third grades]
From Author a
	JOIN Grade g
	ON a.GradeId = g.Id
Where g.Name = '1st Grade' OR g.Name = '2nd Grade' OR g.Name = '3rd Grade'


--11
Select count(*) as [Total # of Poems by 4th Graders]
From Grade g
	JOIN Author a
	ON g.Id = a.GradeId
	JOIN Poem p
	ON a.Id = p.AuthorId
Where g.Id = 4

--12
Select g.Name Grade, count(*) as [# of Poems by each grade]
From Grade g
	JOIN Author a
	ON g.Id = a.GradeId
	JOIN Poem p
	ON a.Id = p.AuthorId
Group By g.Name

--13
Select g.Name Grade, count(*) as [# of Authors]
From Author a
	JOIN Grade g
	ON a.GradeId = g.Id
Group by g.Name

--14
Select Top 1 Title, WordCount
From Poem
Order By WordCount DESC

--15
Select Top 1 a.Id, a.Name, count(*) as [# of Poems]
From Poem p
	JOIN Author a
	ON p.AuthorId = a.Id
Group by a.Id, a.Name
Order By [# of Poems] DESC

--16
Select count(*) as [# of Sad Poems]
From PoemEmotion p
	JOIN Emotion e
	ON p.EmotionId = e.Id
Where e.Name = 'Sadness'

--17
Select count(*) as [# of Poems Not Associated with an Emotion]
From PoemEmotion
Where EmotionId IS Null

--18
Select Top 1 e.Name Emotion, count(*) as [# of Poems]
From Emotion e
	JOIN PoemEmotion p
	ON e.Id = p.EmotionId
Group By e.Name

--19
Select Top 1 g.Name, count(*) as [Joyous Poems]
From Emotion e
	JOIN PoemEmotion pe
	ON e.Id = pe.EmotionId
	JOIN Poem p
	ON pe.PoemId = p.Id
	JOIN Author a
	ON p.AuthorId = a.Id
	JOIN Grade g
	ON a.GradeId = g.Id
Where e.Name = 'Joy'
Group By g.Name
Order By [Joyous Poems] DESC

--20
Select Top 1 g.Name Gender, count (*) as [Fearful Poems]
From Emotion e
	JOIN PoemEmotion pe
	ON e.Id = pe.EmotionId
	JOIN Poem p
	ON pe.PoemId = p.Id
	JOIN Author a
	ON p.AuthorId = a.Id
	JOIN Gender g
	ON a.GenderId = g.Id
Where e.Name = 'Fear'
Group By g.Name
Order By [Fearful Poems] ASC
