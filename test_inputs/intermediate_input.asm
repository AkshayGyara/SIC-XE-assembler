Line	Address	Label	OPCODE	OPERAND	Comment
5	. TEST PROGRAM
10	00000	0	COPY	START	0	Comment here
15	00000	0	FIRST	STL	RETADR	Comment here
20	00003	0	CLOOP	JSUB	RDREC	Comment here
25	00006	0		LDA	LENGTH	Comment here
30	00009	0		COMP	#0	Comment here
35	0000C	0		JEQ	ENDFIL	Comment here
40	0000F	0		JSUB	WRREC	Comment here
45	00012	0		J	CLOOP	Comment here
50	00015	0	ENDFIL	LDA	=C'EOF'	Comment here
55	00018	0		STA	BUFFER	Comment here
60	0001B	0		LDA	#3	Comment here
65	0001E	0		STA	LENGTH	Comment here
70	00021	0		JSUB	WRREC	Comment here
75	00024	0		J	@RETADR	Comment here
80	00000	1		USE	CDATA	
85	00000	1	RETADR	RESW	1	Comment here
90	00003	1	LENGTH	RESW	1	Comment here
95	00000	2		USE	CBLKS	
100	00000	2	BUFFER	RESB	4096	Comment here
105	01000	2	BUFEND	EQU	*	Comment here to test * literal
110	01000	 	MAXLEN	EQU	BUFEND-BUFFER	
115	.
120	.   RDREC SUBROUTINE
125	.
130	00027	0		USE	DEFAULT	
135	00027	0	RDREC	CLEAR	X	Comment here
140	00029	0		CLEAR	A	Comment here
145	0002B	0		CLEAR	S	Comment here
150	0002D	0		+LDT	#MAXLEN	Comment here
155	00031	0	RLOOP	TD	INPUT	Comment here
160	00034	0		JEQ	RLOOP	Comment here
165	00037	0		RD	INPUT	Comment here
170	0003A	0		COMPR	A,S	Comment here
175	0003C	0		JEQ	EXIT	Comment here
180	0003F	0		STCH	BUFFER,X	Comment here
185	00042	0		TIXR	T	Comment here
190	00044	0		JLT	RLOOP	Comment here
195	00047	0	EXIT	STX	LENGTH	Comment here
200	0004A	0		RSUB	 	Comment here
205	00006	1		USE	CDATA	
210	00006	1	INPUT	BYTE	X'F1'	Comment here
215	.
220	.   WRREC SUBROUTINE
225	.
230	0004D	0		USE	DEFAULT	
235	0004D	0	WRREC	CLEAR	X	Comment here
240	0004F	0		LDT	LENGTH	Comment here
245	00052	0	WLOOP	TD	=X'05'	Comment here
250	00055	0		JEQ	WLOOP	Comment here
255	00058	0		LDCH	BUFFER,X	Comment here
260	0005B	0		WD	=X'05'	Comment here
265	0005E	0		TIXR	T	Comment here
270	00060	0		JLT	WLOOP	Comment here
275	00063	0		RSUB	 	Comment here
280	00007	1		USE	CDATA	
285	00007	1		LTORG	 	
290	00007	1	*	=C'EOF'	 	 
295	0000A	1	*	=X'05'	 	 
300	00066	 		END	FIRST	Comment here