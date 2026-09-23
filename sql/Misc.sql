SELECT
	N'😃' AS smile
,	UNICODE(N'😃') AS codepoint

SELECT
	UNICODE(SUBSTRING(N'😃', 1, 1)) AS high_surrogate,
	UNICODE(SUBSTRING(N'😃', 2, 1)) AS low_surrogate
go
