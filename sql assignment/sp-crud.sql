USE [MangementSystem]
GO
/****** Object:  StoredProcedure [dbo].[crud]    Script Date: 02/01/2023 12:18:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[crud]
	@department_id int =0,
	@department_name varchar(100)=null,
	@location_id int=0,
	@Choice varchar(100)
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if @Choice='insert'
	begin
	insert into department(department_name,location_id) values (@department_name,@location_id)
	end

	if @Choice='update'
	begin
	update department set
	department_name=@department_name,location_id=@location_id where department_id=@department_id
	end
	if @Choice='delete'
	begin
	delete from department where department_id=@department_id
	end

END