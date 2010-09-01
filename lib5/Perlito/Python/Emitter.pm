# Do not edit this file - Generated by Perlito 6.0
use v5;
use utf8;
use strict;
use warnings;
no warnings ('redefine', 'once', 'void', 'uninitialized', 'misc', 'recursion');
use Perlito::Perl5::Runtime;
our $MATCH = Perlito::Match->new();
{
package GLOBAL;
sub new { shift; bless { @_ }, "GLOBAL" }

# use v6 
;
{
package Python;
sub new { shift; bless { @_ }, "Python" }
sub tab { my $level = $_[0]; (my  $s = ''); (my  $count = $level); for ( ; Main::bool(($count > 0));  ) { ($s = $s . '    '); ($count = ($count - 1)) }; return($s) }
}

;
{
package Perlito::Python::AnonSub;
sub new { shift; bless { @_ }, "Perlito::Python::AnonSub" }
sub name { $_[0]->{name} };
sub sig { $_[0]->{sig} };
sub block { $_[0]->{block} };
sub handles_return_exception { $_[0]->{handles_return_exception} };
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; (my  $sig = $self->{sig}); (my  $pos = $sig->positional()); (my  $args = []); for my $field ( @{[@{($pos || []) || []}] || []} ) { push( @{$args}, $field->emit_python_name() ) }; (my  $block = Perlito::Python::LexicalBlock->new(('block' => $self->{block}), ('needs_return' => 1))); my  $List_s; push( @{$List_s}, Python::tab($level) . 'def f_' . $self->{name} . '(' . Main::join($args, ', ') . '):' ); for my $field ( @{[@{(($args) || []) || []}] || []} ) { push( @{$List_s}, Python::tab(($level + 1)) . $field . ' = [' . $field . ']' ) }; if (Main::bool($self->{handles_return_exception})) { push( @{$List_s}, Python::tab(($level + 1)) . 'try:' ); push( @{$List_s}, $block->emit_python_indented(($level + 2)) ); push( @{$List_s}, Python::tab(($level + 1)) . 'except mp6_Return, r:' ); push( @{$List_s}, Python::tab(($level + 2)) . 'return r.value' ) } else { push( @{$List_s}, $block->emit_python_indented(($level + 1)) ) }; return(Main::join($List_s, '
')) }
}

;
{
package Perlito::Python::LexicalBlock;
sub new { shift; bless { @_ }, "Perlito::Python::LexicalBlock" }
sub block { $_[0]->{block} };
sub needs_return { $_[0]->{needs_return} };
sub top_level { $_[0]->{top_level} };
my  $ident;
my  $List_anon_block;
sub push_stmt_python { my $block = $_[0]; push( @{$List_anon_block}, $block ) };
sub get_ident_python { ($ident = ($ident + 1)); return($ident) };
sub has_my_decl { my $self = $_[0]; for my $decl ( @{$self->{block} || []} ) { if (Main::bool((Main::isa($decl, 'Decl') && (($decl->decl() eq 'my'))))) { return(1) } ; if (Main::bool(((Main::isa($decl, 'Bind') && Main::isa(($decl->parameters()), 'Decl')) && ((($decl->parameters())->decl() eq 'my'))))) { return(1) }  }; return(0) };
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; if (Main::bool((($self->{block}) ? 0 : 1))) { push( @{$self->{block}}, Apply->new(('code' => 'Mu')) ) } ; my  $List_s; my  $List_tmp; for my $stmt ( @{$List_anon_block || []} ) { push( @{$List_tmp}, $stmt ) }; (my  $has_decl = []); (my  $block = []); for my $decl ( @{$self->{block} || []} ) { if (Main::bool((Main::isa($decl, 'Decl') && (($decl->decl() eq 'has'))))) { push( @{$has_decl}, $decl ) } else { if (Main::bool(((Main::isa($decl, 'Bind') && Main::isa(($decl->parameters()), 'Decl')) && ((($decl->parameters())->decl() eq 'has'))))) { push( @{$has_decl}, $decl ) } else { push( @{(($block) || [])}, $decl ) } } }; if (Main::bool((($has_decl) || []))) { for my $decl ( @{[@{(($has_decl) || []) || []}] || []} ) { if (Main::bool((Main::isa($decl, 'Decl') && (($decl->decl() eq 'has'))))) { (my  $label = '_anon_' . Perlito::Python::LexicalBlock::get_ident_python()); push( @{$List_s}, Python::tab($level) . 'def f_' . $label . '(v_self):' ); push( @{$List_s}, Python::tab(($level + 1)) . 'return v_self.v_' . ($decl->var())->name() ); push( @{$List_s}, Python::tab($level) . 'self.__dict__.update(' . '{' . '\'f_' . ($decl->var())->name(("" . '\':f_') . $label . '})') ) } ; if (Main::bool(((Main::isa($decl, 'Bind') && Main::isa(($decl->parameters()), 'Decl')) && ((($decl->parameters())->decl() eq 'has'))))) { (my  $label = '_anon_' . Perlito::Python::LexicalBlock::get_ident_python()); push( @{$List_s}, Python::tab($level) . 'def f_' . $label . '(v_self):' ); push( @{$List_s}, Python::tab(($level + 1)) . 'return v_self.v_' . (($decl->parameters())->var())->name() ); push( @{$List_s}, Python::tab($level) . 'self.__dict__.update(' . '{' . '\'f_' . (($decl->parameters())->var())->name(("" . '\':f_') . $label . '})') ) }  } } ; for my $decl ( @{[@{(($block) || []) || []}] || []} ) { if (Main::bool((Main::isa($decl, 'Decl') && (($decl->decl() eq 'my'))))) { push( @{$List_s}, Python::tab($level) . ($decl->var())->emit_python_name() . ' = [' . $decl->emit_python_init() . ']' ) } ; if (Main::bool(((Main::isa($decl, 'Bind') && Main::isa(($decl->parameters()), 'Decl')) && ((($decl->parameters())->decl() eq 'my'))))) { push( @{$List_s}, Python::tab($level) . (($decl->parameters())->var())->emit_python_name() . ' = [' . ($decl->parameters())->emit_python_init() . ']' ) }  }; my  $last_statement; if (Main::bool($self->{needs_return})) { ($last_statement = pop( @{(($block) || [])} )) } ; for my $stmt ( @{[@{(($block) || []) || []}] || []} ) { ($List_anon_block = []); (my  $s2 = $stmt->emit_python_indented($level)); for my $stmt ( @{$List_anon_block || []} ) { push( @{$List_s}, $stmt->emit_python_indented($level) ) }; push( @{$List_s}, $s2 ) }; if (Main::bool(($self->{needs_return} && $last_statement))) { ($List_anon_block = []); my  $s2; if (Main::bool(Main::isa($last_statement, 'If'))) { (my  $cond = $last_statement->cond()); (my  $has_otherwise = (Main::bool($last_statement->otherwise()) ? 1 : 0)); (my  $body_block = Perlito::Python::LexicalBlock->new(('block' => ($last_statement->body())), ('needs_return' => 1))); (my  $otherwise_block = Perlito::Python::LexicalBlock->new(('block' => ($last_statement->otherwise())), ('needs_return' => 1))); if (Main::bool($body_block->has_my_decl())) { ($body_block = Return->new(('result' => Do->new(('block' => ($last_statement->body())))))) } ; if (Main::bool(($has_otherwise && $otherwise_block->has_my_decl()))) { ($otherwise_block = Return->new(('result' => Do->new(('block' => ($last_statement->otherwise())))))) } ; ($s2 = Python::tab($level) . 'if mp6_to_bool(' . $cond->emit_python() . '):' . '
' . $body_block->emit_python_indented(($level + 1))); if (Main::bool(($has_otherwise))) { ($s2 = $s2 . '
' . Python::tab($level) . 'else:' . '
' . $otherwise_block->emit_python_indented(($level + 1))) }  } else { if (Main::bool(Main::isa($last_statement, 'Bind'))) { ($s2 = $last_statement->emit_python_indented($level)); ($s2 = $s2 . '
' . Python::tab($level) . 'return ' . ($last_statement->parameters())->emit_python()) } else { if (Main::bool((Main::isa($last_statement, 'Return') || Main::isa($last_statement, 'For')))) { ($s2 = $last_statement->emit_python_indented($level)) } else { ($s2 = Python::tab($level) . 'return ' . $last_statement->emit_python()) } } }; for my $stmt ( @{$List_anon_block || []} ) { push( @{$List_s}, $stmt->emit_python_indented($level) ) }; push( @{$List_s}, $s2 ) } ; ($List_anon_block = [@{$List_tmp || []}]); return(Main::join($List_s, '
')) }
}

;
{
package CompUnit;
sub new { shift; bless { @_ }, "CompUnit" }
sub name { $_[0]->{name} };
sub attributes { $_[0]->{attributes} };
sub methods { $_[0]->{methods} };
sub body { $_[0]->{body} };
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; my  $List_s; (my  $block = Perlito::Python::LexicalBlock->new(('block' => $self->{body}))); (my  $label = '_anon_' . Perlito::Python::LexicalBlock::get_ident_python()); (my  $name = Main::to_go_namespace($self->{name})); for my $decl ( @{$self->{body} || []} ) { if (Main::bool(Main::isa($decl, 'Use'))) { if (Main::bool(($decl->mod() ne 'v6'))) { push( @{$List_s}, Python::tab($level) . 'from ' . Main::to_go_namespace($decl->mod()) . ' import *' ) }  }  }; push( @{$List_s}, Python::tab($level) . 'try:' ); push( @{$List_s}, Python::tab(($level + 1)) . 'type(' . $name . ')' ); push( @{$List_s}, Python::tab($level) . 'except NameError:' ); push( @{$List_s}, Python::tab(($level + 1)) . '__all__.extend([\'' . $name . '\', \'' . $name . '_proto\'])' ); push( @{$List_s}, Python::tab(($level + 1)) . 'class ' . $name . ':' ); push( @{$List_s}, Python::tab(($level + 2)) . 'def __init__(v_self, **arg):' ); push( @{$List_s}, Python::tab(($level + 3)) . 'v_self.__dict__.update(arg)' ); push( @{$List_s}, Python::tab(($level + 2)) . 'def __setattr__(v_self, k, v):' ); push( @{$List_s}, Python::tab(($level + 3)) . 'v_self.__dict__[k] = v' ); push( @{$List_s}, Python::tab(($level + 2)) . 'def f_isa(v_self, name):' ); push( @{$List_s}, Python::tab(($level + 3)) . 'return name == \'' . $self->{name} . '\'' ); push( @{$List_s}, Python::tab(($level + 2)) . 'def __nonzero__(self):' ); push( @{$List_s}, Python::tab(($level + 3)) . 'return 1' ); push( @{$List_s}, Python::tab(($level + 2)) . 'def __getattr__(self, attr):' ); push( @{$List_s}, Python::tab(($level + 3)) . 'if attr[0:2] == \'v_\':' ); push( @{$List_s}, Python::tab(($level + 4)) . 'return mp6_Undef()' ); push( @{$List_s}, Python::tab(($level + 3)) . 'raise AttributeError(attr)' ); push( @{$List_s}, Python::tab(($level + 1)) . $name . '_proto = ' . $name . '()' ); push( @{$List_s}, Python::tab(($level + 1)) . '__builtin__.' . $name . ' = ' . $name . '' ); push( @{$List_s}, Python::tab(($level + 1)) . '__builtin__.' . $name . '_proto = ' . $name . '_proto' ); push( @{$List_s}, Python::tab($level) . 'def ' . $label . '():' ); push( @{$List_s}, Python::tab(($level + 1)) . 'self = ' . $name ); push( @{$List_s}, $block->emit_python_indented(($level + 1)) ); push( @{$List_s}, Python::tab($level) . $label . '()' ); return(Main::join($List_s, '
')) }
}

;
{
package Val::Int;
sub new { shift; bless { @_ }, "Val::Int" }
sub int { $_[0]->{int} };
sub emit_python { my $self = $_[0]; $self->{int} };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; Python::tab($level) . $self->{int} }
}

;
{
package Val::Bit;
sub new { shift; bless { @_ }, "Val::Bit" }
sub bit { $_[0]->{bit} };
sub emit_python { my $self = $_[0]; $self->{bit} };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; Python::tab($level) . $self->{bit} }
}

;
{
package Val::Num;
sub new { shift; bless { @_ }, "Val::Num" }
sub num { $_[0]->{num} };
sub emit_python { my $self = $_[0]; $self->{num} };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; Python::tab($level) . $self->{num} }
}

;
{
package Val::Buf;
sub new { shift; bless { @_ }, "Val::Buf" }
sub buf { $_[0]->{buf} };
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; Python::tab($level) . '"' . Main::javascript_escape_string($self->{buf}) . '"' }
}

;
{
package Lit::Array;
sub new { shift; bless { @_ }, "Lit::Array" }
sub array1 { $_[0]->{array1} };
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; (my  $needs_interpolation = 0); for my $item ( @{$self->{array1} || []} ) { if (Main::bool((((Main::isa($item, 'Var') && ($item->sigil() eq '@'))) || ((Main::isa($item, 'Apply') && ($item->code() eq 'prefix:<@>')))))) { ($needs_interpolation = 1) }  }; if (Main::bool($needs_interpolation)) { my  $List_block; (my  $temp_array = Var->new(('name' => 'a'), ('namespace' => ''), ('sigil' => '@'), ('twigil' => ''))); (my  $input_array = Var->new(('name' => 'b'), ('namespace' => ''), ('sigil' => '@'), ('twigil' => ''))); push( @{$List_block}, Decl->new(('decl' => 'my'), ('type' => ''), ('var' => $temp_array)) ); (my  $index = 0); for my $item ( @{$self->{array1} || []} ) { if (Main::bool((((Main::isa($item, 'Var') && ($item->sigil() eq '@'))) || ((Main::isa($item, 'Apply') && ($item->code() eq 'prefix:<@>')))))) { push( @{$List_block}, Call->new(('method' => 'extend'), ('arguments' => [Index->new(('obj' => $input_array), ('index_exp' => Val::Int->new(('int' => $index))))]), ('hyper' => ''), ('invocant' => $temp_array)) ) } else { push( @{$List_block}, Call->new(('method' => 'push'), ('arguments' => [Index->new(('obj' => $input_array), ('index_exp' => Val::Int->new(('int' => $index))))]), ('hyper' => ''), ('invocant' => $temp_array)) ) }; ($index = ($index + 1)) }; push( @{$List_block}, $temp_array ); (my  $label = '_anon_' . Perlito::Python::LexicalBlock::get_ident_python()); Perlito::Python::LexicalBlock::push_stmt_python(Perlito::Python::AnonSub->new(('name' => $label), ('block' => $List_block), ('sig' => Sig->new(('invocant' => undef), ('positional' => [$input_array]), ('named' => {  }))), ('handles_return_exception' => 1))); return(Python::tab($level) . 'f_' . $label . '(mp6_Array([' . Main::join(([ map { $_->emit_python() } @{ $self->{array1} } ]), ', ') . ']))') } else { Python::tab($level) . 'mp6_Array([' . Main::join(([ map { $_->emit_python() } @{ $self->{array1} } ]), ', ') . '])' } }
}

;
{
package Lit::Hash;
sub new { shift; bless { @_ }, "Lit::Hash" }
sub hash1 { $_[0]->{hash1} };
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; (my  $fields = $self->{hash1}); my  $List_dict; for my $field ( @{[@{($fields || []) || []}] || []} ) { push( @{$List_dict}, (($field->[0])->emit_python() . ':' . ($field->[1])->emit_python()) ) }; Python::tab($level) . 'mp6_Hash({' . Main::join($List_dict, ', ') . '})' }
}

;
{
package Index;
sub new { shift; bless { @_ }, "Index" }
sub obj { $_[0]->{obj} };
sub index_exp { $_[0]->{index_exp} };
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; Python::tab($level) . $self->{obj}->emit_python() . '.f_index(' . $self->{index_exp}->emit_python() . ')' }
}

;
{
package Lookup;
sub new { shift; bless { @_ }, "Lookup" }
sub obj { $_[0]->{obj} };
sub index_exp { $_[0]->{index_exp} };
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; Python::tab($level) . $self->{obj}->emit_python() . '.f_lookup(' . $self->{index_exp}->emit_python() . ')' }
}

;
{
package Var;
sub new { shift; bless { @_ }, "Var" }
sub sigil { $_[0]->{sigil} };
sub twigil { $_[0]->{twigil} };
sub name { $_[0]->{name} };
(my  $table = { ('$' => 'v_'),('@' => 'List_'),('%' => 'Hash_'),('&' => 'Code_'), });
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; return(Python::tab($level) . ((Main::bool((($self->{twigil} eq '.'))) ? ('v_self[0].v_' . $self->{name} . '') : ((Main::bool((($self->{name} eq '/'))) ? ($table->{$self->{sigil}} . 'MATCH[0]') : ($table->{$self->{sigil}} . $self->{name} . '[0]')))))) };
sub emit_python_name { my $self = $_[0]; return(((Main::bool((($self->{twigil} eq '.'))) ? ('v_self[0].v_' . $self->{name}) : ((Main::bool((($self->{name} eq '/'))) ? ($table->{$self->{sigil}} . 'MATCH') : ($table->{$self->{sigil}} . $self->{name})))))) }
}

;
{
package Proto;
sub new { shift; bless { @_ }, "Proto" }
sub name { $_[0]->{name} };
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; Python::tab($level) . Main::to_go_namespace($self->{name}) . '_proto' }
}

;
{
package Call;
sub new { shift; bless { @_ }, "Call" }
sub invocant { $_[0]->{invocant} };
sub hyper { $_[0]->{hyper} };
sub method { $_[0]->{method} };
sub arguments { $_[0]->{arguments} };
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; (my  $invocant = $self->{invocant}->emit_python()); if (Main::bool(($self->{method} eq 'new'))) { my  $List_str; for my $field ( @{$self->{arguments} || []} ) { if (Main::bool((Main::isa($field, 'Apply') && ($field->code() eq 'infix:<=>>')))) { push( @{$List_str}, 'v_' . $field->arguments()->[0]->buf() . '=' . $field->arguments()->[1]->emit_python() ) } else { die('Error in constructor, field: ', Main::perl($field, )) } }; return(Main::to_go_namespace($self->{invocant}->name()) . '(' . Main::join($List_str, ', ') . ')') } ; if (Main::bool((((((($self->{method} eq 'perl')) || (($self->{method} eq 'yaml'))) || (($self->{method} eq 'say'))) || (($self->{method} eq 'join'))) || (($self->{method} eq 'isa'))))) { if (Main::bool(($self->{hyper}))) { return('map(lambda: Main.' . $self->{method} . '( v_self[0], ' . Main::join(([ map { $_->emit_python() } @{ $self->{arguments} } ]), ', ') . ') , ' . $invocant . ')' . '
') } else { return('mp6_' . $self->{method} . '(' . $invocant . ', ' . Main::join(([ map { $_->emit_python() } @{ $self->{arguments} } ]), ', ') . ')') } } ; (my  $meth = $self->{method}); if (Main::bool(($meth eq 'postcircumfix:<( )>'))) { return(Python::tab($level) . $invocant . '(' . Main::join(([ map { $_->emit_python() } @{ $self->{arguments} } ]), ', ') . ')') } ; if (Main::bool(((($meth eq 'values')) || (($meth eq 'keys'))))) { return(Python::tab($level) . $invocant . '.' . $meth . '(' . Main::join(([ map { $_->emit_python() } @{ $self->{arguments} } ]), ', ') . ')') } ; if (Main::bool(($meth eq 'chars'))) { return(Python::tab($level) . 'len(' . $invocant . ')') } ; (my  $call = 'f_' . $meth . '(' . Main::join(([ map { $_->emit_python() } @{ $self->{arguments} } ]), ', ') . ')'); if (Main::bool(($self->{hyper}))) { Python::tab($level) . 'map(lambda x: x.' . $call . ', ' . $invocant . ')' } else { Python::tab($level) . $invocant . '.' . $call } }
}

;
{
package Apply;
sub new { shift; bless { @_ }, "Apply" }
sub code { $_[0]->{code} };
sub arguments { $_[0]->{arguments} };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; Python::tab($level) . $self->emit_python() };
sub emit_python { my $self = $_[0]; if (Main::bool(Main::isa(($self->{arguments}->[1]), 'Apply'))) { (my  $args2 = ($self->{arguments}->[1])->arguments()); if (Main::bool(Main::isa(($args2->[1]), 'Apply'))) { ($args2->[1] = Do->new(('block' => [$args2->[1]]))) }  } ; (my  $code = $self->{code}); if (Main::bool(Main::isa($code, 'Str'))) {  } else { return('(' . $self->{code}->emit_python() . ').(' . Main::join(([ map { $_->emit_python() } @{ $self->{arguments} } ]), ', ') . ')') }; if (Main::bool(($code eq 'self'))) { return('v_self[0]') } ; if (Main::bool(($code eq 'Mu'))) { return('mp6_Undef()') } ; if (Main::bool(($code eq 'make'))) { return('v_MATCH[0].__setattr__(\'v_capture\', ' . ($self->{arguments}->[0])->emit_python() . ')') } ; if (Main::bool(($code eq 'False'))) { return('False') } ; if (Main::bool(($code eq 'True'))) { return('True') } ; if (Main::bool(($code eq 'say'))) { return('mp6_say(' . Main::join(([ map { $_->emit_python() } @{ $self->{arguments} } ]), ', ') . ')') } ; if (Main::bool(($code eq 'print'))) { return('mp6_print(' . Main::join(([ map { $_->emit_python() } @{ $self->{arguments} } ]), ', ') . ')') } ; if (Main::bool(($code eq 'warn'))) { return('mp6_warn(' . Main::join(([ map { $_->emit_python() } @{ $self->{arguments} } ]), ', ') . ')') } ; if (Main::bool(($code eq 'array'))) { return('[' . Main::join(([ map { $_->emit_python() } @{ $self->{arguments} } ]), ' ') . ']') } ; if (Main::bool(($code eq 'Int'))) { return('mp6_to_num(' . ($self->{arguments}->[0])->emit_python(("" . ')'))) } ; if (Main::bool(($code eq 'Num'))) { return('mp6_to_num(' . ($self->{arguments}->[0])->emit_python(("" . ')'))) } ; if (Main::bool(($code eq 'prefix:<~>'))) { return('str(' . Main::join(([ map { $_->emit_python() } @{ $self->{arguments} } ]), ' ') . ')') } ; if (Main::bool(($code eq 'prefix:<!>'))) { return('not (' . Main::join(([ map { $_->emit_python() } @{ $self->{arguments} } ]), ' ') . ')') } ; if (Main::bool(($code eq 'prefix:<?>'))) { return('not (not (' . Main::join(([ map { $_->emit_python() } @{ $self->{arguments} } ]), ' ') . '))') } ; if (Main::bool(($code eq 'prefix:<$>'))) { return('mp6_to_scalar(' . Main::join(([ map { $_->emit_python() } @{ $self->{arguments} } ]), ' ') . ')') } ; if (Main::bool(($code eq 'prefix:<@>'))) { return('(' . Main::join(([ map { $_->emit_python() } @{ $self->{arguments} } ]), ' ') . ')') } ; if (Main::bool(($code eq 'prefix:<%>'))) { return('%{' . Main::join(([ map { $_->emit_python() } @{ $self->{arguments} } ]), ' ') . '}') } ; if (Main::bool(($code eq 'infix:<~>'))) { return('(str(' . Main::join(([ map { $_->emit_python() } @{ $self->{arguments} } ]), ') + str(') . '))') } ; if (Main::bool(($code eq 'infix:<+>'))) { return('(mp6_to_num(' . Main::join(([ map { $_->emit_python() } @{ $self->{arguments} } ]), ') + mp6_to_num(') . '))') } ; if (Main::bool(($code eq 'infix:<->'))) { return('(' . Main::join(([ map { $_->emit_python() } @{ $self->{arguments} } ]), ' - ') . ')') } ; if (Main::bool(($code eq 'infix:<*>'))) { return('(' . Main::join(([ map { $_->emit_python() } @{ $self->{arguments} } ]), ' * ') . ')') } ; if (Main::bool(($code eq 'infix:</>'))) { return('(' . Main::join(([ map { $_->emit_python() } @{ $self->{arguments} } ]), ' / ') . ')') } ; if (Main::bool(($code eq 'infix:<&&>'))) { return('(mp6_to_bool(' . ($self->{arguments}->[0])->emit_python() . ') ' . 'and mp6_to_bool(' . ($self->{arguments}->[1])->emit_python() . '))') } ; if (Main::bool(($code eq 'infix:<||>'))) { return('(mp6_to_bool(' . ($self->{arguments}->[0])->emit_python() . ') ' . 'or mp6_to_bool(' . ($self->{arguments}->[1])->emit_python() . '))') } ; if (Main::bool(($code eq 'infix:<eq>'))) { return('(str(' . Main::join(([ map { $_->emit_python() } @{ $self->{arguments} } ]), ') == str(') . '))') } ; if (Main::bool(($code eq 'infix:<ne>'))) { return('(str(' . Main::join(([ map { $_->emit_python() } @{ $self->{arguments} } ]), ') != str(') . '))') } ; if (Main::bool(($code eq 'infix:<==>'))) { return('(mp6_to_num(' . Main::join(([ map { $_->emit_python() } @{ $self->{arguments} } ]), ') == mp6_to_num(') . '))') } ; if (Main::bool(($code eq 'infix:<!=>'))) { return('(mp6_to_num(' . Main::join(([ map { $_->emit_python() } @{ $self->{arguments} } ]), ') != mp6_to_num(') . '))') } ; if (Main::bool(($code eq 'infix:<<>'))) { return('(mp6_to_num(' . Main::join(([ map { $_->emit_python() } @{ $self->{arguments} } ]), ') < mp6_to_num(') . '))') } ; if (Main::bool(($code eq 'infix:<>>'))) { return('(mp6_to_num(' . Main::join(([ map { $_->emit_python() } @{ $self->{arguments} } ]), ') > mp6_to_num(') . '))') } ; if (Main::bool(($code eq 'exists'))) { (my  $arg = $self->{arguments}->[0]); if (Main::bool(Main::isa($arg, 'Lookup'))) { return('(' . ($arg->obj())->emit_python() . ').has_key(' . ($arg->index_exp())->emit_python() . ')') }  } ; if (Main::bool(($code eq 'ternary:<?? !!>'))) { (my  $ast = Do->new(('block' => [If->new(('cond' => ($self->{arguments}->[0])), ('body' => [$self->{arguments}->[1]]), ('otherwise' => [$self->{arguments}->[2]]))]))); return($ast->emit_python()) } ; if (Main::bool(($code eq 'circumfix:<( )>'))) { return('(' . Main::join(([ map { $_->emit_python() } @{ $self->{arguments} } ]), ', ') . ')') } ; if (Main::bool(($code eq 'infix:<=>'))) { return(emit_bind($self->{arguments}->[0], $self->{arguments}->[1])) } ; if (Main::bool(($code eq 'return'))) { return('raise mp6_Return(' . Main::join(([ map { $_->emit_python() } @{ $self->{arguments} } ]), ', ') . ')') } ; if (Main::bool(($code eq 'substr'))) { return(($self->{arguments}->[0])->emit_python() . '[' . ($self->{arguments}->[1])->emit_python() . ':' . ($self->{arguments}->[1])->emit_python() . ' + ' . ($self->{arguments}->[2])->emit_python(("" . ']'))) } ; if (Main::bool(($code eq 'index'))) { return('mp6_index(' . ($self->{arguments}->[0])->emit_python() . ', ' . ($self->{arguments}->[1])->emit_python() . ')') } ; if (Main::bool(($code eq 'shift'))) { return(($self->{arguments}->[0])->emit_python() . '.f_shift()') } ; if (Main::bool(($code eq 'pop'))) { return(($self->{arguments}->[0])->emit_python() . '.f_pop()') } ; if (Main::bool(($code eq 'push'))) { return(($self->{arguments}->[0])->emit_python() . '.f_push(' . ($self->{arguments}->[1])->emit_python() . ')') } ; if (Main::bool(($code eq 'unshift'))) { return(($self->{arguments}->[0])->emit_python() . '.f_unshift(' . ($self->{arguments}->[1])->emit_python() . ')') } ; if (Main::bool($self->{namespace})) { return(Main::to_go_namespace($self->{namespace}) . '_proto.f_' . $self->{code} . '(' . Main::join(([ map { $_->emit_python() } @{ $self->{arguments} } ]), ', ') . ')') } ; 'f_' . $self->{code} . '(' . Main::join(([ map { $_->emit_python() } @{ $self->{arguments} } ]), ', ') . ')' };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; Python::tab($level) . $self->emit_python() };
sub emit_bind { my $parameters = $_[0]; my $arguments = $_[1]; if (Main::bool(Main::isa($parameters, 'Index'))) { return(($parameters->obj())->emit_python() . '.f_set(' . ($parameters->index_exp())->emit_python() . ', ' . $arguments->emit_python() . ')') } ; if (Main::bool(Main::isa($parameters, 'Lookup'))) { return(($parameters->obj())->emit_python() . '.f_set(' . ($parameters->index_exp())->emit_python() . ', ' . $arguments->emit_python() . ')') } ; if (Main::bool(Main::isa($parameters, 'Call'))) { return(($parameters->invocant())->emit_python() . '.__setattr__(\'v_' . $parameters->method(("" . '\', ') . $arguments->emit_python() . ')')) } ; return($parameters->emit_python() . ' = ' . $arguments->emit_python()) }
}

;
{
package If;
sub new { shift; bless { @_ }, "If" }
sub cond { $_[0]->{cond} };
sub body { $_[0]->{body} };
sub otherwise { $_[0]->{otherwise} };
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; (my  $has_body = (Main::bool(($self->{body} || [])) ? 1 : 0)); (my  $has_otherwise = (Main::bool(($self->{otherwise} || [])) ? 1 : 0)); (my  $body_block = Perlito::Python::LexicalBlock->new(('block' => $self->{body}))); (my  $otherwise_block = Perlito::Python::LexicalBlock->new(('block' => $self->{otherwise}))); if (Main::bool($body_block->has_my_decl())) { ($body_block = Do->new(('block' => $self->{body}))) } ; if (Main::bool(($has_otherwise && $otherwise_block->has_my_decl()))) { ($otherwise_block = Do->new(('block' => $self->{otherwise}))) } ; (my  $s = Python::tab($level) . 'if mp6_to_bool(' . $self->{cond}->emit_python() . '):' . '
' . $body_block->emit_python_indented(($level + 1))); if (Main::bool(($has_otherwise))) { ($s = $s . '
' . Python::tab($level) . 'else:' . '
' . $otherwise_block->emit_python_indented(($level + 1))) } ; return($s) }
}

;
{
package While;
sub new { shift; bless { @_ }, "While" }
sub init { $_[0]->{init} };
sub cond { $_[0]->{cond} };
sub continue { $_[0]->{continue} };
sub body { $_[0]->{body} };
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; (my  $body_block = Perlito::Python::LexicalBlock->new(('block' => $self->{body}))); if (Main::bool($body_block->has_my_decl())) { ($body_block = Do->new(('block' => $self->{body}))) } ; if (Main::bool(($self->{init} && $self->{continue}))) { die('not implemented (While)') } ; Python::tab($level) . 'while ' . $self->{cond}->emit_python() . ':' . '
' . $body_block->emit_python_indented(($level + 1)) }
}

;
{
package For;
sub new { shift; bless { @_ }, "For" }
sub cond { $_[0]->{cond} };
sub body { $_[0]->{body} };
sub topic { $_[0]->{topic} };
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; (my  $body_block = Perlito::Python::LexicalBlock->new(('block' => $self->{body}))); if (Main::bool($body_block->has_my_decl())) { (my  $label = '_anon_' . Perlito::Python::LexicalBlock::get_ident_python()); Perlito::Python::LexicalBlock::push_stmt_python(Perlito::Python::AnonSub->new(('name' => $label), ('block' => $self->{body}), ('sig' => Sig->new(('invocant' => undef), ('positional' => [$self->{topic}]), ('named' => {  }))), ('handles_return_exception' => 0))); return(Python::tab($level) . 'for ' . $self->{topic}->emit_python_name() . ' in ' . $self->{cond}->emit_python() . ':' . '
' . Python::tab(($level + 1)) . 'f_' . $label . '(' . $self->{topic}->emit_python_name() . ')') } ; Python::tab($level) . 'for ' . $self->{topic}->emit_python_name() . ' in ' . $self->{cond}->emit_python() . ':' . '
' . Python::tab(($level + 1)) . $self->{topic}->emit_python_name() . ' = [' . $self->{topic}->emit_python_name() . ']' . '
' . $body_block->emit_python_indented(($level + 1)) }
}

;
{
package Decl;
sub new { shift; bless { @_ }, "Decl" }
sub decl { $_[0]->{decl} };
sub type { $_[0]->{type} };
sub var { $_[0]->{var} };
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; (my  $decl = $self->{decl}); (my  $name = $self->{var}->name()); Python::tab($level) . ((Main::bool((($decl eq 'has'))) ? ('') : $self->{var}->emit_python())) };
sub emit_python_init { my $self = $_[0]; if (Main::bool((($self->{var})->sigil() eq '%'))) { return('mp6_Hash({})') } else { if (Main::bool((($self->{var})->sigil() eq '@'))) { return('mp6_Array([])') } else { return('mp6_Undef()') } }; return('') }
}

;
{
package Sig;
sub new { shift; bless { @_ }, "Sig" }
sub invocant { $_[0]->{invocant} };
sub positional { $_[0]->{positional} };
sub named { $_[0]->{named} };
sub emit_python { my $self = $_[0]; ' print \'Signature - TODO\'; die \'Signature - TODO\'; ' }
}

;
{
package Method;
sub new { shift; bless { @_ }, "Method" }
sub name { $_[0]->{name} };
sub sig { $_[0]->{sig} };
sub block { $_[0]->{block} };
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; (my  $sig = $self->{sig}); (my  $invocant = $sig->invocant()); (my  $pos = $sig->positional()); (my  $args = []); (my  $default_args = []); (my  $meth_args = []); push( @{$meth_args}, $invocant->emit_python_name() ); for my $field ( @{[@{($pos || []) || []}] || []} ) { (my  $arg = $field->emit_python_name()); push( @{$args}, $arg ); push( @{$default_args}, $arg . '=mp6_Undef()' ); push( @{$meth_args}, $arg . '=mp6_Undef()' ) }; (my  $label = '_anon_' . Perlito::Python::LexicalBlock::get_ident_python()); (my  $block = Perlito::Python::LexicalBlock->new(('block' => $self->{block}), ('needs_return' => 1))); my  $List_s; push( @{$List_s}, Python::tab($level) . 'def f_' . $label . '(' . Main::join($meth_args, ', ') . '):' ); push( @{$List_s}, Python::tab(($level + 1)) . $invocant->emit_python_name() . ' = [' . $invocant->emit_python_name() . ']' ); for my $field ( @{[@{(($args) || []) || []}] || []} ) { push( @{$List_s}, Python::tab(($level + 1)) . $field . ' = [' . $field . ']' ) }; push( @{$List_s}, Python::tab(($level + 1)) . 'try:' ); push( @{$List_s}, $block->emit_python_indented(($level + 2)) ); push( @{$List_s}, Python::tab(($level + 1)) . 'except mp6_Return, r:' ); push( @{$List_s}, Python::tab(($level + 2)) . 'return r.value' ); push( @{$List_s}, Python::tab($level) . 'self.__dict__.update(' . '{' . '\'f_' . $self->{name} . '\':f_' . $label . '})' ); return(Main::join($List_s, '
')) }
}

;
{
package Sub;
sub new { shift; bless { @_ }, "Sub" }
sub name { $_[0]->{name} };
sub sig { $_[0]->{sig} };
sub block { $_[0]->{block} };
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; (my  $label = '_anon_' . Perlito::Python::LexicalBlock::get_ident_python()); if (Main::bool((($self->{name} eq '')))) { Perlito::Python::LexicalBlock::push_stmt_python(Perlito::Python::AnonSub->new(('name' => $label), ('block' => $self->{block}), ('sig' => $self->{sig}), ('handles_return_exception' => 1))); return(Python::tab($level) . 'f_' . $label) } ; (my  $sig = $self->{sig}); (my  $pos = $sig->positional()); (my  $args = []); (my  $default_args = []); (my  $meth_args = ['self']); for my $field ( @{[@{($pos || []) || []}] || []} ) { (my  $arg = $field->emit_python_name()); push( @{$args}, $arg ); push( @{$default_args}, $arg . '=mp6_Undef()' ); push( @{$meth_args}, $arg . '=mp6_Undef()' ) }; (my  $block = Perlito::Python::LexicalBlock->new(('block' => $self->{block}), ('needs_return' => 1))); (my  $label2 = '_anon_' . Perlito::Python::LexicalBlock::get_ident_python()); my  $List_s; push( @{$List_s}, Python::tab($level) . 'def f_' . $self->{name} . '(' . Main::join($default_args, ', ') . '):' ); for my $field ( @{[@{(($args) || []) || []}] || []} ) { push( @{$List_s}, Python::tab(($level + 1)) . $field . ' = [' . $field . ']' ) }; push( @{$List_s}, Python::tab(($level + 1)) . 'try:' ); push( @{$List_s}, $block->emit_python_indented(($level + 2)) ); push( @{$List_s}, Python::tab(($level + 1)) . 'except mp6_Return, r:' ); push( @{$List_s}, Python::tab(($level + 2)) . 'return r.value' ); push( @{$List_s}, Python::tab($level) . 'global ' . $label2 ); push( @{$List_s}, Python::tab($level) . $label2 . ' = f_' . $self->{name} ); push( @{$List_s}, Python::tab($level) . 'def f_' . $label . '(' . Main::join($meth_args, ', ') . '):' ); push( @{$List_s}, Python::tab(($level + 1)) . 'return ' . $label2 . '(' . Main::join($args, ', ') . ')' ); push( @{$List_s}, Python::tab($level) . 'self.__dict__.update(' . '{' . '\'f_' . $self->{name} . '\':f_' . $label . '})' ); return(Main::join($List_s, '
')) }
}

;
{
package Do;
sub new { shift; bless { @_ }, "Do" }
sub block { $_[0]->{block} };
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; (my  $label = '_anon_' . Perlito::Python::LexicalBlock::get_ident_python()); Perlito::Python::LexicalBlock::push_stmt_python(Perlito::Python::AnonSub->new(('name' => $label), ('block' => $self->{block}), ('sig' => Sig->new(('invocant' => undef), ('positional' => []), ('named' => {  }))), ('handles_return_exception' => 0))); return(Python::tab($level) . 'f_' . $label . '()') }
}

;
{
package Use;
sub new { shift; bless { @_ }, "Use" }
sub mod { $_[0]->{mod} };
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; return('') }
}


}

1;
