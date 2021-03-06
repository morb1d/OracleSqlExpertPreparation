/* ROLLUP */
SELECT ROOM_STYLE, ROOM_TYPE, ROUND(SUM(SQ_FT),2) SUM_SQ_FT 
  FROM SHIP_CABINS
 WHERE SHIP_ID = 1
GROUP BY ROLLUP (ROOM_STYLE, ROOM_TYPE)
ORDER BY ROOM_STYLE, ROOM_TYPE;

/* CUBE */
SELECT ROOM_STYLE, ROOM_TYPE, ROUND(SUM(SQ_FT),2) SUM_SQ_FT 
  FROM SHIP_CABINS
 WHERE SHIP_ID = 1
GROUP BY CUBE (ROOM_STYLE, ROOM_TYPE)
ORDER BY ROOM_STYLE, ROOM_TYPE;

/* GROUPING */
SELECT GROUPING(ROOM_TYPE), ROOM_STYLE, 
	   ROOM_TYPE, ROUND(SUM(SQ_FT),2) SUM_SQ_FT 
  FROM SHIP_CABINS
 WHERE SHIP_ID = 1
GROUP BY ROLLUP (ROOM_STYLE, ROOM_TYPE)
ORDER BY ROOM_STYLE, ROOM_TYPE;

/* GROUPING SETS */
SELECT WINDOW, ROOM_STYLE, ROOM_TYPE, ROUND(SUM(SQ_FT),2) SUM_SQ_FT 
  FROM SHIP_CABINS
 WHERE SHIP_ID = 1
GROUP BY GROUPING SETS ((WINDOW, ROOM_STYLE),(ROOM_TYPE),NULL)
ORDER BY WINDOW, ROOM_STYLE, ROOM_TYPE;
-- The first group, WINDOW and ROOM_STYPE, is equivalent to executing a SELECT statement with a GROUP BY WINDOW, ROOM_STYLE
-- The second group is ROOM_TYPE by itself, which is the equivalent to executing a SELECT statement with a GROUP BY ROOM_TYPE
-- The third group is NULL, which is the equivalent (in GROUPING SETS syntax) of asking for a single grand total

