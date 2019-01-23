XPTemplate priority=lang

XPTinclude
	\_common/common

XPT mysql_table_Create
XSET field|pre=field
XSET field|def=Trigger(pickL({'VARCHAR':'mysql_FieldChar','CHAR':'mysql_FieldString','DATETIME':'mysql_FieldDatetime','BIGINT':'mysql_FieldIntBig','INT':'mysql_FieldInt','DECIMAL':'mysql_FiledFloat'},[' Field Type']))
CREATE TABLE `table_name^ (
    `field^`, `ANODA...`{{^,
`field^`, `ANODA...^`}}^
)

XPT _mysqlfprop hidden
XSET field|pre=field
XSET field|def=pickL(["NULL", "NOT NULL", "SERIAL", "DEFAULT `value^","UNSIGNED","AUTO_INCREMENT"],' ','Field Properties')
`field^

XPT _mysqlfield hidden
`field name^ `type^ `:_mysqlfprop:^

XPT mysql_FieldString synonym=mysql_StringField alias=_mysqlfield
XSET type=Embed("VARCHAR(`int str length^)")

XPT mysql_FieldChar synonym=mysql_CharField alias=_mysqlfield
XSET type=Embed("CHAR(`int str length^)")

XPT mysql_FieldDatetime synonym=mysql_DatetimeField alias=_mysqlfield
XSET type=Embed("DATETIME")

XPT mysql_FieldIntBig synonym=mysql_IntBigField alias=_mysqlfield
XSET type=Embed("BIGINT")

XPT mysql_FieldInt synonym=mysql_IntField alias=_mysqlfield
XSET type=Embed("INT(`number^)")

XPT mysql_FieldFloat synonym=mysql_FloatField alias=_mysqlfield
XSET type=Embed("DECIMAL(`total length^, `length of dp^)")

XPT mysql_table_Show
SHOW TABLE

XPT mysql_table_Explain
EXPLAIN `table name^

XPT mysql_table_Delete
DROP TABLE `table name^

XPT mysqlaltert hidden
ALTER TABLE `table name^ 

XPT mysql_column_Add
`:mysqlaltert:^ ADD `column name^ `definition^

XPT mysql_column_ChangeDefaultValue
`:mysqlaltert:^ ALTER `column name^ SET DEFAULT `value^

XPT mysql_column_RemoveDefaultValue
`:mysqlaltert:^ ALTER `column name^ DROP DEFAULT

XPT mysql_column_ChangeDefinitionAndRename synonym=mysql_column_Rename
`:mysqlaltert:^ CHANGE `column name^ `new column name^ `definition^

XPT mysql_column_Delete
`:mysqlaltert:^ DROP `column name^

XPT mysql_column_ChangeDefinition
`:mysqlaltert:^ MODIFY `column name^ `definition^

XPT mysql_table_Rename
RENAME `new table name^

XPT mysql_row_Insert
XSET column_name|post=ExpandInsideEdge(", ","")
XSET values|post=ExpandInsideEdge(", ", "")
INSERT INTO `table name^ (`column_name^)
    VALUES(`values^)` `ANODA VALUE OR ROW`{{^,
(`values^)` `ANODA VALUE OR ROW`^`}}^

XPT mysql_readData_fromFile
LOAD DATA LOCAL INFILE `str file path^ INTO TABLE `table name^
    FIELDS TERMINATED BY '`,^' ESCAPED BY '`\\^'
    LINES TERMINATED BY '`\r\n^'

XPT mysql_query_Select
XSET query|pre=query
XSET query=pickL('s','Select Query', {"1. all columns":"*", "2. column":"`column^", "3. average  of column values":'AVG(`column name^)', "4. get number of non-empty rows in column":'COUNT(`column name^)', "5. largest value in column":'MAX(`column name^)', "6. smallest value in column":'MIN(`column name^)', "7. sum of all values in column":'SUM(`column name^)'})
`query^

XPT mysql_where
XSET operation|pre=operation
XSET operation=pickL('s', 'Where Operation', {"1. is null":"IS NULL `operation^","2. is not  null":"IS NOT NULL `operation^","3. like":"LIKE '`like^' `operation^","4. not like":"NOT LIKE '`like^' `operation^","5. equals":"= '`value^' `operation^","6. >":"> '`value^' `operation^","7. >=":">= '`value^' `operation^","8. <":"< '`value^' `operation^","9. <=":"<= '`value^' `operation^","10. values between .. AND ..":"BETWEEN '`value1^' AND '`value2^' `operation^",'11. values in (..)':"IN (`valuess^) `operation^",'12. values not in (..)':"NOT IN (`valuess^) `operation^", "13. AND": "\n\tAND\n\t`column name^ `operation^", "14. OR":"\n\tOR\n\t`column name^ `operation^"})
XSET valuess|post=ExpandInsideEdge(', "','"')
WHERE `column_name^ `operation^

XPT mysql_limit
LIMIT ``start number?`, ^`number of rows^

XPT mysql_order
ORDER BY` `DESCENDING ORDER?...`{{^ DESC`}}^ `column name^

XPT mysql_group
GROUP BY `column name^

XPT mysql_union
UNION` `INCLUDE DUPLICATES?...`{{^ ALL`}}^
    `select^

XPT mysql_join
XSET join_type=ChooseStr("LEFT JOIN", "RIGHT JOIN")
XSET oper=ChooseStr("=","<",">",">=","<=")
`join_type^ `table_name2^
    ON `table_name1^.`column_name^ `oper^ `table_name2^.`column_name2^

XPT mysql_select
XSET table_name|post=ExpandInsideEdge(", ","")
SELECT `:mysql_query_Select:^` `AS...`{{^ AS `new name^`}}^ FROM `table_name^` `JOIN...`{{^
`:mysql_join:^`}}^` `WHERE...`{{^
`:mysql_where:^`}}^` `LIMIT...`{{^
`:mysql_limit:^`}}^` `ORDER...`{{^
`:mysql_union:^`}}^` `UNION...`{{^
`:mysql_union:^`}}^

XPT mysql_table_Update
UPDATE `table name^ SET
    `column^=`value^` `ANODA COLUMN...`{{^,
`column^=`value^` `ANODA COLUMN...^`}}^` `WHERE`{{^
`:mysql_where:^`}}^

XPT mysql_row_Delete
DELETE from `table name^
    `:mysql_where:^
