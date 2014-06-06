CREATE VIEW `firstview` AS
    select 
        `bread`.`breadName` AS `bread`,
        `bread`.`breadSize` AS `Size`,
        `bread`.`breadPrice` AS `Price`,
        `bread`.`breadImage` AS `Image`,
        `manufacturers`.`manufacturersName` AS `manufacturers`,
        `manufacturers`.`manufacturerAddress` AS `ManufacturerAddress`,
        `manufacturers`.`City` AS `ManufacturerCity`,
        `manufacturers`.`Province` AS `ManufacturerProvince`,
        `manufacturers`.`Postcode` AS `ManufacturerPostcode`,
        `manufacturers`.`Country` AS `ManufacturerCountry`,
        `available`.`available` AS `available`,
        `stores`.`storeName` AS `storeName`,
        `stores`.`storeAddress` AS `storeAddress`,
        `stores`.`City` AS `City`,
        `stores`.`Province` AS `Province`,
        `stores`.`Postcode` AS `Postcode`,
        `stores`.`Country` AS `Country`,
        `stores`.`storeImage` AS `storeImage`
    from
        (((`available`
        left join `bread` ON ((`available`.`idbread` = `bread`.`idbread`)))
        left join `manufacturers` ON ((`bread`.`idmanufacturers` = `manufacturers`.`idmanufacturers`)))
        left join `stores` ON ((`bread`.`idstore` = `stores`.`idstore`)))