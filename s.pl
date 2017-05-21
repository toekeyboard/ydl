#!/usr/bin/env perl

#usage:  d.pl -l es,fr,de,it,en,zh-Hans <URL>

use warnings;
use strict;



#audio only  (terminal/console avoir les subtitres / traductions)
#moins available downloads
#my $quality=249;
#my $fileformat="webm";

#video (low quality)
my $quality=17;
my $fileformat="3gp";

#video (medium quality)
#my $quality=36;
#my $fileformat="3gp";

#video (high quality)
#my $quality=18;
#my $fileformat="mp4";

#video (really high quality)
#my $quality=22;
#my $fileformat="mp4";


#youtube-dl -F https://www.youtube.com/watch?v=VIDEOID
#	$quality     $fileformat
#	249          webm       audio only DASH audio   57k , opus @ 50k, 1.48MiB
#	250          webm       audio only DASH audio   82k , opus @ 70k, 2.05MiB
#	140          m4a        audio only DASH audio  128k , m4a_dash container, mp4a.40.2@128k, 3.51MiB
#	171          webm       audio only DASH audio  137k , vorbis@128k, 3.55MiB
#	251          webm       audio only DASH audio  154k , opus @160k, 3.99MiB

#	17           3gp        176x144    small , mp4v.20.3,  mp4a.40.2@ 24k             
#	36           3gp        320x180    small , mp4v.20.3,  mp4a.40.2
#	43           webm       640x360    medium , vp8.0,  vorbis@128k
#	18           mp4        640x360    medium , avc1.42001E,  mp4a.40.2@ 96k
#	22           mp4        1280x720   hd720 , avc1.64001F,  mp4a.40.2@192k (best)





#prends les language flag
my $lang_flag=$ARGV[0];			#-l pas utiliser


#prends les langues
my $lang=$ARGV[1];

#prends le chaine
my $channel_or_user_url=$ARGV[2];
my $channel_or_user=$ARGV[3];

my $offline=$ARGV[4];

#my $channel_or_user = $channel_or_user_url =~ m{^([0-9]{2}):([0-9]{2}):([0-9]{2}).([0-9]{3}).*\z}
#   my ($H,$M,$S,$N) = $date =~ m{^([0-9]{2}):([0-9]{2}):([0-9]{2}).([0-9]{3}).*\z}

#print $lang;


my @langs = split(',',$lang, length($lang));

#print scalar(@langs) . "a\n";
#print length($lang) . "b\n";

#print scalar(@langs) . "a\n";
#print @langs . "b\n";
#print join(", ", @langs) . "c\n";
#print $langs . "d\n";
#exit

my $first_lang = $langs[0];


local *ECRIRE;


my $count=0;
my $flag=0;

my $time;

my ($premiere_commence, $premiere_arrete, $deuxieme_commence, $deuxieme_arrete);


local *FILESECONDE;


local *FILE;
my $video;
my $premiere_vu;
my $fini_vu=0;






my $video_count = 0;
my $subtitle_option="";

my $date_posted ="";









#http://stackoverflow.com/questions/8221841/how-to-compare-string-date-time-in-perl
#my $date1 = "00:00:10.079";
#my $date2 = "00:00:12.059 align:start position:0%";

sub ensurer_temps_format {
   my ($date) = @_;
   my ($H,$M,$S,$N) = $date =~ m{^([0-9]{2}):([0-9]{2}):([0-9]{2}).([0-9]{3}).*\z}
      or die;
   return "$H:$M:$S.$N";
}


sub to_comparable {
   my ($date) = @_;
   my ($H,$M,$S,$N) = $date =~ m{^([0-9]{2}):([0-9]{2}):([0-9]{2}).([0-9]{3})\z}
      or die;
   return "$H$M$S$N";
}






#tous les autres langues, mais pas le premiere langue
my $flag_seconde=0;
sub seconde {
	while(my $line = <FILESECONDE>)  {   
		#trouver le prochaine --> timestamp, arrete, sauter a le dernier
		if (($line =~ /-->/) && ($flag_seconde == 1)) {
			#print ECRIRE "!!aa";
			$flag_seconde=0;
			last;
		}

		#ecrire les sub-titres
		if ($flag_seconde == 1) {
			#print ECRIRE "!!bb";
			#print ECRIRE $line;
			if ($line !~ /^$/) { print ECRIRE $line };
		}

		#commence trouver le temps timestamp, et faire le test
		if ($line =~ /^(.*) --> (.*)/) {
			$deuxieme_commence = ensurer_temps_format($1);
			$deuxieme_arrete = ensurer_temps_format($2);
			#print ECRIRE "!!cc";

			#if ( 
			#	( to_comparable($deuxieme_commence) <= to_comparable($premiere_commence) ) &&
			#   	( to_comparable($deuxieme_arrete) >= to_comparable($premiere_arrete) ) 
			#   ) {
			#	#print "a";
			#	$flag_seconde=1;
			#}
			#elsif (
			#	( to_comparable($premiere_commence) <= to_comparable($deuxieme_arrete) )
		    	#      ) {
			#	$flag_seconde=1;
			#}

			if ( to_comparable($premiere_commence) <= to_comparable($deuxieme_commence) ) {
				#if ( to_comparable($premiere_commence) <= to_comparable($deuxieme_arrete) ) {
			#if ( to_comparable($premiere_commence) < to_comparable($deuxieme_arrete) ) {
				$flag_seconde=1;
			}


		}
	}
	
}




#utiliser le premier langue
sub premier {
	while(my $line = <FILE>)  {   
		#chomp;

		#trouver le prochaine.  etablir le fini flag
		if ( ($line =~ /-->/) && ($premiere_vu == 1) ) {
			#print ECRIRE "!a";
			$fini_vu = 1;
		}

		#test pour voir si on trouve le premier temps -->.  etablir le drapeau
		if ( ($line =~ /-->/) && ($premiere_vu == 0)) {
			#print ECRIRE "!b";
			$premiere_vu = 1;
		}

		#ecrire le WEBVTT header
		if ($premiere_vu == 0) {
			#print ECRIRE "!c";
			#if ($line !=~ /^\s*$/) { print ECRIRE $line };    
			if ($line !~ /^$/) { 
				print ECRIRE $line 
			}
			#if ($line ne "") { print ECRIRE $line };
			next;
		}


		#test pour le fini flag, appeler le seconde() fonction pour ecrire les autres subtitres
		if ($fini_vu == 1) {
			#print ECRIRE "!d";
			
			#fr($time);
			#de($time);
			#en($time);
	

			my $l;			
			foreach $l (@langs) { 
				if ($l ne $langs[0]) {
					print ECRIRE "~";	#separer les langues

					#print ECRIRE "!!--- '$l' '$langs[0]'";
					open(FILESECONDE, "d/$first_lang/$channel_or_user/$video/_$l.vtt");
					seconde();
					close (FILESECONDE);

					#print ECRIRE " -";	#separer les langues
				}
				#if ($l ne $langs[$#langs]) {
				#	print ECRIRE "----\n";	#separer les langues
				#}
			}

			print ECRIRE "\\n\n\n";		#besoin, pour etre plus facile a lire.  quand il y a deux pairs de text, un sur l'autre

			#print ECRIRE $line;

			$flag = 0;
			$fini_vu = 0;

			#next;
		}

		#ecrire les subtitres du premiere langue
		if ( ($flag == 1) && ($fini_vu != 1) ) {
			#print ECRIRE "!e";
			#if ($line !=~ /^\s*$/) { print ECRIRE $line };    
			if ($line !~ /^\s*$/) { 
				#print ECRIRE " -";	#separer les langues
				print ECRIRE $line; 
			};
			#if ($line ne "") { print ECRIRE $line };
			#last;
		}

		#commence le nouveau --> timestamp
		if ($line =~ /^(.*) --> (.*)/) {
			#print ECRIRE "!f";

			$premiere_commence = ensurer_temps_format($1);
			$premiere_arrete = ensurer_temps_format($2);

			$time = $1;
			#if ($line !=~ /^\s*$/) { print ECRIRE $line };    
			if ($line !~ /^$/) { 
				#ecrire le --> timestamp
				print ECRIRE $line;
				print ECRIRE "~ ";	#separer les langues
			};    
			#if ($line ne "") { print ECRIRE $line };    
			$flag=1;
		}

	}

}



















####prends channel info
#system("echo '===================================================================='");

##download channel homepage
#system("cd -- d/$channel_or_user; rm $channel_or_user 2> /dev/null");
#system("cd -- d/$channel_or_user; wget -q $channel_or_user_url");


##prends CHANNEL name
#http://schema.org/Person

#https://github.com/tldr-pages/tldr/blob/master/pages/common/sed.md
#http://stackoverflow.com/questions/18349341/sed-command-gives-error-sed-e-expression-1-char-50-unterminated-s-comman/18354928

my $channel_url = `cd -- d/$first_lang/$channel_or_user; <$channel_or_user grep -m 1 -n -P --color 'canonical.*' | cut -f4 -d'\"' ` ;
chomp ($channel_url);

#my $channel_url = `cd -- d/$channel_or_user/$video;<$video grep -no --color '<div id=\"watch7-user-header\" class=\" spf-link \">  <a href=\".*' | cut -f6 -d'\"' ` ;
#$channel_url = "http://www.youtube.com" . "$channel_url";

#my $channel_url = `cd -- d/$channel_or_user/$video;<$video grep -no --color '\@id.*' | cut -f3 -d'\"' ` ;
#my $channel_url = `cd -- d/$channel_or_user/$video;<$video grep -no --color '\@id.*' | cut -f3 -d'\"' | perl -p -e 's#\\##g'` ;
#my $channel_url = `cd -- d/$channel_or_user/$video;<$video grep -no --color '\@id.*' | cut -f3 -d'\"' | sed 's/\\//g' ` ;
#my $channel_url = `cd -- d/$channel_or_user/$video;<$video grep -no --color '\@id.*' | cut -f3 -d'\"' | sed -i 's?\\??g' ` ;
#my $channel_url = system("cd -- d/$channel_or_user/$video;<$video grep -no --color '\@id.*' | cut -f3 -d'\"' ");
#my $channel_url = system("cd -- d/$channel_or_user/$video;<$video grep -no --color '\@id.*' | cut -f3 -d'\"' | sed 's/\\//g' ");

#my $channel_name = `cd -- d/$channel_or_user/$video;<$video grep -no --color 'name\":.*' | cut -f3 -d'\"' `;
my $channel_name = `cd -- d/$first_lang/$channel_or_user; <$channel_or_user grep -no --color '<meta name=\"title\" content=\".*' | cut -f4 -d'\"' ` ;
chomp ($channel_name);
#my $channel_name = system("cd -- d/$channel_or_user/$video;<$video grep -no --color 'name\":.*' | cut -f3 -d'\"' ");




####prends channel results statistics

#prends search video info
#system("cd -- d/$channel_or_user; rm results* 2> /dev/null");
#system("cd -- d/$channel_or_user; wget -q 'https://www.youtube.com/results?q=$channel_or_user&sp=EgIQAg%253D%253D' -O results ");


#channel video count

#non-greedy match in grep ?
#http://stackoverflow.com/questions/3027518/how-to-do-a-non-greedy-match-in-grep#3027524
my $channel_num_videos = `cd -- d/$first_lang/$channel_or_user; <results grep -m 1 -noP --color 'yt-lockup-content.*$channel_or_user.*' | grep -oP 'yt-lockup-meta-info.*?videos' | cut -d'\>' -f3 ` ;
chomp ($channel_num_videos);

my $recent_video_date = "";
my $recent_video_time = "";
my $recent_video_time_print = "";
my $recent_video_flag = 0;

#channel description
my $channel_description = `cd -- d/$first_lang/$channel_or_user; <results grep -m 1 -noP --color 'yt-lockup-content.*$channel_or_user.*' | grep -oP 'yt-lockup-description.*</div' | cut -d'\>' -f2 | cut -d'\<' -f1 ` ;
chomp ($channel_description);

#channel subscriber count
my $channel_subscribers = `cd -- d/$first_lang/$channel_or_user; <results grep -m 1 -noP --color 'yt-lockup-content.*$channel_or_user.*' | grep -oP 'yt-subscriber-count.*' | cut -d'\"' -f3 ` ;
chomp ($channel_subscribers);



#video times
local *VIDEOTIMES;
open(VIDEOTIMES, "<d/$first_lang/$channel_or_user/videos_time") or die $!;
my @video_times;
my $i=0;

while(<VIDEOTIMES>)  {  
	chomp;
	$video_times[$i] = $_;
	$i++;
}


#print scalar(@video_times) . "a\n";
#print @video_times . "b\n";
#print join(", ", @video_times) . "c\n";
#exit;















sub recent_video_printing {
	
	print "\n";

	#set le recent video avec subtitres
	if ($recent_video_flag == 0) {
		$recent_video_date = $video_count .") " . $date_posted;
		$recent_video_time_print = $recent_video_time;
		#echo "Streamed live Jan 31, 2017" | cut -f3- -d" ";
		$recent_video_flag = 1;
	}


	#imprimer recent stats
	print "			$channel_url    $channel_name \n";
	print "				$channel_num_videos	$recent_video_date	$recent_video_time_print\n";
	#print "        $channel_num_videos    $recent_video_date \n";
	#print "        -$recent_video_time_print \n";


	print "\n";

}









####main loop

local *VIDEOLIST;
open(VIDEOLIST, "<d/$first_lang/$channel_or_user/videos_list") or die $!;



my $dernier_count=0;

while(<VIDEOLIST>)  {  
	chomp;
	$video = $_;
	$premiere_vu=0;

	$video_count = $video_count + 1;


	#https://www.cyberciti.biz/faq/linuxunix-move-file-starting-with-a-dash/
	system("cd -- d/$first_lang/$channel_or_user; mkdir -- $video 2> /dev/null ");
	system("cd -- d/$first_lang/$channel_or_user/$video; rm -- info 2> /dev/null ");


	#recent_video_printing();

	# imprimer channel stats
	#####print channel title and statistics
	system("cd -- d/$first_lang/$channel_or_user/$video; echo '######################################## $channel_url    $channel_name' | tee -a info");
	#print "\n================================ $channel_url    $channel_name \n";
	system("cd -- d/$first_lang/$channel_or_user/$video; echo '################################ $video_count / $channel_num_videos    $recent_video_date' | tee -a info");
	#print "======================== $channel_num_videos \n";
	system("cd -- d/$first_lang/$channel_or_user/$video; echo '################################ $channel_subscribers subscribers' | tee -a info");
	#print "======================== $channel_subscribers subscribers \n";
	system("cd -- d/$first_lang/$channel_or_user/$video; echo '################################ $channel_description' | tee -a info");
	#print "======================== $channel_description \n";
	
	#print "============ $channel_name ==== $channel_url ============ \n";

	print "\n";





	####prends video info:  titre, URL, date, views, description
	#system("echo '....................................................................'");

	#voir si online, si oui, download video homepage
	if ($offline == "0" ) {
		system("cd -- d/$first_lang/$channel_or_user/$video; wget -q https://www.youtube.com/watch?v=$video -O $video");
		#system("cd -- d/$channel_or_user/$video; wget -q https://www.youtube.com/watch?v=$video -O $video");
	}









	##prends video titre
	my $title=`cd -- d/$first_lang/$channel_or_user/$video; <$video grep -no --color '<meta name=\"title.*' | cut -f4 -d'\"' `;
	chomp $title;
	#system("cd -- d/$channel_or_user/$video;<$video grep -no --color '<meta name=\"title.*' | cut -f4 -d'\"'");
	#ln -s / grep ne fonction pas avec les files qui commence avec '-'	CHANNELID: UCrJ6XewaatAEd25QUDxFM6Q / VIDEOID: -0o11T74uIU
	#system("cd -- d/$channel_or_user/$video; grep -no --color '<meta name=\"title.*' $video | cut -f4 -d'\"'");
	#system("grep -no --color "<meta name=\"title.*" $video | awk -F'\"' '{print $4}'");


	##prend video URL
	my $video_url=`echo https://www.youtube.com/watch?v=$video `;
	chomp ($video_url);
	#system("echo https://www.youtube.com/watch?v=$video");


	#print video title and statistics
	system("cd -- d/$first_lang/$channel_or_user/$video; echo '======================== $video_url    $title' | tee -a info");
	#print "\n---------------- $video_url    $title \n";

	
	$date_posted = `cd -- d/$first_lang/$channel_or_user/$video;
		<$video grep -no --color 'Published on .*' | cut -f2 -d':' | cut -f1 -d'<' ;
		<$video grep -no --color 'Streamed live .*' | cut -f2 -d':' | cut -f1 -d'<' ;
		<$video grep -no --color 'Uploaded on .*' | cut -f2 -d':' | cut -f1 -d'<' ;
		` ;
	chomp $date_posted;
	##prends date 'Published on / Streamed Live / Uploaded on"
	system("cd -- d/$first_lang/$channel_or_user/$video; echo '================ $date_posted ' | tee -a info ");

	#system("cd -- d/$channel_or_user/$video; grep -no --color 'Published on.*' $video | cut -f2 -d':' | cut -f1 -d'<'");
	#system("w3m -dump https://www.youtube.com/watch?v=$video | grep Published | cut -f3- -d' '");
	#system("w3m -dump https://www.youtube.com/watch?v=$video | grep Published");



	##prends views
	#echo -n - do not print endline character
	#grep -P - use Perl (pour non-greedy .*?)

	#my $views = `cd -- d/$channel_or_user/$video; <$video grep -noP --color '\"view_count\":\".*?\,' | cut -f4 -d'\"' `;
	my $views = `cd -- d/$first_lang/$channel_or_user/$video; <$video grep -noP --color 'watch-view-count.* views' |cut -d'\>' -f2 ` ;
	chomp $views;
	system("cd -- d/$first_lang/$channel_or_user/$video; echo '================ $views' | tee -a info");
	#print "-------- $views \n";

	#system("cd -- d/$channel_or_user/$video; echo -n 'Views: '; <$video grep -noP --color '\"view_count\":\".*?\,' | cut -f4 -d'\"' ");
	#system("cd -- d/$channel_or_user/$video; echo -n 'Views: '; grep -noP --color '\"view_count\":\".*?\,' $video | cut -f4 -d'\"' ");



	##prends description
	#grep -m 1	premiere occurence
	system("cd -- d/$first_lang/$channel_or_user/$video; echo -n '================ ' | tee -a info; <$video grep -m 1 -noP --color 'description.*' | cut -f3 -d'\"' | tee -a info ");
	#system("cd -- d/$channel_or_user/$video; echo -n 'Description: '; <$video grep -m 1 -noP --color 'description.*' | cut -f3 -d'\"' ");
	#system("cd -- d/$channel_or_user/$video; echo -n 'Description: '; grep -m 1 -noP --color 'description.*' $video | cut -f3 -d'\"' ");
	
	#imprimer video time
	system("cd -- d/$first_lang/$channel_or_user/$video; echo -n '================ $video_times[$video_count -1] ' | tee -a info ");
	$recent_video_time = $video_times[$video_count -1];

	print "\n";









	#pas de langues
	if ($lang eq "0") {
		#test if online
		if ($offline == "0" ) {
			system("cd -- d/$first_lang/$channel_or_user/$video; youtube-dl -l -f $quality https://www.youtube.com/watch?v=$video");
		}

		$subtitle_option="";
	}

	#seulement une langue
	elsif (scalar(@langs) eq "1") {
		#test if online
		if ($offline == "0" ) {
			my $out=`youtube-dl https://www.youtube.com/watch?v=$video --list-subs 2>&1 | grep -m1 'vtt, ttml'`;
			if ($out !~ /vtt, ttml/) {
				print "\nNo subtitles\n\n";
				#delete video directory
				system("cd -- d/$first_lang/$channel_or_user; rm -rf -- $video ");
				#system("cd -- d/$channel_or_user; rm -- -rf $video 2> /dev/null ");

				#skip video, aller a la prochaine
				print "Dernier video avec subtitres: $dernier_count \n";

				next;
			}




			system("cd -- d/$first_lang/$channel_or_user/$video; youtube-dl -l -f $quality https://www.youtube.com/watch?v=$video --write-auto-sub --sub-lang $lang ");

			#creer, donc, peut jouer si offline
			system("cd -- d/$first_lang/$channel_or_user/$video; rm _$lang.vtt 2> /dev/null");
			system("cd -- d/$first_lang/$channel_or_user/$video; ln -s *.$lang.vtt _$lang.vtt 2> /dev/null");

			#system("cd -- d/$channel_or_user/$video; rm __$lang.vtt 2> /dev/null");
			#system("cd -- d/$channel_or_user/$video; ln -s _$lang.vtt __$lang.vtt 2> /dev/null");
		}

		$subtitle_option="--sub-file=_$lang.vtt";

	}

	#plusieur langues
	else {
		#test if online
		if ($offline == "0" ) {
			#eliminer les videos sans translation
			#si il n'y a pas de subtitles
			#2>&1 		suppresss 'WARNING: video doesn't have subtitles'
			#my $out= `youtube-dl https://www.youtube.com/watch?v=$video --list-subs | wc -l`;
			#
			#my $out= `youtube-dl https://www.youtube.com/watch?v=$video --list-subs 2>&1 | wc -l`;
			#if ($out < 100) {
			#	print "No subtitles\n\n";
			#	next;
			#}

			#check si il y a subtitles
			#my $out=`youtube-dl https://www.youtube.com/watch?v=$video --list-subs 2>&1 | grep 'has no subtitles'`;
			#if ($out == "has no subtitles") 		#not numeric
			#if ($out eq "has no subtitles") 		#pas exact, car il y a le videoid 	"JF0INF_2ffc has no subtitles"
			#toujours imprimer
			#if ($out =~ /has no subtitles/) 
			

			my $out=`youtube-dl https://www.youtube.com/watch?v=$video --list-subs 2>&1 | grep -m1 'vtt, ttml'`;
			#skip video, aller a la prochaine
			if ($out !~ /vtt, ttml/) {
				print "\nNo subtitles\n\n";
				#delete directory
				system("cd -- d/$first_lang/$channel_or_user; rm -rf -- $video ");
				#system("cd -- d/$channel_or_user; rm -- -rf $video 2> /dev/null ");
			
				print "Dernier video avec subtitres: $dernier_count \n\n";

				next;
			}


			####download le video et les subtitles
			system("cd -- d/$first_lang/$channel_or_user/$video; youtube-dl -l -f $quality https://www.youtube.com/watch?v=$video --write-auto-sub --sub-lang $lang");

			#besoin pour voir download progress (size de file)	 [download] 100% of 1.67MiB in 00:05		
				#(youtube-dl -l -f 17 https://www.youtube.com/watch?v=1097N-Fbhgc --write-auto-sub --sub-lang fr,en,es | tee download.txt 2>&1 > /dev/null) & cat download.txt | grep 'download'
				#youtube-dl -l -f 17 https://www.youtube.com/watch?v=1097N-Fbhgc --write-auto-sub --sub-lang fr,en,es --newline | grep 'download'

			#system("cd --  d/$channel_or_user/$video; youtube-dl -l -f $quality https://www.youtube.com/watch?v=$video --write-auto-sub --sub-lang $lang 2>&1 > /dev/null");
			#system("cd -- d/$channel_or_user/$video; youtube-dl -l -f 18 https://www.youtube.com/watch?v=$video --write-auto-sub --sub-lang $lang");
			
			#sleep 1;	#necessaire, pour attraper Ctrl-c


			my $response = `cd d/$first_lang/$channel_or_user/$video; find __$lang.vtt 2> /dev/null`;

			#no existing complete subtitles.  creer les subtitres
			if ( $response eq "" ) {

				####ecrire les sub-titres  '__$lang.vtt'
				
				my $l;
				foreach $l (@langs) { 
					#ln -s ne fonction pas avec les files qui commence avec -.  souhaite les video titres ne commence pas avec un -
					#system("cd -- d/$channel_or_user/$video;<*$l.vtt ln -s _$l.vtt 2> /dev/null");
					#system("cd -- d/$channel_or_user/$video;<`echo *$l.vtt` ln -s _$l.vtt 2> /dev/null");
					#system("cd -- d/$channel_or_user/$video;<"`ls -1 *$l.vtt`" ln -s _$l.vtt 2> /dev/null");
					system("cd -- d/$first_lang/$channel_or_user/$video; rm _$l.vtt 2> /dev/null");
					system("cd -- d/$first_lang/$channel_or_user/$video; ln -s *.$l.vtt _$l.vtt 2> /dev/null");
				}

				#system("cd -- d/$channel_or_user/$video; touch _$lang.vtt");	#neccessaire pour mettre apres tout les autre symlinks sont creer
				#system("exit");
				#sleep 1;	#besoin pour relentir
				#system("sleep 1");

				#ouvrir le premier langue
				#open(FILE, "<d/$channel_or_user/$video/_$langs[0].vtt") or die $!;
				open(FILE, "<d/$first_lang/$channel_or_user/$video/_$langs[0].vtt");

				#ouvrir le file pour ecrire
				#__ besoin, pour ne pas doubler, si il y a seulement un langue -l es.  ne peu pas ecrire a un symlink
				open(ECRIRE, ">d/$first_lang/$channel_or_user/$video/__$lang.vtt") or die $!;
				#open(FILE, "d/$channel_or_user/$video/$l.vtt") or die $!;


				premier();

				close (FILE);
				close (ECRIRE);
			}

		}

		$subtitle_option="--sub-file=__$lang.vtt";

	}



	recent_video_printing();

	$dernier_count=$video_count;

	#system("cd -- d/$first_lang/$channel_or_user/$video; mpv *.$fileformat $subtitle_option");
	system("cd -- d/$first_lang/$channel_or_user/$video; mpv *.$fileformat $subtitle_option --osd-level=3 --fullscreen");
	
	
	#pas de video
	#system("cd -- d/$first_lang/$channel_or_user/$video; mpv *.$fileformat $subtitle_option --vo null");
	#system("cd -- d/$first_lang/$channel_or_user/$video; mpv *.$fileformat $subtitle_option --vo null --osd-level=3 --fullscreen  > /dev/null ");

	#jouer video avec subtitres
	#system("cd -- d/$first_lang/$channel_or_user/$video; mpv *.$fileformat $subtitle_option --osd-level=3 --fullscreen");
	#system("cd -- d/$first_lang/$channel_or_user/$video; mpv *.$fileformat $subtitle_option --osd-level=3 --fullscreen > /dev/null");




	#http://unix.stackexchange.com/questions/30367/how-can-i-retain-the-console-input-in-mplayer-when-reading-from-stdin
	#> /dev/null ne permettre pas utiliser les controls
	#system("cd -- d/$first_lang/$channel_or_user/$video; mpv *.$fileformat $subtitle_option --osd-level=3 --fullscreen  > /dev/null ");
	




	#TODO:   forcer les videos au fond de l'ecran.  ne marche pas
	#system("cd -- d/$first_lang/$channel_or_user/$video; touch __empty.vtt ");
	#system("cd -- d/$first_lang/$channel_or_user/$video; mpv *.$fileformat $subtitle_option --sub-file=__empty.vtt --sid=1 --secondary-sid=2 --osd-level=3 --fullscreen  > /dev/null ");
	
	#system("echo \"Pousser \'f\' pour faire le video plein l\'Écran\"; echo");
	#system("cd -- d/$first_lang/$channel_or_user/$video; mpv *.$fileformat $subtitle_option --osd-level=3  > /dev/null ");

	#touch "_empty.vtt"
	#mpv *.3gp --sub-file="_empty.vtt" --sub-file="__en,es,de.vtt" --sid=1 --secondary-sid=2 --osd-level=3

	sleep 1;	#dormir, si no, ne peut pas eschaper avec Ctrl-c		#necessaire, pour attraper Ctrl-c



	#print "------------------------------------------------------------------------------------------------\n";
	

	#vtt1=`ls -1 d/_es.vtt`
	#vtt2=`ls -1 d/_fr.vtt`
	#mpv *.$fileformat --sub-file="$vtt1" --sub-file="$vtt2" --sid=1 --secondary-sid=2
	#mpv *.$fileformat --sub-file="$vtt1" --sub-file="$vtt2" --sid=1 --secondary-sid=2
	#mpv *.3gp --sub-file="_it.vtt" --sub-file="_es.vtt" --sid=1 --secondary-sid=2
	



	#system("cd -- d/$channel_or_user/$video; mpv *.3gp --sub-file=__$lang.vtt --osd-level=3");
	#veux voir les autres fenetres
	#system("cd -- d/$channel_or_user/$video; mpv *.3gp --sub-file=__$lang.vtt --osd-level=3 --fullscreen");

	#system("cd -- d/$channel_or_user/$video; mplayer *.3gp -sub __$lang.vtt -osdlevel 3");
	
	#system("cd -- d/$channel_or_user/$video; mpv *.mp4 --sub-file=__$lang.vtt");
	#system("cd -- d/$channel_or_user/$video; mpv *.mp4 --sub-file=__$lang.vtt --osd-level=3");



	#print "hello\n";
	#exit();

}








print "=========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================\n";





print "Dernier video avec subtitres: $dernier_count \n";
recent_video_printing();

print "======================================================================================================\n";
