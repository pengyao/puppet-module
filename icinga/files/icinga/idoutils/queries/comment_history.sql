SELECT 
icinga_instances.instance_id
,icinga_instances.instance_name
,icinga_commenthistory.object_id
,obj1.objecttype_id
,obj1.name1 AS host_name
,obj1.name2 AS service_description
,icinga_commenthistory.*
FROM `icinga_commenthistory`
LEFT JOIN icinga_objects as obj1 ON icinga_commenthistory.object_id=obj1.object_id
LEFT JOIN icinga_instances ON icinga_commenthistory.instance_id=icinga_instances.instance_id
ORDER BY entry_time DESC, entry_time_usec DESC, commenthistory_id DESC

