package main;

use Test::More 'no_plan';

BEGIN {
    use lib 't/lib';
    use_ok 'DBICx::TestDatabase';
    use_ok 'TestDB';
}

my $db = DBICx::TestDatabase->new('TestDB');

isa_ok $db, 'TestDB';

my $rs = $db->resultset('WithBadDefaultValue')
            ->create({id => 1});

ok defined($rs) && $rs, 'got a resultset'
    or diag "ResultSet: $rs";

diag $rs->enum;

1; # end of test

