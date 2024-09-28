psql -U postgres -f ./_init.sql
psql -U postgres -d users_system -f ./users.sql
psql -U postgres -d users_system -f ./users_test.sql