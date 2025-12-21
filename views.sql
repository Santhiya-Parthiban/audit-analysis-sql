--ACCURACY CALCULATION
CREATE VIEW v_coder_accuracy AS
SELECT
Coder_name,
Audit_Date,
Charts_audited,
Error_counts,
ROUND(((Charts_audited - Error_counts)/ Charts_audited)*100, 2)
AS Accuracy
FROM audits;

--LOW QUALITY RISK REVIEW
CREATE VIEW v_low_quality_coders AS
SELECT *
FROM v_coder_accuracy
WHERE accuracy <95;

--HIGH PERFORMER VIEW
CREATE VIEW v_high_quality_coders AS
SELECT *
FROM v_coder_accuracy
WHERE accuracy >=95;

-- See coder accuracy
SELECT * FROM v_coder_accuracy;

-- See low quality coders (<95% accuracy)
SELECT * FROM v_low_quality_coders;

-- See high quality coders (>=95% accuracy)
SELECT * FROM v_high_quality_coders;
