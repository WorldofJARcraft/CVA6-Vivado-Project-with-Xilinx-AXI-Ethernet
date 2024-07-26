puts "Opening project"
open_project project/RVSoC.xpr
puts "Resetting last run"
reset_run impl_1
puts "Launching runs"
launch_runs impl_1 -jobs 64
puts "Waiting for runs to complete"
wait_on_runs impl_1
puts "Generating bitstream"
launch_runs impl_1 -to_step write_bitstream
puts "Waiting for runs to complete"
wait_on_runs impl_1
