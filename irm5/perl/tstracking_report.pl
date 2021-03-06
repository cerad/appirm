#!/usr/bin/perl
#


# use strict;

use lib '../perl';

use DBI;

use CGI qw(:standard *table);

use Date::Calendar::Profiles qw( $Profiles );
use Date::Calendar;
use Date::Calc qw(:all);

require "sub.business_hours";

my $month = param('month');
my $year  = param('year');

my $user   = 'admin';
my $lpasswd = 'el0ret_kts';
my $db     = 'irm';

my $dbh = DBI->connect("DBI:mysql:$db", $user, $lpasswd,
            { PrintError => 1, RaiseError => 1})
    or die "connecting: $DBI::errstr";


my (@list, $counter, $counter1);
my ($count0, $count1, $count2, $count3, $count4, $count5);
my ($error, %group_count, $i);

$month_name = Month_to_Text($month);

my $startdate = "$year-$month-01 00:00:00";

my ($eyear,$emonth) = Add_Delta_YM($year, $month ,1, 0, 1);
my $enddate   = "$eyear-$emonth-01 00:00:00";

my $sql =  qq[ SELECT ID, date 
                 FROM tracking
                WHERE date BETWEEN "$startdate" AND "$enddate" 
                AND groupname NOT LIKE "YAA"];

my $sth = $dbh->prepare( $sql );
   $sth->execute();

   while ( my @trouble = $sth->fetchrow_array() ) {

        my $resdate = $dbh->selectrow_array(
                                qq[ SELECT date
                                      FROM followups
                                     WHERE tracking = "$trouble[0]"
                                     ORDER BY date ASC
                                     LIMIT 1 ]
                        );

      next if ( (! $resdate) or ($resdate eq '0000-00-00 00:00:00') );

my($year1, $month1, $day1, $hour1, $min1, $sec1) = split(/[- :i]/, $trouble[1]);
my($year2, $month2, $day2, $hour2, $min2, $sec2) = split(/[- :i]/, $resdate);

        $counter++;

my $resp_time = Business_Hours($year1, $month1, $day1, $hour1, $min1, $sec1,
                              $year2, $month2, $day2, $hour2, $min2, $sec2);

        my ($hr, $min, $sec)  = split( /:/, $resp_time);
        my $res_min = $hr * 60 + $min;

        

        if ($res_min < 0) {
           push(@rows2, "<th>Bad</th><td>ID:$trouble[0]  RM:$res_min" );
           $list[0] = ++$count0;
        } elsif ($res_min <= 60) {
            $list[1] = ++$count1;
        } elsif ($res_min <= 120) { 
            $list[2] = ++$count2;
        } elsif ($res_min <= 180) { 
            $list[3] = ++$count3;
        } elsif ($res_min <= 240) { 
             $list[4] = ++$count4;
        } else {
            $list[5] = ++$count5;
        }
 
     } # End While

$sth->finish;

$list[0] ||= '0';
$list[1] ||= '0';
$list[2] ||= '0';
$list[3] ||= '0';
$list[4] ||= '0';
$list[5] ||= '0';

push(@rows2, "<th>1 Hrs or Less</th><td>$list[1]" );
push(@rows2, "<th>1 to 2 Hrs</th><td>$list[2]" );
push(@rows2, "<th>2 to 3 Hrs</th><td>$list[3]" );
push(@rows2, "<th>3 to 4 Hrs</th><td>$list[4]" );
push(@rows2, "<th>More than 4 Hrs</th><td>$list[5]" );


# Start Trouble Tracking NON ODIN

$sql =  qq[ SELECT T.ID, T.date, T.closedate, T.status, T.contents,
  C.NEMS, C.type, C.os, C.building, C.room, C.user, C.owner, C.groupname 
                 FROM tracking T, computer C
                WHERE date BETWEEN "$startdate" AND "$enddate" AND
                      T.groupname NOT LIKE "YAA" AND
                      C.computer_id = T.computer_id 
             ORDER BY T.ID ];

     $sth = $dbh->prepare( $sql );

     # $trouble[0] = T.ID
     # $trouble[1] = T.date
     # $trouble[2] = T.closedate
     # $trouble[3] = T.status
     # $trouble[4] = T.contents
     # $trouble[5] = C.NEMS
     # $trouble[6] = C.type
     # $trouble[7] = C.os
     # $trouble[8] = C.building
     # $trouble[9] = C.room
     # $trouble[10] = C.user
     # $trouble[11] = C.owner
     # $trouble[12] = C.groupname

     $sth->execute();

     while ( my @trouble = $sth->fetchrow_array() ) {

       my $resdate = $dbh->selectrow_array(
                                qq[ SELECT date
                                      FROM followups
                                     WHERE tracking = "$trouble[0]"
                                     ORDER BY date ASC
                                     LIMIT 1 ]
                        );


      if ($trouble[3] eq 'new' ) {
         $error .= "$trouble[0]: $trouble[3]<br>";
         next;
      }

      if ( (! $resdate) or ($resdate eq '0000-00-00 00:00:00') ) {
         $error .= "$trouble[0]: No Followup or Bad Date<br>";
         next;
      }

       $group_count{$trouble[12]}++;

my($year1, $month1, $day1, $hour1, $min1, $sec1) = split(/[- :i]/, $trouble[1]);
my($year2, $month2, $day2, $hour2, $min2, $sec2) = split(/[- :i]/, $resdate);

my $resp_time = Business_Hours($year1, $month1, $day1, $hour1, $min1, $sec1,
                              $year2, $month2, $day2, $hour2, $min2, $sec2);

       $counter1++;

       # 1st Line
       my $row  = th('Call ID:') . td($trouble[0]);
          $row .= th('Response Time:') . td("$resp_time");
          $row .= th('Start:') . td("$year1-$month1-$day1 $hour1:$min1:$sec1");
          $row .= th('Response:') . td($resdate);

       push(@rows, $row);

       # 2nd Line
          $row  = th('NEMS:') . td($trouble[5]);
          $row .= th('Equip Type:') . td($trouble[6]);
          $row .= th('OS:') . td($trouble[7]);
          $row .= th('Status:') . td($trouble[3]);

       push(@rows, $row); 

       #3rd Line
       $row = $trouble[10] ? th('User:').td($trouble[10]) :
                             th('Owner:').td($trouble[11]);
  
       $row .= th('Building:') . td($trouble[8]);
       $row .= th('Group:') . td($trouble[12]);
    #  $row .= th('Room:') . td($trouble[9]);
       $row .= th('Close:') . td($trouble[2]);

       push(@rows, $row); 

       # 4th Line
       $row = th('Details:') . td({-colspan=>'7'}, $trouble[4]);
       push(@rows, $row); 

       # 5th Line
       $row = td({-class=>'Break', -colspan=>'8'}, '&nbsp;');
       push(@rows, $row); 

    } # End Trouble While

# Start Trouble Tracking ODIN

$sql =  qq[ SELECT T.ID, T.date, T.closedate, T.status, T.contents,
 O.ODIN_NUMBER, O.type, O.os, O.building, O.room, O.owner, O.owner, O.groupname 
                 FROM tracking T, odin O
                WHERE date BETWEEN "$startdate" AND "$enddate" AND
                      T.groupname NOT LIKE "YAA" AND
                      O.odin_id = T.computer_id 
             ORDER BY T.ID ];

     $sth = $dbh->prepare( $sql );

     # $trouble[0] = T.ID
     # $trouble[1] = T.date
     # $trouble[2] = T.closedate
     # $trouble[3] = T.status
     # $trouble[4] = T.contents
     # $trouble[5] = O.NEMS
     # $trouble[6] = O.type
     # $trouble[7] = O.os
     # $trouble[8] = O.building
     # $trouble[9] = O.room
     # $trouble[10] = O.owner
     # $trouble[11] = O.owner
     # $trouble[12] = O.groupname

     $sth->execute();

     while ( my @trouble = $sth->fetchrow_array() ) {

       my $resdate = $dbh->selectrow_array(
                                qq[ SELECT date
                                      FROM followups
                                     WHERE tracking = "$trouble[0]"
                                     ORDER BY date ASC
                                     LIMIT 1 ]
                        );


      if ($trouble[3] eq 'new' ) {
         $error .= "$trouble[0]: $trouble[3]<br>";
         next;
      }

      if ( (! $resdate) or ($resdate eq '0000-00-00 00:00:00') ) {
         $error .= "$trouble[0]: No Followup or Bad Date<br>";
         next;
      }

       $group_count{$trouble[12]}++;

my($year1, $month1, $day1, $hour1, $min1, $sec1) = split(/[- :i]/, $trouble[1]);
my($year2, $month2, $day2, $hour2, $min2, $sec2) = split(/[- :i]/, $resdate);

my $resp_time = Business_Hours($year1, $month1, $day1, $hour1, $min1, $sec1,
                              $year2, $month2, $day2, $hour2, $min2, $sec2);

       $counter1++;

       # 1st Line
       my $row  = th('Call ID:') . td($trouble[0]);
          $row .= th('Response Time:') . td("$resp_time");
          $row .= th('Start:') . td("$year1-$month1-$day1 $hour1:$min1:$sec1");
          $row .= th('Response:') . td($resdate);

       push(@rows3, $row);

       # 2nd Line
          $row  = th('NEMS:') . td($trouble[5]);
          $row .= th('Equip Type:') . td($trouble[6]);
          $row .= th('OS:') . td($trouble[7]);
          $row .= th('Status:') . td($trouble[3]);

       push(@rows3, $row); 

       #3rd Line
       $row = $trouble[10] ? th('User:').td($trouble[10]) :
                             th('Owner:').td($trouble[11]);
  
       $row .= th('Building:') . td($trouble[8]);
       $row .= th('Group:') . td($trouble[12]);
    #  $row .= th('Room:') . td($trouble[9]);
       $row .= th('Close:') . td($trouble[2]);

       push(@rows3, $row); 

       # 4th Line
       $row = th('Details:') . td({-colspan=>'7'}, $trouble[4]);
       push(@rows3, $row); 

       # 5th Line
       $row = td({-class=>'Break', -colspan=>'8'}, '&nbsp;');
       push(@rows3, $row); 

    } # End Trouble While

$sth->finish;

$dbh->disconnect;

# Build rows for "Number of Trouble Calls per Group"
foreach ( sort keys %group_count ) {
   push(@rows1, "<th>$_</th><td>$group_count{$_}</td>");
}


# Setup StyleSheet
$newStyle=<<END;
<!-- 
   Th {
      font-family: Arial, Helvetica, sans-serif;
      font-size: 10pt;
      font-weight: bold;
      background-color: #D3DCE3;
   }

  Td.Break {
     background-color: #EEEEEE;
     }
-->
END

print header;

print start_html( -title=>'TS Trouble Tracking Report',
                  -style=>{-code=>$newStyle}
	         );

print h1("TS Trouble Tracking Report For $month_name $year [Calls: $counter]");

print qq(<table border="0" width="100%" cellpadding="2" cellspacing="2">);
print "<tr>";

print "<td align = 'center'>";

print h3("Response Times");

print p(table({-border=>1,-cellpadding=>'2',-cellspacing=>'2'},
            Tr(\@rows2)
           ));

print "</td>";

print "<td align = 'center'>";

print "<h3>Number of Trouble Calls per Group</h3>";
print p(table({-border=>1,-cellpadding=>'2',-cellspacing=>'2'},
            Tr(\@rows1)
           ));

print "</td>";

print "</tr>";
print "</table>";


# Non-ODIN list
print q(<div align = "center"><h3>Individual Trouble Calls</h3></div>);

$error && print qq(<div align = "center"><h4>New Calls are NOT Displayed!</h4></div>);     
$error && print qq(<div align = "center"><h4>$error</h4></div>);

print p(table({-border=>1,-width=>'100%',-cellpadding=>'2',-cellspacing=>'2'},
            Tr(\@rows)
           ));

# ODIN list
if ( @rows3 ) {
print q(<div align = "center"><h3>Individual ODIN Customers Trouble Calls</h3></div>);

print p(table({-border=>1,-width=>'100%',-cellpadding=>'2',-cellspacing=>'2'},
            Tr(\@rows3)
           ));
} # End ODIN


print end_html;

