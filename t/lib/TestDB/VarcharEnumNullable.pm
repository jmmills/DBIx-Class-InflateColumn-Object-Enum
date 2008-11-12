package TestDB::VarcharEnumNullable;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components(qw/
    InflateColumn::Object::Enum
    PK::Auto
    Core
/);
__PACKAGE__->table('ven');
__PACKAGE__->add_columns(
    id => {
        data_type => 'number',
        is_auto_increment => 1,
        is_nullable => 0
    },
    enum => {
        data_type => 'varchar',
        is_enum => 1,
        is_nullable => 1,
        extra => {
            list => [qw/red green blue/]
        },
    }
);
__PACKAGE__->set_primary_key('id');

1;
