use strict;
use warnings;

# scalar
my $title = "true tears で学ぶ、Perl入門 改";

# List
my @names = qw(Shinichirou Noe Hiromi Aiko Nobuse Yusukebe);

question();

sub question{
  # std io
  print "Dareni suru?\n";

	# function
	print join( ', ', @names)."\n";

	# std io
	my $name = <STDIN>;

	# function
	chomp($name);

	# error
	die "真一郎の靴の底にもあぶらむし\n" unless $name;

	validation($name);

}


sub validation{
	my $name = shift;
	# 制御構文, grep, 正規表現

	# +++ １文字だと、その文字を含む名前がマッチするので、２文字以上を要求
	if (length($name)>1 && grep{ $_ =~ /$name/ } @names){
	# --- if (grep{ $_ =~ /$name/i } @names){
		print "$name: ". talk($name) . "\n";
	}
	else{
		print "Chanto erande yo!\n";
		question();
	}
}

# sub routine
sub talk {
	my $name = shift;
	# reference
	my $map = {
		Shinichirou	=>	['全部ちゃんとするから','君の涙を'],
		Noe 		=>	['私、涙、あげちゃったから','はい、ぱちぱちってして'],
		Hiromi		=>	['私 何がしたいの','おせっかいな男の子ってバカみたい'],
		Aiko		=>	['どうなった？こないだの話','それ なんの冗談？'],
		Nobuse		=>	['よー'],
		Yusukebe	=>	['メルマガよろしく！'],
	};

	# dereference
	my @sentences = @{ $map->{$name} };

	# list grep
	return $sentences[ rand @sentences ];
}
