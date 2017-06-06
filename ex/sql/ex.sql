SELECT objID
    FROM photoObjAll poa
    WHERE poa.ra > 140 AND poa.ra < 141 AND poa.dec > 20 AND poa.dec < 21
;


SELECT objID
    FROM photoObjAll poa
    WHERE poa.ra > 140 AND poa.ra < 141 AND poa.dec > 20 AND poa.dec < 21
        AND type = 3
;


SELECT specObjID
    FROM SpecObjAll soa
    WHERE soa.ra > 140 AND soa.ra < 141 AND soa.dec > 20 AND soa.dec < 21
        AND class = 'QSO'
;


select COUNT(*) FROM (
    SELECT objID
        FROM photoObjAll poa
        WHERE poa.ra > 140 AND poa.ra < 141 AND poa.dec > 20 AND poa.dec < 21
            AND type = 6 AND psfMag_r < 17
        ) psf_lt_17
;



select specObjID
    from SpecObjAll soa
    order by soa.z desc
    limit 1
