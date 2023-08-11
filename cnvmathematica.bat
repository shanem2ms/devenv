@rem = '-*- Perl -*-';
@rem = '
@if "%overbose%" == "" echo off
setlocal
set INC=%TOOLDIR%
set PERL5OPT=
set ARGS= %*
set THECMDLINE=%0 %*
set "CDIR=%cd%"
"%NOTOOLS%perl5.14.2%OPERLOPT%" -I %TOOLDIR%\perllibs -w "%~dpnx0" %ARGS:/?=-?%

exit /b %ERRORLEVEL%
';
use File::Spec::Functions;
use File::Spec;
use File::Basename;
use File::Copy;
use Cwd;


sub ReadFile($)
{
	my ($sFile) = (@_);

	open my $srcFile, '<', $sFile;
    my $fc = do { local $/; <$srcFile> };
	close $srcFile;
    $fc =~ s/\n\s*//g;
	$fc =~ s/Sqrt\[([^\]]*)\]/sqrt($1)/g;
    $fc =~ s/Subscript\[(\w+)\,\s*(\w+)\]/$1_$2/g;
    $fc =~ s/Cos\[(\w+)\]/cos$1/g;
    $fc =~ s/Sin\[(\w+)\]/sin$1/g;
    $fc =~ s/(\w+)\^(\d)/pow$2($1)/g;
    $fc =~ s/\[n\]//g;
    $fc =~ s/\)\s+(\w+)/) * $1/g;
    $fc =~ s/(\w+)\s+\(/$1 * (/g;
    $fc =~ s/\)\s+\(/) * (/g;
    $fc =~ s/\)\s+\(/) * (/g;
    while ($fc =~ /(\w+)\s+(\w+)/)
    {
        $fc =~ s/(\w+)\s+(\w+)/$1 * $2/g;
    }
    $fc =~ s/\;/;\n\n/g;
    $fc =~ s/float\s\*/float/g;
   print $fc;
}


my ($filenameIn) = @ARGV;
ReadFile($filenameIn);
