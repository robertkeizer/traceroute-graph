BEGIN{
	points[0][0] = 0;
	current_hop=0;
	has_num=0;
	print "digraph G {\n\trankdir = LR;node [ shape=box, style=\"rounded,filled\" width=0, height=0, fontname=Helvetica, fontsize=10];\n\tedge [ fontname=Helvetica, fontsize=10];"
}


# Current hop number.
$1 ~ /^[0-9]+*$/ {
	current_hop=current_hop+1;
	has_num=1;
}

# Set the host; We've got a single line coming in.
{
	if ( has_num ){
		HOST=$2;
	}else{
		HOST=$1;
	}
	points[current_hop][NR] = NR;
}

# Skip empty lines and the 'traceroute' starting output.
/^[^$\|^traceroute]/{

	# Print out the definition of the point.
	print "\tp" NR " [ label = \"" HOST "\" fillcolor=\"white\" ];"

	for ( z in points[current_hop-1] ){
		print "\tp"z " -> p" NR " [ penwidth=2 weight=100 color=grey60 dir=\"forward\" ];"
	}
}

# Reset after every line.
{
	has_num=0;
}

END{
	print "}"
}
