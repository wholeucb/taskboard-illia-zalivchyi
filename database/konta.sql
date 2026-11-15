-- Konto aplikacji
CREATE USER IF NOT EXISTS 'taskboard_app'@'localhost'
IDENTIFIED BY 'ZmienHasloApp';

CREATE USER IF NOT EXISTS 'taskboard_app'@'127.0.0.1'
IDENTIFIED BY 'ZmienHasloApp';

GRANT SELECT, INSERT, UPDATE ON taskboard.*
TO 'taskboard_app'@'localhost';

GRANT SELECT, INSERT, UPDATE ON taskboard.*
TO 'taskboard_app'@'127.0.0.1';

-- Konto administratora
CREATE USER IF NOT EXISTS 'taskboard_admin'@'localhost'
IDENTIFIED BY 'ZmienHasloAdmin';

CREATE USER IF NOT EXISTS 'taskboard_admin'@'127.0.0.1'
IDENTIFIED BY 'ZmienHasloAdmin';

GRANT ALL PRIVILEGES ON taskboard.*
TO 'taskboard_admin'@'localhost';

GRANT ALL PRIVILEGES ON taskboard.*
TO 'taskboard_admin'@'127.0.0.1';

-- Konto tylko do odczytu
CREATE USER IF NOT EXISTS 'taskboard_report'@'localhost'
IDENTIFIED BY 'ZmienHasloReport';

CREATE USER IF NOT EXISTS 'taskboard_report'@'127.0.0.1'
IDENTIFIED BY 'ZmienHasloReport';

GRANT SELECT ON taskboard.*
TO 'taskboard_report'@'localhost';

GRANT SELECT ON taskboard.*
TO 'taskboard_report'@'127.0.0.1';
