scenario = "CC-Switch-Behavioral_Youcai_eyetracker";
$Version = "Youcai_1.0";


$eye_tracker = "true";
$gray_calibration_screen = "125, 125, 125";  # the default_background_color for calibration screen
$TR = 3000;
# scenario_type = fMRI_emulation; 
scan_period = $TR;
$pulse_button = 1;


active_buttons = 3;
button_codes = 1, 2, 3;
default_background_color = 150, 150, 160;

begin;

TEMPLATE "CC-Core.sce";



begin_pcl;

sub string logfile_filename(string subj, string run) begin
	return "CC-Switch-Behavioral-v" + get_sdl_variable("Version") + "-" + subj + "-" + run + ".log";
end;

include "CC-Core.pcl";

totalruns = 1;
numblocksperrun = 27;

blockoff = pulse_manager.main_pulse_count();
   
string start_text = "Subject: " + Subject + "\nCurrent Run: " + string(CurrentRun);

	debug_print("Presenting runs...");	
	debug_print("Total runs: " + string(totalruns));
	
	
	
	#calibration_screen.present(); // calibration screen only needed when eye tracking is being done

	loop int run=1; until run>totalruns begin
		
		debug_print("Initializing...");
		logfile.set_filename(logfile_filename(Subject,string(run)));
		coord_file.open(logfile_filename(Subject,string(run))+"_stimcoord");
		
		load_subject_data(Subject + "_Run1");
				
		debug_print("Starting run " + string(run));
		int trial_num = 1;
		int list_num = 1;
		
		load_list(list_num);  #Loads all trials for the run
		
		debug_print("num_blocks_per_run = " + string(numblocksperrun));

		loop int i=StartingBlock; until i>numblocksperrun begin
			debug_print("Starting block #" + string(i));
			blockoff=blockoff+1;
			
			
			#in blocks less than 1, do a practice round
			#in block ten, run the flashing block (see CC-Core.pcl)
			if(i < 1) then
				run_block(run,i,trial_num);
				trial_num = trial_num + 24;
			end;
			if(i == flashBlock) then 
				run_block_10(run,i,trial_num);
				trial_num = trial_num + 24;
			else 
				run_block(run,i,trial_num);
				trial_num = trial_num + 24;
			end;
			
			stopblocktext.set_caption("End of Block "+string(i)+".  Please wait for the next block to begin...");
			stopblocktext.redraw();
			stopblock.set_duration(1000*10);
			stopblock.present();	
			
			#calibration_screen.present();	#this calibration screen is only needed when eye tracking
		
		i = i + 1;       
		end;
		
		

		recog_instruct_1.present();
		
		response_data last_resp;
		last_resp = response_manager.last_response_data();

		if (last_resp.button() == 1) then
			recog_instruct_2.present();
			recog_instruct_3.present();
			run_block_recog(1,28,649);		
		elseif (last_resp.button() == 2) then
			recog_instruct_3.present();
			run_block_recog(1,28,649);		
		end;	

		
		
		run = run + 1;
						
		coord_file.close();
		
		

		goodbye.present();

end;