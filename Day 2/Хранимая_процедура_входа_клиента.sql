create procedure Enter
@Username nvarchar(50),
@Password nvarchar(50)
as
begin
if exists (select * from [Учетные данные клиентов] where логин = @Username and пароль = @Password)
select 1 as Authenticated
else
select 0 as Authenticated
end;