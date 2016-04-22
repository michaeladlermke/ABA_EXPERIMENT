#NOTE -- These variables can be changed to suit your experiment requirements

# Debugging flags
$debug = "true"; 
$debug_takescreenshots = "true";

# Experimental parameters
$deficientTR = '$TR - 20';		# This gives a little wiggle room so that the experiment will be able to sync to the pulses
$feedback = 1000;
$eye_tracking_fixation = 1;		# This is the length of the fixation before every trial
											# in the eye tracking version
$eye_tracking_blank = 1;			# This is the blank after a trial in the eye tracking version
$short_fixation_time = 1000;		# Time duration with cross image before automatically entering into a block's run
$num_blocks_per_run = 3;			# The number of experimental blocks per fMRI run
$total_runs = 7;						# The number of fMRI runs
$break_duration = 60;				# seconds
$spacebar_button = 3;				# seconds

# 	The FLASHBLOCK variable can be modified to change 
#	the block you want the flashing target to be present in
#	To turn off flash, make this variable less than zero
#	Setting this variable to zero turns the flash on for the practice block
$flashBlock = 10;


# INFORMED OR UNINFORMED EXPERIMENT
#	These options allow you to set the experiment to inform a test taker
#	that patterns will repeat themselves and that the patterns have switched
#	If switched = 1, then informed must be set to 1 as well to have the screen appear
$informed = 1;		#when set to "1", the test taker will be informed when a pattern repeats
$switched = 1;		#when set to "1", the test taker will be informed when the pattern switches

#	The text below is what will appear on the informed / switched screens
#	You can split text to a new line using \n\
$informedScreen = "THIS IS THE \n\INFORMED SCREEN TEXT";
$switchedScreen = "THIS IS THE \n\SWITCHED SCREEN TEXT";

# THIS CONTROLS THE FLASHING TARGET IMAGE IN FLASHING BLOCK
$image_on = 100;	# at block ten, flash the image on this many ms
$image_off = 50;	# at block ten, flash the image off this many ms

#active buttons = 4;
#button_codes = 1, 2, 3, 4;
# Things you should only change if you know what you're doing
$num_lists = 20;



      

$gray_calibration_screen = "125, 125, 125";  # the default_background_color for calibraton screen
$gray = "150, 150, 160";
$black = "0, 0, 0";
$white = "255, 255, 255";
$red = "255, 0, 0";
$green = "0, 255, 0";



# Individual T and L bitmaps

bitmap { filename = "grayFlash.gif"; } flashGray;

bitmap { filename = "tlr.bmp"; } tlr;
bitmap { filename = "tlg.bmp"; } tlg;
bitmap { filename = "tlb.bmp"; } tlb;
bitmap { filename = "tly.bmp"; } tly;
bitmap { filename = "trr.bmp"; } trr;
bitmap { filename = "trg.bmp"; } trg;
bitmap { filename = "trb.bmp"; } trb;
bitmap { filename = "try.bmp"; } try;

bitmap { filename = "l0r.bmp"; } l0r;
bitmap { filename = "l0g.bmp"; } l0g;
bitmap { filename = "l0b.bmp"; } l0b;
bitmap { filename = "l0y.bmp"; } l0y;
bitmap { filename = "l1r.bmp"; } l1r;
bitmap { filename = "l1g.bmp"; } l1g;
bitmap { filename = "l1b.bmp"; } l1b;
bitmap { filename = "l1y.bmp"; } l1y;
bitmap { filename = "l2r.bmp"; } l2r;
bitmap { filename = "l2g.bmp"; } l2g;
bitmap { filename = "l2b.bmp"; } l2b;
bitmap { filename = "l2y.bmp"; } l2y;
bitmap { filename = "l3r.bmp"; } l3r;
bitmap { filename = "l3g.bmp"; } l3g;
bitmap { filename = "l3b.bmp"; } l3b;
bitmap { filename = "l3y.bmp"; } l3y;



# Instructions
trial {
   trial_type = specific_response;
   terminator_button = 3;
   
	trial_duration = forever;
   picture{
   	text {font_size=18; font="Courier New Bold"; caption = "If you have any questions,\nplease ask now.";};
      x = 0; y = 175; 
      text {font_size=18; font="Courier New Bold"; caption = "The experiment will now begin";};
      x = 0; y = -200;
   };
} instructions_7;

# Recognizition test
# Did you notice any configuration repeated from block to block?  1-Yes, 2-No
# If no, skip recognition test
#
# If yes, 
# Did you explicitly try to memorize the patterns?  1-Yes, 2-No
#
# One block of 48 trials -- 12 repeated from set A, 12 repeated from set B, 12 novel already used, 12 novel completely new

trial {
   trial_type = specific_response;
   terminator_button = 1,2;
   
	trial_duration = forever;

   picture{
   	text {font_size=18; font="Courier New Bold"; caption = "Did you notice any configuration repeated from block to block?  1-Yes, 2-No";};
      x = 0; y = 175; 
   };
} recog_instruct_1;



trial {
   trial_type = specific_response;
   terminator_button = 1,2;
   
	trial_duration = forever;

   picture{
   	text {font_size=18; font="Courier New Bold"; caption = "Did you explicitly try to memorize the patterns?  1-Yes, 2-No";};
      x = 0; y = 175; 
   };
} recog_instruct_2;



trial {
   trial_type = specific_response;
   terminator_button = 1,2;
   
	trial_duration = forever;

   picture{
   	text {font_size=18; font="Courier New Bold"; caption = "You will now see a series of screens.\n\nSome of the screens were presented in each block of the past test,
		and some of the screens are new.\n\nCan you identify which screens are repeated, and which are novel?\n\n\n 1-I have never seen it before, 2-I have seen it before";};
      x = 0; y = 175; 
   };
} recog_instruct_3;



trial {
   trial_type = specific_response;
   terminator_button = 3;
   
	trial_duration = forever;

   picture{
   	text {font_size=18; font="Courier New Bold"; caption = "The experiment is complete.\n\nThank you for your participation.";};
      x = 0; y = 175; 
   };
} goodbye;



# Screen that is displayed while waiting for the scanner to start
trial {
   trial_duration = forever;
   trial_type = specific_response;
   terminator_button = $pulse_button;
    picture{
      text {font_size=18; font="Courier New Bold"; caption = "An experimental block is about to begin";} startblock_text;
      x = 0; y = 0; 
    };
} startblock; 



# Screen that is displayed at the end of each fMRI run
trial {     
    picture {
      text {font_size=18; font="Courier New Bold"; caption = "Please wait for the next block to begin...";}stopblocktext;
      x = 0; y = 0; 
    };
} stopblock;



trial {     
   trial_duration = 1000;
   
    picture {
      text {font_size=18; font="Courier New Bold"; caption = "10";} countdown_text;
      x = 0; y = 0; 
    };
} countdown;



# Fixation trial
trial {
   
   trial_type = specific_response;
   terminator_button = 3;

	trial_duration = forever;

   stimulus_event {
		##### Change location of fixation here:
		picture { background_color = $gray; text { 
			caption = "+"; 
			font_size = 55; 
			background_color=$gray; 
			font_color=$black;
		}; x=0; y=0;} fix_dot;
		code = "fixation";
   } fixation_event;
} fixation;

# Informed User Screen
trial {
   
   trial_type = specific_response;
   terminator_button = 3;

	trial_duration = forever;

   stimulus_event {
		picture { 
			background_color = $gray; 
		text { 
			caption = $informedScreen; 
			font_size = 25; 
			background_color=$gray; 
			font_color=$black;
		}; x=0; y=0;} informed_text;
		code = "informed";
   } informed_event;
} informed;

# Switched Pattern User Screen
trial {
   
   trial_type = specific_response;
   terminator_button = 3;

	trial_duration = forever;

   stimulus_event {
		picture { 
			background_color = $gray; 
		text { 
			caption = $switchedScreen; 
			font_size = 25; 
			background_color=$gray; 
			font_color=$black;
		}; x=0; y=0;} switched_text;
		code = "switched";
   } switched_event;
} switched;


trial {
  
  #trial_duration = $feedback;

   trial_type = specific_response;
   terminator_button = 3;

	trial_duration = $short_fixation_time;

   stimulus_event {
		picture fix_dot;
		code = "fixation";
   };
 } short_fixation;



trial {
   trial_duration = $eye_tracking_blank;
   stimulus_event {
		picture { background_color = $gray; };
		code = "blank";
   };
} blank;



trial {
   trial_duration = $deficientTR;
   stimulus_event {
		picture { background_color = $gray; };
		code = "blank_fixation";
   };
} full_blank;



# Feedback screens

trial { 
   trial_duration = $feedback;
   picture {
      background_color = $gray;
      text {font_size=36; font="Courier New Bold"; background_color = $gray; caption = "INCORRECT"; font_color = $red;};
      x = 0; y = 0;
   };
	code = "incorrect";   
} wrong_trial;

trial { 
   trial_duration = $feedback;
   picture {
      background_color = $gray;
      text {font_size=36; font="Courier New Bold"; background_color = $gray; caption = "CORRECT"; font_color = $green;};
      x = 0; y = 0;
   };
	code = "correct";   
} correct_trial;

trial { 
   trial_duration = $feedback;
   picture {
      background_color = $gray;
      text {font_size=18; font="Courier New Bold"; background_color = $gray; caption = "No Response"; font_color = $red;};
      x = 0; y = 0;
   };
} noresponse_trial;



# Placeholder for the experimental trials
trial {
   #trial_duration = $deficientTR;
   
   trial_type = specific_response;
   terminator_button = 1,2;
   
	trial_duration = forever;
	
   stimulus_event {
		picture {  
			background_color = $gray;
			box { height = 1; width = 1;} box1;
			x = 0; y = 0; 
			box box1;     
			x = 0; y = 0;   
			box box1;     
			x = 0; y = 0;
			box box1;     
			x = 0; y = 0;
			box box1;     
			x = 0; y = 0;
			box box1;     
			x = 0; y = 0;
			box box1;     
			x = 0; y = 0;
			box box1;     
			x = 0; y = 0;
			box box1;     
			x = 0; y = 0;
			box box1;     
			x = 0; y = 0;
			box box1;     
			x = 0; y = 0;
			box box1;     
			x = 0; y = 0;
			text {font_size=18; font="Courier New Bold"; background_color=$gray; caption=" "; } exp_text; x=0; y=-275;
		} exp_picture;
   } exp_event;    
} exp_trial;


# Placeholder for the experimental trials
trial {
   #trial_duration = $deficientTR;
   
   trial_type = specific_response;
   terminator_button = 1,2;
   
	trial_duration = forever;
	
   stimulus_event {
		picture {  
			background_color = $gray;
			box { height = 1; width = 1;} box10; #item 1
			x = 0; y = 0; 
			box box10;     #item 2
			x = 0; y = 0;   
			box box10;     #item 3
			x = 0; y = 0;
			box box10;     #item 4
			x = 0; y = 0;
			box box10;     #item 5
			x = 0; y = 0;
			box box10;     #item 6
			x = 0; y = 0;
			box box10;     #item 7
			x = 0; y = 0;
			box box10;     #item 8
			x = 0; y = 0;
			box box10;     #item 9
			x = 0; y = 0;
			box box10;     #item 10
			x = 0; y = 0;
			box box10;     #item 11
			x = 0; y = 0;
			box box10;     #item 12
			x = 0; y = 0;
			text {font_size=18; font="Courier New Bold"; background_color=$gray; caption=" "; } exp_text1; x=0; y=-275;
		} exp_picture1;
   } exp_event1; 
		
   stimulus_event {		
		picture {  
			background_color = $gray;
			box { height = 1; width = 1;} box1_10; #ITEM 1
			x = 0; y = 0; 
			box box1_10;     	#ITEM 2
			x = 0; y = 0;   
			box box1_10;     	#ITEM 3
			x = 0; y = 0; 
			box box1_10;		#ITEM 4   
			x = 0; y = 0;
			box box1_10;     	#ITEM 5   
			x = 0; y = 0;
			box box1_10;     	#ITEM 6   
			x = 0; y = 0;
			box box1_10;     	#ITEM 7   
			x = 0; y = 0;
			box box1_10;     	#ITEM 8   
			x = 0; y = 0;
			box box1_10;     	#ITEM 9   
			x = 0; y = 0;
			box box1_10;     	#ITEM 10   
			x = 0; y = 0;
			box box1_10;     	#ITEM 11   
			x = 0; y = 0;			
			box { height = 1; width = 1;} flashBox;	#ITEM 12 IS GRAY BOX  
			x = 0; y = 0;
			text {font_size=18; font="Courier New Bold"; background_color=$gray; caption=" "; } exp_text_10; x=0; y=-275;
		} exp_picture_10;
   } exp_event_10; 

	LOOP $i 10000;
		picture exp_picture_10; #off screen time 
		duration = $image_off; 	# this number needs to be equal to deltat of next image
		deltat = $image_on;		# this number needs to be equal to duration of next image
			
		picture exp_picture1; 	#on screen time
		duration = $image_on;	# keep this duration / deltat flip flopped from 
		deltat = $image_off;		# exp_picture_10 in order to avoid gaps between imgs
	ENDLOOP;	
} exp_trial_10;



trial {
   trial_duration = forever;
   
	trial_type = specific_response;
   terminator_button = 3;  
   
	stimulus_event {
   picture { background_color = $white; text {font_size=18; font="Courier New Bold"; background_color = 255, 255, 255;
      caption = 
				"For the next block of displays, Please 
				respond by pressing the left key if you 
				think the stimulus was repeated during 
				the experiment and the right key if you 
				do not think it was\n\nLeft = Repeated\nRight = Never Repeated\n\nPress a key to start";
     }; 
   x=0; y=0;};
   };
} test_instructions;



trial {

   trial_type = specific_response;
   terminator_button = 3;
   
   trial_duration = forever;
   
picture { background_color = $gray;

#         text {
#         caption = "A" ;
#         font = "arial" ;
#         font_size = 24 ;
#      };
#      #x = -360;
#      x = -637;
#		#y = 270;
#		y = 370;
#      
#		text {
#         caption = "B" ;
#         font = "arial" ;
#         font_size = 24 ;
#      };
#      x = 0;
#      #y = 270;
#      y = 370;
#      
#		text {
#         caption = "C" ;
#         font = "arial" ;
#         font_size = 24 ;
#      };
#      #x = 360;
#      x = 637;
#		#y = 270;
#		y = 370;
#      
#		text {
#         caption = "D" ;
#         font = "arial" ;
#         font_size = 24 ;
#      };
#		#x = -360;
#      x = -637;
#		y = 0;
#      
#		text {
#         caption = "E" ;
#         font = "arial" ;
#         font_size = 24 ;
#      };
#      x = 0;
#      y = 0;
#      
#		text {
#         caption = "F" ;
#         font = "arial" ;
#         font_size = 24 ;
#      };
#      #x = 360;
#      x = 637;
#		y = 0;
#      
#		text {
#         caption = "G" ;
#         font = "arial" ;
#         font_size = 24 ;
#      };
#      #x = -360;
#      x = -637;
#		#y = -270;
#      y = -370;
#
#		text {
#         caption = "H" ;
#         font = "arial" ;
#         font_size = 24 ;
#      };
#      x = 0;
#      #y = -270;
#      y = -370;
#
#      text {
#         caption = "I" ;
#         font = "arial" ;
#         font_size = 24 ;
#      };
#      #x = 360;
#      x = 637;
#      #y = -270;
#      y = -370;
#
# };

      text {
         caption = "A" ;
         font = "arial" ;
         font_size = 18 ;
      };
      x = -582;
      y = 362;
      text {
         caption = "B" ;
         font = "arial" ;
         font_size = 18 ;
      };
      x = -2;
      y = 362;
      text {
         caption = "C" ;
         font = "arial" ;
         font_size = 18 ;
      };
      x = 562;
      y = 358;
      text {
         caption = "D" ;
         font = "arial" ;
         font_size = 18 ;
      };
      x = -588;
      y = -2;
      text {
         caption = "E" ;
         font = "arial" ;
         font_size = 18 ;
      };
      x = -8;
      y = -2;
      text {
         caption = "F" ;
         font = "arial" ;
         font_size = 18 ;
      };
      x = 562;
      y = -2;
      text {
         caption = "G" ;
         font = "arial" ;
         font_size = 18 ;
      };
      x = -582;
      y = -360;
      text {
         caption = "H" ;
         font = "arial" ;
         font_size = 18 ;
      };
      x = -14;
      y = -360;
      text {
         caption = "I" ;
         font = "arial" ;
         font_size = 18 ;
      };
      x = 562;
      y = -360;
   } ;   

	time = 0;
   code = "Calibration Screen" ;
   target_button = 3;
} calibration_screen;
