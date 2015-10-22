--Reduction of hospitals--
CREATE TABLE hospitals_new AS
SELECT provider_id, hospital_name, hospital_type, state FROM hospitals;
ALTER TABLE hospitals RENAME TO hospitals_old;
ALTER TABLE hospitals_new RENAME TO hospitals;

---

