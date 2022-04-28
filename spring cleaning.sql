  -- 1.
	SELECT * FROM shirts;
  -- 2.
	INSERT INTO shirts(shirt_id, color, article, shirt_size, last_worn) 
	VALUES(9,'purple', 'polo shirt', 'medium', 50);
	SELECT * FROM shirts;
  -- 3. 
    SELECT article, color FROM shirts; 
  -- 4.
    SELECT article, color, shirt_size, last_worn FROM shirts WHERE shirt_size = 'M';
  -- 5.
    UPDATE shirts SET  shirt_size ='L' WHERE article = 'polo shirt';
  -- 6.
    UPDATE shirts SET  last_worn  = 0 WHERE last_worn = 15;
  -- 7.
    UPDATE shirts SET  shirt_size = 'XS', color = 'off white' WHERE color = 'white';
  -- 8.
    DELETE FROM shirts WHERE last_worn = 200;
  -- 9. 
    DELETE FROM shirts WHERE article = 'tank top';
  -- 10.
    DELETE FROM shirts; 
  -- 11.
    DROP TABLE shirts; 
