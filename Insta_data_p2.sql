CREATE OR REPLACE FUNCTION check_adult()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.age < 18 THEN
        RAISE EXCEPTION 'Must be an adult!';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER must_be_adult
BEFORE INSERT ON tejaswi_app.students
FOR EACH ROW
EXECUTE FUNCTION check_adult();


INSERT INTO tejaswi_app.students(first_name, age) VALUES ('Alice', 15); 

alter table tejaswi_app.students add column age INT;

-- preventing self follow
CREATE OR REPLACE FUNCTION prevent_selffollow()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.follower_id=New.followee_id THEN
        RAISE EXCEPTION 'you cannot follow yourself!';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER prevent_selffollow
BEFORE INSERT ON instagram.follows
FOR EACH ROW
EXECUTE FUNCTION prevent_selffollow();

INSERT INTO instagram.follows(follower_id, followee_id) VALUES (3, 3); 


-- adding records if unfollowed

CREATE OR REPLACE FUNCTION create_unfollow_function() 
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO unfollows (follower_id, followee_id)
    VALUES (OLD.follower_id, OLD.followee_id);
    
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER create_unfollow
AFTER DELETE ON follows
FOR EACH ROW
EXECUTE FUNCTION create_unfollow_function();

--

show triggers;
