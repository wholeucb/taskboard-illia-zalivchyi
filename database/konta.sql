-- Konto aplikacji
CREATE USER IF NOT EXISTS 'taskboard_app'@'localhost'
IDENTIFIED BY 'ZmienHasloApp';

CREATE USER IF NOT EXISTS 'taskboard_app'@'127.0.0.1'
IDENTIFIED BY 'ZmienHasloApp';

GRANT SELECT, INSERT, UPDATE ON taskboard.*
TO 'taskboard_app'@'localhost';

GRANT SELECT, INSERT, UPDATE ON taskboard.*
TO 'taskboard_app'@'127.0.0.1';