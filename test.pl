#!/usr/bin/perl -w

use Chatbot::Alpha;

my $alpha = new Chatbot::Alpha (debug => 0);

# Load test replies.
my $load = $alpha->load_file ('./testreplies.txt');
die "Error: $load" unless $load == 1;

# User ID (so the module can keep track of different talkers)
my $id = "foo";

# Loop.
while (1) {
	print "  You> ";
	my $msg = <STDIN>;
	chomp $msg;

	exit(0) if $msg =~ /^exit$/i;

	# An example, setting a variable (see the "am i your master" reply in testreplies.txt)
	# Try setting this to 0 and see how Alpha replies to that. =)
	my $master = 1;

	# Set the "master" variable.
	$alpha->set_variable ("master",$master);

	# Get a reply.
	my $reply = $alpha->reply ($client,$msg);

	# Unset the "master" variable.
	$alpha->remove_variable ("master");

	print "Alpha> $reply\n\n";
}