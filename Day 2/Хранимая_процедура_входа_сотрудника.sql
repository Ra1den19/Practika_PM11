create procedure EnterSotrudnik
@Username nvarchar(50),
@Password nvarchar(50)
as
begin
if exists (select * from [������� ������ �����������] where ����� = @Username and ������ = @Password)
select 1 as Authenticated
else
select 0 as Authenticated
end;