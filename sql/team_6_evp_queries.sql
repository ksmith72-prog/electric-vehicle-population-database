USE evp;

-- =====================================================
-- Team 6 CRUD Views
-- These are SELECT queries saved as views.
-- =====================================================


-- View 1
-- Shows each EV in the inventory with make, model, year, type, range, and location.
-- Requirements: A, B
CREATE OR REPLACE VIEW view_vehicle_inventory_details AS
SELECT
    vi.dol_vehicle_id AS dol_vehicle_id,
    vi.vin AS vin,
    ma.make_name AS make_name,
    mo.model_name AS model_name,
    v.model_year AS model_year,
    v.ev_type AS ev_type,
    v.electric_range_miles AS electric_range_miles,
    v.cafv_eligibility_status AS cafv_eligibility_status,
    l.city AS city,
    l.county AS county,
    l.state AS state,
    l.zip_code AS zip_code
FROM Vehicle_Inventory vi
JOIN Vehicle v
    ON vi.vehicle_id = v.vehicle_id
JOIN Model mo
    ON v.model_id = mo.model_id
JOIN Make ma
    ON mo.make_id = ma.make_id
JOIN Location l
    ON vi.location_id = l.location_id
WHERE v.electric_range_miles >= 200;


-- View 2
-- Counts EVs by make and model.
-- Requirements: A, C
CREATE OR REPLACE VIEW view_ev_count_by_make_model AS
SELECT
    ma.make_name AS make_name,
    mo.model_name AS model_name,
    COUNT(vi.dol_vehicle_id) AS number_of_vehicles
FROM Make ma
JOIN Model mo
    ON ma.make_id = mo.make_id
JOIN Vehicle v
    ON mo.model_id = v.model_id
JOIN Vehicle_Inventory vi
    ON v.vehicle_id = vi.vehicle_id
GROUP BY
    ma.make_name,
    mo.model_name;


-- View 3
-- Shows average electric range by EV type.
-- Requirements: A, B, C
CREATE OR REPLACE VIEW view_average_range_by_ev_type AS
SELECT
    v.ev_type AS ev_type,
    COUNT(vi.dol_vehicle_id) AS number_of_vehicles,
    ROUND(AVG(v.electric_range_miles), 2) AS average_electric_range_miles
FROM Vehicle v
JOIN Vehicle_Inventory vi
    ON v.vehicle_id = vi.vehicle_id
GROUP BY
    v.ev_type
HAVING AVG(v.electric_range_miles) > 100;


-- View 4
-- Shows each location and the utility company connected to that location.
-- This uses the linking table Location_Utility and both source tables.
-- Requirements: A, B, D
CREATE OR REPLACE VIEW view_location_utility_details AS
SELECT
    l.location_id AS location_id,
    l.city AS city,
    l.county AS county,
    l.state AS state,
    l.zip_code AS zip_code,
    u.utility_name AS utility_name
FROM Location l
JOIN Location_Utility lu
    ON l.location_id = lu.location_id
JOIN Utility u
    ON lu.utility_id = u.utility_id
WHERE l.state = 'WA';


-- View 5
-- Shows vehicles with an electric range higher than the overall average range.
-- Requirements: A, B, E
CREATE OR REPLACE VIEW view_above_average_range_vehicles AS
SELECT
    ma.make_name AS make_name,
    mo.model_name AS model_name,
    v.model_year AS model_year,
    v.ev_type AS ev_type,
    v.electric_range_miles AS electric_range_miles,
    v.cafv_eligibility_status AS cafv_eligibility_status
FROM Vehicle v
JOIN Model mo
    ON v.model_id = mo.model_id
JOIN Make ma
    ON mo.make_id = ma.make_id
WHERE v.electric_range_miles >
    (
        SELECT AVG(electric_range_miles)
        FROM Vehicle
    );