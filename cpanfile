requires 'List::Util';
requires 'Mojo::Base';
requires 'Moo';
requires 'Moo::Role';
requires 'Sub::Install';
requires 'Type::Library';
requires 'Type::Utils';
requires 'Types::Standard';
requires 'namespace::autoclean';
requires 'strictures', '2';

on configure => sub {
    requires 'Module::Build::Tiny', '0.034';
    requires 'perl', '5.008005';
};

on test => sub {
    requires 'Test::Fatal';
    requires 'Test::More';
};


