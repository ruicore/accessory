USE [Cloth_long_term_plan]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[开工日期的计算](
@结束日期 datetime,
@预测数量 int,
@每日定量 int
)
RETURNS int
AS
BEGIN
   RETURN(convert(int,@结束日期)-@预测数量/@每日定量)
END
