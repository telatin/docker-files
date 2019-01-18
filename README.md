# CheckM v1.0.11 Docker Container

Updates:
 * Now automatically runs the setRoot (ignoring error)

Wrapper:
to run checkm as a command (requires passwordless sudo):

```perl
#!/usr/bin/env perl

use File::Basename;
my $opt_debug = 1;

our %map = ();
our $map_count = 1;

my $arguments = '';
our $volumes = '';
foreach my $argument (@ARGV) {
        if (-e "$argument") {
                my ($file, $dir) = fileparse("$argument");
                $newdir = getnewdir($dir);
                $argument = qq("$newdir/$file");
        }
        $arguments .= qq( $argument );
}

my $command = qq(sudo docker run $volumes --rm andreatelatin/checkm checkm $arguments);
system($command);
 
sub getnewdir {
        my $dir = shift @_;

        if (! $map{$dir}) {
                $map{$dir} = "/dir" . $map_count;
                $map_count++;
                $volumes .= qq( -v "$dir:$map{$dir}" );
        }
        return $map{$dir};
}
```
