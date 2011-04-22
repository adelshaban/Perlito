# Do not edit this file - Generated by Perlito 7.0
use v5;
use utf8;
use strict;
use warnings;
no warnings ('redefine', 'once', 'void', 'uninitialized', 'misc', 'recursion');
use Perlito::Perl5::Runtime;
use Perlito::Perl5::Prelude;
our $MATCH = Perlito::Match->new();
{
package GLOBAL;
sub new { shift; bless { @_ }, "GLOBAL" }

# use v6 
;
{
package Perlito::Javascript::LexicalBlock;
sub new { shift; bless { @_ }, "Perlito::Javascript::LexicalBlock" }
sub block { $_[0]->{block} };
sub needs_return { $_[0]->{needs_return} };
sub top_level { $_[0]->{top_level} };
sub emit_javascript { my $self = $_[0]; $self->emit_javascript_indented(0) };
sub emit_javascript_indented { my $self = $_[0]; my $level = $_[1]; (my  $List_block = []); for ( @{$self->{block} || []} ) { if (Main::bool(defined($_))) { push( @{$List_block}, $_ ) }  }; if (Main::bool(!Main::bool($List_block))) { return scalar ('null;') } ; ((my  $str = undef) = ''); for my $decl ( @{$List_block || []} ) { if (Main::bool((Main::isa($decl, 'Decl') && ($decl->decl() eq 'my')))) { ($str = $str . $decl->emit_javascript_init()) } ; if (Main::bool((Main::isa($decl, 'Apply') && ($decl->code() eq 'infix:<=>')))) { ((my  $var = undef) = $decl->arguments()->[0]); if (Main::bool((Main::isa($var, 'Decl') && ($var->decl() eq 'my')))) { ($str = $str . $var->emit_javascript_init()) }  }  }; (my  $last_statement = undef); if (Main::bool($self->{needs_return})) { ($last_statement = pop( @{$List_block} )) } ; for my $decl ( @{$List_block || []} ) { if (Main::bool(!Main::bool(((Main::isa($decl, 'Decl') && ($decl->decl() eq 'my')))))) { ($str = $str . $decl->emit_javascript() . ';') }  }; if (Main::bool(($self->{needs_return} && $last_statement))) { if (Main::bool(Main::isa($last_statement, 'If'))) { ((my  $cond = undef) = $last_statement->cond()); ((my  $body = undef) = $last_statement->body()); ((my  $otherwise = undef) = $last_statement->otherwise()); if (Main::bool((Main::isa($cond, 'Var') && ($cond->sigil() eq '@')))) { ($cond = Apply->new(('code' => 'prefix:<@>'), ('arguments' => do { (my  $List_a = []); (my  $List_v = []); push( @{$List_a}, $cond ); $List_a }))) } ; ($body = Perlito::Javascript::LexicalBlock->new(('block' => $body->stmts()), ('needs_return' => 1))); ($str = $str . 'if ( f_bool(' . $cond->emit_javascript() . ') ) { ' . 'return (function () { ' . $body->emit_javascript() . ' })(); }'); if (Main::bool($otherwise)) { ($otherwise = Perlito::Javascript::LexicalBlock->new(('block' => $otherwise->stmts()), ('needs_return' => 1))); ($str = $str . ' else { ' . 'return (function () { ' . $otherwise->emit_javascript() . ' })(); }') }  } else { if (Main::bool(((Main::isa($last_statement, 'Apply') && ($last_statement->code() eq 'return')) || Main::isa($last_statement, 'For')))) { ($str = $str . $last_statement->emit_javascript()) } else { ($str = $str . 'return(' . $last_statement->emit_javascript() . ')') } } } ; if (Main::bool($self->{top_level})) { ($str = 'try { ' . $str . '; } catch(err) { ' . 'if ( err instanceof Error ) { ' . 'throw(err); ' . '} ' . 'else { ' . 'return(err); ' . '} ' . '} ') } ; return scalar ($str . ';') }
}

;
{
package CompUnit;
sub new { shift; bless { @_ }, "CompUnit" }
sub name { $_[0]->{name} };
sub attributes { $_[0]->{attributes} };
sub methods { $_[0]->{methods} };
sub body { $_[0]->{body} };
sub emit_javascript { my $self = $_[0]; $self->emit_javascript_indented(0) };
sub emit_javascript_indented { my $self = $_[0]; my $level = $_[1]; ((my  $class_name = undef) = Main::to_javascript_namespace($self->{name})); ((my  $str = undef) = '// class ' . $self->{name} . '
' . 'if (typeof ' . $class_name . ' !== \'object\') {' . '
' . '  ' . $class_name . ' = function() {};' . '
' . '  ' . $class_name . ' = new ' . $class_name . ';' . '
' . '  ' . $class_name . '.f_isa = function (s) { return s == \'' . $self->{name} . '\'; };' . '
' . '  ' . $class_name . '.f_perl = function () { return \'' . $self->{name} . '.new(\' + Main._dump(this) + \')\'; };' . '
' . '}' . '
' . '(function () {' . '
' . '  var v__NAMESPACE = ' . $class_name . ';' . '
'); for my $decl ( @{$self->{body} || []} ) { if (Main::bool((Main::isa($decl, 'Decl') && (($decl->decl() eq 'my'))))) { ($str = $str . $decl->emit_javascript_init()) } ; if (Main::bool((Main::isa($decl, 'Apply') && ($decl->code() eq 'infix:<=>')))) { ((my  $var = undef) = $decl->arguments()->[0]); if (Main::bool((Main::isa($var, 'Decl') && ($var->decl() eq 'my')))) { ($str = $str . $var->emit_javascript_init()) }  }  }; for my $decl ( @{$self->{body} || []} ) { if (Main::bool((Main::isa($decl, 'Decl') && (($decl->decl() eq 'has'))))) { ($str = $str . '  // accessor ' . $decl->var()->name() . '
' . '  ' . $class_name . '.v_' . $decl->var()->name() . ' = null;' . '
' . '  ' . $class_name . '.f_' . $decl->var()->name() . ' = function () { return this.v_' . $decl->var()->name() . '; };' . '
') } ; if (Main::bool(Main::isa($decl, 'Method'))) { ((my  $sig = undef) = $decl->sig()); ((my  $pos = undef) = $sig->positional()); ((my  $invocant = undef) = $sig->invocant()); ((my  $block = undef) = Perlito::Javascript::LexicalBlock->new(('block' => $decl->block()), ('needs_return' => 1), ('top_level' => 1))); ($str = $str . '  // method ' . $decl->name() . '
' . '  ' . $class_name . '.f_' . $decl->name() . ' = function (' . Main::join(([ map { $_->emit_javascript() } @{( $pos )} ]), ', ') . ') {' . '
' . '    var ' . $invocant->emit_javascript() . ' = this;' . '
' . '    ' . $block->emit_javascript() . '
' . '  }' . '
' . '  ' . $class_name . '.f_' . $decl->name() . ';  // v8 bug workaround' . '
') } ; if (Main::bool(Main::isa($decl, 'Sub'))) { ((my  $sig = undef) = $decl->sig()); ((my  $pos = undef) = $sig->positional()); ((my  $block = undef) = Perlito::Javascript::LexicalBlock->new(('block' => $decl->block()), ('needs_return' => 1), ('top_level' => 1))); ($str = $str . '  // sub ' . $decl->name() . '
' . '  ' . $class_name . '.f_' . $decl->name() . ' = function (' . Main::join(([ map { $_->emit_javascript() } @{( $pos )} ]), ', ') . ') {' . '
' . '    ' . $block->emit_javascript() . '
' . '  }' . '
') }  }; for my $decl ( @{$self->{body} || []} ) { if (Main::bool((((!Main::bool(((Main::isa($decl, 'Decl') && (((($decl->decl() eq 'has')) || (($decl->decl() eq 'my')))))))) && (!Main::bool((Main::isa($decl, 'Method'))))) && (!Main::bool((Main::isa($decl, 'Sub'))))))) { ($str = $str . ($decl)->emit_javascript() . ';') }  }; ($str = $str . '}' . ')()' . '
') };
sub emit_javascript_program { my $comp_units = $_[0]; ((my  $str = undef) = ''); for my $comp_unit ( @{(($comp_units) || []) || []} ) { ($str = $str . $comp_unit->emit_javascript()) }; return scalar ($str) }
}

;
{
package Val::Int;
sub new { shift; bless { @_ }, "Val::Int" }
sub int { $_[0]->{int} };
sub emit_javascript { my $self = $_[0]; $self->emit_javascript_indented(0) };
sub emit_javascript_indented { my $self = $_[0]; my $level = $_[1]; $self->{int} }
}

;
{
package Val::Bit;
sub new { shift; bless { @_ }, "Val::Bit" }
sub bit { $_[0]->{bit} };
sub emit_javascript { my $self = $_[0]; $self->emit_javascript_indented(0) };
sub emit_javascript_indented { my $self = $_[0]; my $level = $_[1]; (Main::bool($self->{bit}) ? 'true' : 'false') }
}

;
{
package Val::Num;
sub new { shift; bless { @_ }, "Val::Num" }
sub num { $_[0]->{num} };
sub emit_javascript { my $self = $_[0]; $self->emit_javascript_indented(0) };
sub emit_javascript_indented { my $self = $_[0]; my $level = $_[1]; $self->{num} }
}

;
{
package Val::Buf;
sub new { shift; bless { @_ }, "Val::Buf" }
sub buf { $_[0]->{buf} };
sub emit_javascript { my $self = $_[0]; $self->emit_javascript_indented(0) };
sub emit_javascript_indented { my $self = $_[0]; my $level = $_[1]; '"' . Main::javascript_escape_string($self->{buf}) . '"' }
}

;
{
package Lit::Block;
sub new { shift; bless { @_ }, "Lit::Block" }
sub sig { $_[0]->{sig} };
sub stmts { $_[0]->{stmts} };
sub emit_javascript { my $self = $_[0]; $self->emit_javascript_indented(0) };
sub emit_javascript_indented { my $self = $_[0]; my $level = $_[1]; if (Main::bool(scalar( @{$self->{stmts}} ))) { return scalar (Main::join(([ map { $_->emit_javascript() } @{( $self->{stmts} )} ]), '; ') . ';') } else {  }; return scalar ('') }
}

;
{
package Lit::Array;
sub new { shift; bless { @_ }, "Lit::Array" }
sub array1 { $_[0]->{array1} };
sub emit_javascript { my $self = $_[0]; $self->emit_javascript_indented(0) };
sub emit_javascript_indented { my $self = $_[0]; my $level = $_[1]; ((my  $ast = undef) = $self->expand_interpolation()); return scalar ($ast->emit_javascript()) }
}

;
{
package Lit::Hash;
sub new { shift; bless { @_ }, "Lit::Hash" }
sub hash1 { $_[0]->{hash1} };
sub emit_javascript { my $self = $_[0]; $self->emit_javascript_indented(0) };
sub emit_javascript_indented { my $self = $_[0]; my $level = $_[1]; ((my  $ast = undef) = $self->expand_interpolation()); return scalar ($ast->emit_javascript()) }
}

;
{
package Index;
sub new { shift; bless { @_ }, "Index" }
sub obj { $_[0]->{obj} };
sub index_exp { $_[0]->{index_exp} };
sub emit_javascript { my $self = $_[0]; $self->emit_javascript_indented(0) };
sub emit_javascript_indented { my $self = $_[0]; my $level = $_[1]; $self->{obj}->emit_javascript() . '[' . $self->{index_exp}->emit_javascript() . ']' }
}

;
{
package Lookup;
sub new { shift; bless { @_ }, "Lookup" }
sub obj { $_[0]->{obj} };
sub index_exp { $_[0]->{index_exp} };
sub emit_javascript { my $self = $_[0]; $self->emit_javascript_indented(0) };
sub emit_javascript_indented { my $self = $_[0]; my $level = $_[1]; ((my  $str = undef) = ''); ((my  $var = undef) = $self->{obj}); (my  $var_js = undef); if (Main::bool(Main::isa($var, 'Lookup'))) { ((my  $var1 = undef) = $var->obj()); ((my  $var1_js = undef) = $var1->emit_javascript()); ($str = $str . 'if (' . $var1_js . ' == null) { ' . $var1_js . ' = {} }; '); ($var_js = $var1_js . '[' . $var->index_exp()->emit_javascript() . ']') } else { ($var_js = $var->emit_javascript()) }; ($str = $str . 'if (' . $var_js . ' == null) { ' . $var_js . ' = {} }; '); ((my  $index_js = undef) = $self->{index_exp}->emit_javascript()); ($str = $str . 'return (' . $var_js . '[' . $index_js . '] ' . '); '); return scalar ('(function () { ' . $str . '})()') }
}

;
{
package Var;
sub new { shift; bless { @_ }, "Var" }
sub sigil { $_[0]->{sigil} };
sub twigil { $_[0]->{twigil} };
sub namespace { $_[0]->{namespace} };
sub name { $_[0]->{name} };
sub emit_javascript { my $self = $_[0]; $self->emit_javascript_indented(0) };
sub emit_javascript_indented { my $self = $_[0]; my $level = $_[1]; ((my  $table = undef) = do { (my  $Hash_a = {}); ($Hash_a->{'$'} = 'v_'); ($Hash_a->{'@'} = 'List_'); ($Hash_a->{'%'} = 'Hash_'); ($Hash_a->{'&'} = 'Code_'); $Hash_a }); ((my  $ns = undef) = ''); if (Main::bool($self->{namespace})) { ($ns = Main::to_javascript_namespace($self->{namespace}) . '.') } ; (Main::bool((($self->{twigil} eq '.'))) ? ('v_self.v_' . $self->{name} . '') : ((Main::bool((($self->{name} eq '/'))) ? ($table->{$self->{sigil}} . 'MATCH') : ($table->{$self->{sigil}} . $ns . $self->{name})))) };
sub plain_name { my $self = $_[0]; if (Main::bool($self->{namespace})) { return scalar ($self->{namespace} . '.' . $self->{name}) } ; return scalar ($self->{name}) }
}

;
{
package Proto;
sub new { shift; bless { @_ }, "Proto" }
sub name { $_[0]->{name} };
sub emit_javascript { my $self = $_[0]; $self->emit_javascript_indented(0) };
sub emit_javascript_indented { my $self = $_[0]; my $level = $_[1]; Main::to_javascript_namespace($self->{name}) }
}

;
{
package Call;
sub new { shift; bless { @_ }, "Call" }
sub invocant { $_[0]->{invocant} };
sub hyper { $_[0]->{hyper} };
sub method { $_[0]->{method} };
sub arguments { $_[0]->{arguments} };
sub emit_javascript { my $self = $_[0]; $self->emit_javascript_indented(0) };
sub emit_javascript_indented { my $self = $_[0]; my $level = $_[1]; ((my  $invocant = undef) = $self->{invocant}->emit_javascript()); if (Main::bool(($invocant eq 'self'))) { ($invocant = 'v_self') } ; if (Main::bool(($self->{method} eq 'new'))) { ((my  $str = undef) = do { (my  $List_a = []); (my  $List_v = []); $List_a }); for my $field ( @{$self->{arguments} || []} ) { if (Main::bool((Main::isa($field, 'Apply') && ($field->code() eq 'infix:<=>>')))) { push( @{$str}, 'v_' . $field->arguments()->[0]->buf() . ': ' . $field->arguments()->[1]->emit_javascript() ) } else { die('Error in constructor, field: ', Main::perl($field, )) } }; return scalar ('(function () { ' . 'var tmp = {' . Main::join($str, ',') . '}; ' . 'tmp.__proto__ = ' . Main::to_javascript_namespace($invocant) . '; ' . 'return tmp; ' . '})()') } ; if (Main::bool(((((((((((($self->{method} eq 'perl')) || (($self->{method} eq 'isa'))) || (($self->{method} eq 'id'))) || (($self->{method} eq 'scalar'))) || (($self->{method} eq 'keys'))) || (($self->{method} eq 'values'))) || (($self->{method} eq 'pairs'))) || (($self->{method} eq 'elems'))) || (($self->{method} eq 'say'))) || (($self->{method} eq 'chars'))))) { if (Main::bool(($self->{hyper}))) { return scalar ('(function (a_) { ' . 'var out = []; ' . 'if ( a_ == null ) { return out; }; ' . 'for(var i = 0; i < a_.length; i++) { ' . 'out.push( f_' . $self->{method} . '(a_[i]) ) } return out;' . ' })(' . $invocant . ')') } ; return scalar ('f_' . $self->{method} . '(' . $invocant . ((Main::bool(($self->{arguments} || [])) ? ', ' . Main::join(([ map { $_->emit_javascript() } @{( $self->{arguments} )} ]), ', ') : '')) . ')') } ; if (Main::bool((((((($self->{method} eq 'join')) || (($self->{method} eq 'shift'))) || (($self->{method} eq 'unshift'))) || (($self->{method} eq 'push'))) || (($self->{method} eq 'pop'))))) { return scalar ($invocant . '.' . $self->{method} . '(' . Main::join(([ map { $_->emit_javascript() } @{( $self->{arguments} )} ]), ', ') . ')') } ; ((my  $meth = undef) = $self->{method}); if (Main::bool(($self->{hyper}))) { return scalar ('(function (a_) { ' . 'var out = []; ' . 'if ( a_ == null ) { return out; }; ' . 'for(var i = 0; i < a_.length; i++) { ' . 'out.push( a_[i].f_' . $meth . '(' . Main::join(([ map { $_->emit_javascript() } @{( $self->{arguments} )} ]), ', ') . ') ) ' . '}; ' . 'return out;' . ' })(' . $invocant . ')') } ; if (Main::bool(($meth eq 'postcircumfix:<( )>'))) { return scalar ('(' . $invocant . ')(' . Main::join(([ map { $_->emit_javascript() } @{( $self->{arguments} )} ]), ', ') . ')') } ; return scalar ($invocant . '.f_' . $meth . '(' . Main::join(([ map { $_->emit_javascript() } @{( $self->{arguments} )} ]), ', ') . ')') }
}

;
{
package Apply;
sub new { shift; bless { @_ }, "Apply" }
sub code { $_[0]->{code} };
sub arguments { $_[0]->{arguments} };
sub namespace { $_[0]->{namespace} };
sub emit_javascript { my $self = $_[0]; $self->emit_javascript_indented(0) };
sub emit_javascript_indented { my $self = $_[0]; my $level = $_[1]; ((my  $code = undef) = $self->{code}); if (Main::bool(Main::isa($code, 'Str'))) {  } else { return scalar ('(' . $self->{code}->emit_javascript() . ')->(' . Main::join(([ map { $_->emit() } @{( $self->{arguments} )} ]), ', ') . ')') }; if (Main::bool(($code eq 'self'))) { return scalar ('v_self') } ; if (Main::bool(($code eq 'Mu'))) { return scalar ('null') } ; if (Main::bool(($code eq 'make'))) { return scalar ('(v_MATCH.v_capture = ' . Main::join(([ map { $_->emit_javascript() } @{( $self->{arguments} )} ]), ', ') . ')') } ; if (Main::bool(($code eq 'defined'))) { return scalar ('(' . Main::join(([ map { $_->emit_javascript() } @{( $self->{arguments} )} ]), ' ') . ' != null)') } ; if (Main::bool(($code eq 'substr'))) { return scalar ('(' . ($self->{arguments}->[0])->emit_javascript() . ' || "").substr(' . ($self->{arguments}->[1])->emit_javascript() . ', ' . ($self->{arguments}->[2])->emit_javascript() . ')') } ; if (Main::bool(($code eq 'Int'))) { return scalar ('parseInt(' . ($self->{arguments}->[0])->emit_javascript() . ')') } ; if (Main::bool(($code eq 'Num'))) { return scalar ('parseFloat(' . ($self->{arguments}->[0])->emit_javascript() . ')') } ; if (Main::bool(($code eq 'prefix:<~>'))) { return scalar ('(' . Main::join(([ map { $_->emit_javascript() } @{( $self->{arguments} )} ]), ' ') . ').f_string()') } ; if (Main::bool(($code eq 'prefix:<!>'))) { return scalar ('( f_bool(' . Main::join(([ map { $_->emit_javascript() } @{( $self->{arguments} )} ]), ' ') . ') ? false : true)') } ; if (Main::bool(($code eq 'prefix:<?>'))) { return scalar ('( f_bool(' . Main::join(([ map { $_->emit_javascript() } @{( $self->{arguments} )} ]), ' ') . ') ? true : false)') } ; if (Main::bool(($code eq 'prefix:<$>'))) { return scalar ('f_scalar(' . Main::join(([ map { $_->emit_javascript() } @{( $self->{arguments} )} ]), ' ') . ')') } ; if (Main::bool(($code eq 'prefix:<@>'))) { return scalar ('(' . Main::join(([ map { $_->emit_javascript() } @{( $self->{arguments} )} ]), ' ') . ')') } ; if (Main::bool(($code eq 'prefix:<%>'))) { return scalar ('(' . Main::join(([ map { $_->emit_javascript() } @{( $self->{arguments} )} ]), ' ') . ').f_hash()') } ; if (Main::bool(($code eq 'postfix:<++>'))) { return scalar ('(' . Main::join(([ map { $_->emit_javascript() } @{( $self->{arguments} )} ]), ' ') . ')++') } ; if (Main::bool(($code eq 'postfix:<-->'))) { return scalar ('(' . Main::join(([ map { $_->emit_javascript() } @{( $self->{arguments} )} ]), ' ') . ')--') } ; if (Main::bool(($code eq 'prefix:<++>'))) { return scalar ('++(' . Main::join(([ map { $_->emit_javascript() } @{( $self->{arguments} )} ]), ' ') . ')') } ; if (Main::bool(($code eq 'prefix:<-->'))) { return scalar ('--(' . Main::join(([ map { $_->emit_javascript() } @{( $self->{arguments} )} ]), ' ') . ')') } ; if (Main::bool(($code eq 'list:<~>'))) { return scalar ('(f_string(' . Main::join(([ map { $_->emit_javascript() } @{( $self->{arguments} )} ]), ') + f_string(') . '))') } ; if (Main::bool(($code eq 'infix:<+>'))) { return scalar ('f_add(' . Main::join(([ map { $_->emit_javascript() } @{( $self->{arguments} )} ]), ', ') . ')') } ; if (Main::bool(($code eq 'infix:<->'))) { return scalar ('(' . Main::join(([ map { $_->emit_javascript() } @{( $self->{arguments} )} ]), ' - ') . ')') } ; if (Main::bool(($code eq 'infix:<*>'))) { return scalar ('(' . Main::join(([ map { $_->emit_javascript() } @{( $self->{arguments} )} ]), ' * ') . ')') } ; if (Main::bool(($code eq 'infix:</>'))) { return scalar ('(' . Main::join(([ map { $_->emit_javascript() } @{( $self->{arguments} )} ]), ' / ') . ')') } ; if (Main::bool(($code eq 'infix:<>>'))) { return scalar ('(' . Main::join(([ map { $_->emit_javascript() } @{( $self->{arguments} )} ]), ' > ') . ')') } ; if (Main::bool(($code eq 'infix:<<>'))) { return scalar ('(' . Main::join(([ map { $_->emit_javascript() } @{( $self->{arguments} )} ]), ' < ') . ')') } ; if (Main::bool(($code eq 'infix:<>=>'))) { return scalar ('(' . Main::join(([ map { $_->emit_javascript() } @{( $self->{arguments} )} ]), ' >= ') . ')') } ; if (Main::bool(($code eq 'infix:<<=>'))) { return scalar ('(' . Main::join(([ map { $_->emit_javascript() } @{( $self->{arguments} )} ]), ' <= ') . ')') } ; if (Main::bool(($code eq 'infix:<=>>'))) { return scalar ('(' . Main::join(([ map { $_->emit_javascript() } @{( $self->{arguments} )} ]), ', ') . ')') } ; if (Main::bool(($code eq 'infix:<..>'))) { return scalar ('(function (a) { ' . 'for (var i=' . $self->{arguments}->[0]->emit_javascript() . ', l=' . $self->{arguments}->[1]->emit_javascript() . '; ' . 'i<=l; ++i)' . '{ ' . 'a.push(i) ' . '}; ' . 'return a ' . '})([])') } ; if (Main::bool((($code eq 'infix:<&&>') || ($code eq 'infix:<and>')))) { return scalar ('f_and(' . $self->{arguments}->[0]->emit_javascript() . ', ' . 'function () { return ' . $self->{arguments}->[1]->emit_javascript() . '; })') } ; if (Main::bool((($code eq 'infix:<||>') || ($code eq 'infix:<or>')))) { return scalar ('f_or(' . $self->{arguments}->[0]->emit_javascript() . ', ' . 'function () { return ' . $self->{arguments}->[1]->emit_javascript() . '; })') } ; if (Main::bool(($code eq 'infix:<//>'))) { return scalar ('f_defined_or(' . $self->{arguments}->[0]->emit_javascript() . ', ' . 'function () { return ' . $self->{arguments}->[1]->emit_javascript() . '; })') } ; if (Main::bool(($code eq 'infix:<eq>'))) { return scalar ('(' . Main::join(([ map { $_->emit_javascript() } @{( $self->{arguments} )} ]), ' == ') . ')') } ; if (Main::bool(($code eq 'infix:<ne>'))) { return scalar ('(' . Main::join(([ map { $_->emit_javascript() } @{( $self->{arguments} )} ]), ' != ') . ')') } ; if (Main::bool(($code eq 'infix:<ge>'))) { return scalar ('(' . Main::join(([ map { $_->emit_javascript() } @{( $self->{arguments} )} ]), ' >= ') . ')') } ; if (Main::bool(($code eq 'infix:<le>'))) { return scalar ('(' . Main::join(([ map { $_->emit_javascript() } @{( $self->{arguments} )} ]), ' <= ') . ')') } ; if (Main::bool(($code eq 'infix:<==>'))) { return scalar ('(' . Main::join(([ map { $_->emit_javascript() } @{( $self->{arguments} )} ]), ' == ') . ')') } ; if (Main::bool(($code eq 'infix:<!=>'))) { return scalar ('(' . Main::join(([ map { $_->emit_javascript() } @{( $self->{arguments} )} ]), ' != ') . ')') } ; if (Main::bool(($code eq 'infix:<===>'))) { return scalar ('(f_id(' . ($self->{arguments}->[0])->emit_javascript() . ') == f_id(' . ($self->{arguments}->[1])->emit_javascript() . '))') } ; if (Main::bool(($code eq 'exists'))) { ((my  $arg = undef) = $self->{arguments}->[0]); if (Main::bool(Main::isa($arg, 'Lookup'))) { return scalar ('(' . ($arg->obj())->emit_javascript() . ').hasOwnProperty(' . ($arg->index_exp())->emit_javascript() . ')') }  } ; if (Main::bool(($code eq 'ternary:<?? !!>'))) { return scalar ('( f_bool(' . ($self->{arguments}->[0])->emit_javascript() . ')' . ' ? ' . ($self->{arguments}->[1])->emit_javascript() . ' : ' . ($self->{arguments}->[2])->emit_javascript() . ')') } ; if (Main::bool(($code eq 'circumfix:<( )>'))) { return scalar ('(' . Main::join(([ map { $_->emit_javascript() } @{( $self->{arguments} )} ]), ', ') . ')') } ; if (Main::bool(($code eq 'infix:<=>'))) { return scalar (emit_javascript_bind($self->{arguments}->[0], $self->{arguments}->[1])) } ; if (Main::bool(($code eq 'return'))) { return scalar ('throw(' . ((Main::bool(($self->{arguments} || [])) ? $self->{arguments}->[0]->emit_javascript() : 'null')) . ')') } ; ($code = 'f_' . $self->{code}); if (Main::bool($self->{namespace})) { ($code = Main::to_javascript_namespace($self->{namespace}) . '.' . $code) } else { if (Main::bool(((((((((((($code ne 'f_index')) && (($code ne 'f_die'))) && (($code ne 'f_shift'))) && (($code ne 'f_unshift'))) && (($code ne 'f_push'))) && (($code ne 'f_pop'))) && (($code ne 'f_chr'))) && (($code ne 'f_say'))) && (($code ne 'f_print'))) && (($code ne 'f_warn'))))) { ($code = 'v__NAMESPACE.' . $code) }  }; $code . '(' . Main::join(([ map { $_->emit_javascript() } @{( $self->{arguments} )} ]), ', ') . ')' };
sub emit_javascript_bind { my $parameters = $_[0]; my $arguments = $_[1]; if (Main::bool(Main::isa($parameters, 'Lit::Array'))) { ((my  $a = undef) = $parameters->array1()); ((my  $str = undef) = 'do { '); ((my  $i = undef) = 0); for my $var ( @{($a || []) || []} ) { ($str = $str . ' ' . emit_javascript_bind($var, Index->new(('obj' => $arguments), ('index_exp' => Val::Int->new(('int' => $i))))) . '; '); ($i = ($i + 1)) }; return scalar ($str . $parameters->emit_javascript() . ' }') } ; if (Main::bool(Main::isa($parameters, 'Lit::Hash'))) { ((my  $a = undef) = $parameters->hash1()); ((my  $b = undef) = $arguments->hash1()); ((my  $str = undef) = 'do { '); ((my  $i = undef) = 0); (my  $arg = undef); for my $var ( @{($a || []) || []} ) { ($arg = Apply->new(('code' => 'Mu'))); for my $var2 ( @{($b || []) || []} ) { if (Main::bool((($var2->[0])->buf() eq ($var->[0])->buf()))) { ($arg = $var2->[1]) }  }; ($str = $str . ' ' . emit_javascript_bind($var->[1], $arg) . '; '); ($i = ($i + 1)) }; return scalar ($str . $parameters->emit_javascript() . ' }') } ; if (Main::bool(Main::isa($parameters, 'Call'))) { return scalar ('(' . ($parameters->invocant())->emit_javascript() . '.v_' . $parameters->method() . ' = ' . $arguments->emit_javascript() . ')') } ; if (Main::bool(Main::isa($parameters, 'Lookup'))) { ((my  $str = undef) = ''); ((my  $var = undef) = $parameters->obj()); (my  $var_js = undef); if (Main::bool(Main::isa($var, 'Lookup'))) { ((my  $var1 = undef) = $var->obj()); ((my  $var1_js = undef) = $var1->emit_javascript()); ($str = $str . 'if (' . $var1_js . ' == null) { ' . $var1_js . ' = {} }; '); ($var_js = $var1_js . '[' . $var->index_exp()->emit_javascript() . ']') } else { ($var_js = $var->emit_javascript()) }; ($str = $str . 'if (' . $var_js . ' == null) { ' . $var_js . ' = {} }; '); ((my  $index_js = undef) = $parameters->index_exp()->emit_javascript()); ($str = $str . 'return (' . $var_js . '[' . $index_js . '] ' . ' = ' . $arguments->emit_javascript() . '); '); return scalar ('(function () { ' . $str . '})()') } ; if (Main::bool(Main::isa($parameters, 'Index'))) { ((my  $str = undef) = ''); ((my  $var = undef) = $parameters->obj()); (my  $var_js = undef); if (Main::bool(Main::isa($var, 'Index'))) { ((my  $var1 = undef) = $var->obj()); ((my  $var1_js = undef) = $var1->emit_javascript()); ($str = $str . 'if (' . $var1_js . ' == null) { ' . $var1_js . ' = [] }; '); ($var_js = $var1_js . '[' . $var->index_exp()->emit_javascript() . ']') } else { ($var_js = $var->emit_javascript()) }; ($str = $str . 'if (' . $var_js . ' == null) { ' . $var_js . ' = [] }; '); ((my  $index_js = undef) = $parameters->index_exp()->emit_javascript()); ($str = $str . 'return (' . $var_js . '[' . $index_js . '] ' . ' = ' . $arguments->emit_javascript() . '); '); return scalar ('(function () { ' . $str . '})()') } ; if (Main::bool(((Main::isa($parameters, 'Var') && ($parameters->sigil() eq '@')) || (Main::isa($parameters, 'Decl') && ($parameters->var()->sigil() eq '@'))))) { ($arguments = Lit::Array->new(('array1' => do { (my  $List_a = []); (my  $List_v = []); push( @{$List_a}, $arguments ); $List_a }))) } else { if (Main::bool(((Main::isa($parameters, 'Var') && ($parameters->sigil() eq '%')) || (Main::isa($parameters, 'Decl') && ($parameters->var()->sigil() eq '%'))))) { ($arguments = Lit::Hash->new(('hash1' => do { (my  $List_a = []); (my  $List_v = []); push( @{$List_a}, $arguments ); $List_a }))) }  }; '(' . $parameters->emit_javascript() . ' = ' . $arguments->emit_javascript() . ')' }
}

;
{
package If;
sub new { shift; bless { @_ }, "If" }
sub cond { $_[0]->{cond} };
sub body { $_[0]->{body} };
sub otherwise { $_[0]->{otherwise} };
sub emit_javascript { my $self = $_[0]; $self->emit_javascript_indented(0) };
sub emit_javascript_indented { my $self = $_[0]; my $level = $_[1]; ((my  $cond = undef) = $self->{cond}); if (Main::bool((Main::isa($cond, 'Var') && ($cond->sigil() eq '@')))) { ($cond = Apply->new(('code' => 'prefix:<@>'), ('arguments' => do { (my  $List_a = []); (my  $List_v = []); push( @{$List_a}, $cond ); $List_a }))) } ; ((my  $body = undef) = Perlito::Javascript::LexicalBlock->new(('block' => $self->{body}->stmts()), ('needs_return' => 0))); ((my  $s = undef) = 'if ( f_bool(' . $cond->emit_javascript() . ') ) { ' . '(function () { ' . $body->emit_javascript() . ' })(); }'); if (Main::bool($self->{otherwise})) { ((my  $otherwise = undef) = Perlito::Javascript::LexicalBlock->new(('block' => $self->{otherwise}->stmts()), ('needs_return' => 0))); ($s = $s . ' else { ' . '(function () { ' . $otherwise->emit_javascript() . ' })(); }') } ; return scalar ($s) }
}

;
{
package While;
sub new { shift; bless { @_ }, "While" }
sub init { $_[0]->{init} };
sub cond { $_[0]->{cond} };
sub continue { $_[0]->{continue} };
sub body { $_[0]->{body} };
sub emit_javascript { my $self = $_[0]; $self->emit_javascript_indented(0) };
sub emit_javascript_indented { my $self = $_[0]; my $level = $_[1]; ((my  $body = undef) = Perlito::Javascript::LexicalBlock->new(('block' => $self->{body}->stmts()), ('needs_return' => 0))); return scalar ('for ( ' . ((Main::bool($self->{init}) ? $self->{init}->emit_javascript() . '; ' : '; ')) . ((Main::bool($self->{cond}) ? 'f_bool(' . $self->{cond}->emit_javascript() . '); ' : '; ')) . ((Main::bool($self->{continue}) ? $self->{continue}->emit_javascript() . ' ' : ' ')) . ') { ' . '(function () { ' . $body->emit_javascript() . ' })()' . ' }') }
}

;
{
package For;
sub new { shift; bless { @_ }, "For" }
sub cond { $_[0]->{cond} };
sub body { $_[0]->{body} };
sub emit_javascript { my $self = $_[0]; $self->emit_javascript_indented(0) };
sub emit_javascript_indented { my $self = $_[0]; my $level = $_[1]; ((my  $cond = undef) = $self->{cond}); if (Main::bool(!Main::bool(((Main::isa($cond, 'Var') && ($cond->sigil() eq '@')))))) { ($cond = Lit::Array->new(('array1' => do { (my  $List_a = []); (my  $List_v = []); push( @{$List_a}, $cond ); $List_a }))) } ; ((my  $body = undef) = Perlito::Javascript::LexicalBlock->new(('block' => $self->{body}->stmts()), ('needs_return' => 0))); ((my  $sig = undef) = 'v__'); if (Main::bool($self->{body}->sig())) { ($sig = $self->{body}->sig()->emit_javascript()) } ; '(function (a_) { for (var i_ = 0; i_ < a_.length ; i_++) { ' . '(function (' . $sig . ') ' . '{' . ' ' . $body->emit_javascript() . ' })(a_[i_]) } })' . '(' . $cond->emit_javascript() . ')' }
}

;
{
package Decl;
sub new { shift; bless { @_ }, "Decl" }
sub decl { $_[0]->{decl} };
sub type { $_[0]->{type} };
sub var { $_[0]->{var} };
sub emit_javascript { my $self = $_[0]; $self->emit_javascript_indented(0) };
sub emit_javascript_indented { my $self = $_[0]; my $level = $_[1]; $self->{var}->emit_javascript() };
sub emit_javascript_init { my $self = $_[0]; if (Main::bool(($self->{decl} eq 'my'))) { ((my  $str = undef) = ''); ($str = $str . 'var ' . ($self->{var})->emit_javascript() . ' = '); if (Main::bool((($self->{var})->sigil() eq '%'))) { ($str = $str . '{};' . '
') } else { if (Main::bool((($self->{var})->sigil() eq '@'))) { ($str = $str . '[];' . '
') } else { ($str = $str . 'null;' . '
') } }; return scalar ($str) } else { die('not implemented: Decl \'' . $self->{decl} . '\'') } }
}

;
{
package Sig;
sub new { shift; bless { @_ }, "Sig" }
sub invocant { $_[0]->{invocant} };
sub positional { $_[0]->{positional} };
sub named { $_[0]->{named} }
}

;
{
package Method;
sub new { shift; bless { @_ }, "Method" }
sub name { $_[0]->{name} };
sub sig { $_[0]->{sig} };
sub block { $_[0]->{block} };
sub emit_javascript { my $self = $_[0]; $self->emit_javascript_indented(0) };
sub emit_javascript_indented { my $self = $_[0]; my $level = $_[1]; ((my  $sig = undef) = $self->{sig}); ((my  $invocant = undef) = $sig->invocant()); ((my  $pos = undef) = $sig->positional()); ((my  $str = undef) = Main::join([ map { $_->emit_javascript() } @{( $pos )} ], ', ')); 'function ' . $self->{name} . '(' . $str . ') { ' . (Perlito::Javascript::LexicalBlock->new(('block' => $self->{block}), ('needs_return' => 1), ('top_level' => 1)))->emit_javascript() . ' }' }
}

;
{
package Sub;
sub new { shift; bless { @_ }, "Sub" }
sub name { $_[0]->{name} };
sub sig { $_[0]->{sig} };
sub block { $_[0]->{block} };
sub emit_javascript { my $self = $_[0]; $self->emit_javascript_indented(0) };
sub emit_javascript_indented { my $self = $_[0]; my $level = $_[1]; ((my  $sig = undef) = $self->{sig}); ((my  $pos = undef) = $sig->positional()); ((my  $str = undef) = Main::join([ map { $_->emit_javascript() } @{( $pos )} ], ', ')); 'function ' . $self->{name} . '(' . $str . ') { ' . (Perlito::Javascript::LexicalBlock->new(('block' => $self->{block}), ('needs_return' => 1), ('top_level' => 1)))->emit_javascript() . ' }' }
}

;
{
package Do;
sub new { shift; bless { @_ }, "Do" }
sub block { $_[0]->{block} };
sub emit_javascript { my $self = $_[0]; $self->emit_javascript_indented(0) };
sub emit_javascript_indented { my $self = $_[0]; my $level = $_[1]; ((my  $block = undef) = $self->simplify()->block()); return scalar ('(function () { ' . (Perlito::Javascript::LexicalBlock->new(('block' => $block), ('needs_return' => 1)))->emit_javascript() . ' })()') }
}

;
{
package Use;
sub new { shift; bless { @_ }, "Use" }
sub mod { $_[0]->{mod} };
sub emit_javascript { my $self = $_[0]; $self->emit_javascript_indented(0) };
sub emit_javascript_indented { my $self = $_[0]; my $level = $_[1]; '// use ' . $self->{mod} . '
' }
}


}

1;
