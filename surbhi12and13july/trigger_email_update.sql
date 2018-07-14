DELIMITER $$
create trigger on_email_update 
BEFORE UPDATE ON ttn_jdbc.users
FOR EACH ROW
BEGIN
set @new_name=new.username;
SET @old_name=old.username;
if @new_name != @old_name then
insert into audit_user values(@old_name,@new_name);
end if;
END
$$
DELIMITER ;
