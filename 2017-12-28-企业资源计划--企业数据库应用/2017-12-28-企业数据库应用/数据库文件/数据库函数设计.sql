USE [Cloth_long_term_plan]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[细需求量的计算]
(@预测数量 int,
@计划下达量 int,
@计划入库量 int,
@现有量 int,
@安全库存 int）
RETURNS int
AS
BEGIN
   RETURN (@预测数量+@计划下达量-@计划入库量-@现有量+@安全库存)
END
