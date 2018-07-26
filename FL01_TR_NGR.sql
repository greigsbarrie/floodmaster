--------------------------------------------------------
--  DDL for Trigger FL01_TR_NGR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "FLOODMASTER"."FL01_TR_NGR" 
 BEFORE INSERT OR UPDATE OF EASTING
, NORTHING
 ON FL01_PVAS
 FOR EACH ROW
begin
 if :new.easting is not null and
      :new.northing is not null and
      (:new.easting<>nvl(:old.easting,-1)
       or :new.northing<>nvl(:old.northing,-1))
   then
     :new.lat  := round( ge101.ostn02_etrs89_lat_from_osgb36 (:new.easting,:new.northing),7);
     :new.lon := round( ge101.ostn02_etrs89_long_from_osgb36 (:new.easting,:new.northing),7);
   end if;
end;

/
ALTER TRIGGER "FLOODMASTER"."FL01_TR_NGR" ENABLE;
