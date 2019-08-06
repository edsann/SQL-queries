/* Crossing data among X=3 tables in the same database, using two fields as keys */

	Use [DATABASE_NAME]
	Select [A.FIELD_A, B.FIELD_B, C.FIELD_C]
	From TABLEA as A
		inner join
	TABLEB as B
		on A.[COMMON_FIELD_AB] = B.[COMMON_FIELD_AB]
		inner join
	TABLEC as C
		on B.[COMMON_FIELD_BC] = C.[COMMON_FIELD_BC]
