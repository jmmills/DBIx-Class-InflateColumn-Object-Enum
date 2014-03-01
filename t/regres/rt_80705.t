use Test::More 'no_plan';

BEGIN {
    use lib 't/lib';
    use_ok 'DBICx::TestDatabase';
    use_ok 'TestDB';
    use_ok 'Try::Tiny';
}

my $db = DBICx::TestDatabase->new('TestDB');

isa_ok $db, 'TestDB';

my $rs = $db->resultset('VarcharEnumNoneNullable');

my ($a, $b);

ok $rs, 'got rs';
ok $a = $rs->create({id => 1, enum => 'red'}), 'create a row';
ok $a->foo('bar'), 'Set arbitrary column';
ok $a->enum->is_red,'is red';
ok $a->enum->set_blue,'set blue';
ok $a->enum->is_blue,'confirm blue';
ok $a->update, 'run update';
ok $b = $rs->find($a->id), 'retrieve row from data';
ok $b->enum->is_blue, 'confirm update'
