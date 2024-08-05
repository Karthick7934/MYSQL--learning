CREATE TABLE events(   
  event_id INT AUTO_INCREMENT PRIMARY KEY,   
  event_name varchar(75),   
  visitors varchar(25),   
  properties json,   
  browser_name json  
);  
show tables;
INSERT INTO events (event_name, visitors, properties, browser_name)   
VALUES (  
  'page-view',   
   '2',  
   '{"page": "/"}',  
   '{ "name": "Google Chrome", "OS": "Windows", "resolution": {"x": 1920, "y": 1080} }'  
),  
('page-view',   
  '3',  
  '{"page": "/products"}',  
  '{ "name": "Safari", "OS": "UNIX", "resolution": {"x": 2560, "y": 1600} }'  
),  
(  
  'page-view',   
  '1',  
  '{"page": "/contacts"}',  
  '{ "name": "Mozilla Firefox", "OS": "Mac", "resolution": {"x": 1920, "y": 1080} }'  
),  
(  
  'purchase',   
   '4',  
  '{"amount": 250}',  
  '{ "name": "Google Chrome", "OS": "Windows", "resolution": {"x": 1280, "y": 800} }'  
),  
(  
  'purchase',   
   '3',  
  '{"amount": 350}',  
  '{ "name": "Safari", "OS": "Mac", "resolution": {"x": 1600, "y": 900} }'  
),  
(  
  'purchase',   
  '4',  
  '{"amount": 400}',  
  '{ "name": "Mozilla Firefox", "OS": "Windows", "resolution": {"x": 1280, "y": 800} }'  
);  
select * from events;
SELECT event_id, event_name->'$.page-view',properties->'$.amount',browser_name->'$.name' AS browser FROM events;  
