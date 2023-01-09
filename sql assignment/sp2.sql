EXEC [dbo].[crud] @department_name='ITTT',@location_id=5 ,@Choice='insert'

EXEC [dbo].[crud] @department_id=13, @department_name='development & skill',@location_id=5 ,@Choice='update'

EXEC [dbo].[crud]  @department_id=13 ,@Choice='delete'

select * from department