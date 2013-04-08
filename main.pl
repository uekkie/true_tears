use strict;
use warnings;

my $title = "true tears で学ぶ、Perl入門 改";

my @names = qw(Shinichirou Noe Hiromi Aiko Nobuse Yusukebe);

question();

sub question{
	print "Dareni suru?\n";
	print join( ', ', @names)."\n";

	my $name = <STDIN>;

	chomp($name);

	die "真一郎の靴の底にもあぶらむし\n" unless $name;

	validation($name);
}


sub validation{
	my $name = shift;
	# +++ １文字だと、その文字を含む名前がマッチするので、２文字以上を要求
	if (length($name)>1 && grep{ $_ =~ /$name/ } @names){
		print "$name: ". talk($name) . "\n";
	}
	else{
		print "Chanto erande yo!\n";
		question();
	}
}

sub talk {
	my $name = shift;
	my $map = {
		Shinichirou	=>	['全部ちゃんとするから','君の涙を'],
		Noe 		=>	['私、涙、あげちゃったから','はい、ぱちぱちってして'],
		Hiromi		=>	['私 何がしたいの','おせっかいな男の子ってバカみたい'],
		Aiko		=>	['どうなった？こないだの話','それ なんの冗談？'],
		Nobuse		=>	['よー'],
		Yusukebe	=>	['メルマガよろしく！'],
	};

	my @sentences = @{ $map->{$name} };
	return $sentences[ rand @sentences ];
}
